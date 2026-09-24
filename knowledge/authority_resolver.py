#!/usr/bin/env python3
"""Deterministic authority resolver for the Modern Democratic Services knowledge layer.

This module resolves already-structured propositions. It does not scrape the web, interpret
law, grant permission, or convert public reference material into organisational authority.
"""
from __future__ import annotations

from copy import deepcopy
from datetime import date
from typing import Any, Dict, List, Tuple

AUTHORITY_ORDER = (
    "APPLICABLE_LAW",
    "LOCAL_CONSTITUTION_OR_RULE",
    "COMPETENT_OFFICIAL_GUIDANCE",
    "PROFESSIONAL_GUIDANCE",
    "COMPARATOR_PRACTICE",
    "TOOL_VENDOR_MATERIAL",
)
AUTHORITY_RANK = {name: rank for rank, name in enumerate(AUTHORITY_ORDER)}
FRESH = {"CURRENT_CHECKED", "CURRENT_LOCAL_VERIFIED"}


def _blocked(code: str, *, detail: str, **extra: Any) -> Dict[str, Any]:
    result = {
        "status": "BLOCKED",
        "code": code,
        "detail": detail,
        "action_authority": "NONE_FROM_KNOWLEDGE_LAYER",
        "selected": [],
        "selected_sources": [],
        "displaced_lower_authority": [],
        "excluded": [],
        "refer": True,
    }
    result.update(extra)
    return result


def _parse_day(value: str | None) -> date | None:
    if not value:
        return None
    return date.fromisoformat(value)


def _freshness_state(record: Dict[str, Any], as_of: date) -> str:
    freshness = record.get("freshness") or {}
    state = freshness.get("state", "RECHECK_REQUIRED")
    expires = _parse_day(freshness.get("expires_on"))
    if expires and as_of > expires:
        return "STALE"
    return state


def _validate(registry: Dict[str, Any], card_set: Dict[str, Any]) -> List[str]:
    errors: List[str] = []
    sources = registry.get("sources")
    cards = card_set.get("cards")
    if not isinstance(sources, list) or not isinstance(cards, list):
        return ["registry.sources and cards.cards must both be lists"]

    source_ids = [s.get("id") for s in sources]
    if None in source_ids or len(source_ids) != len(set(source_ids)):
        errors.append("source IDs must be present and unique")
    source_map = {s.get("id"): s for s in sources if s.get("id")}

    card_ids = [c.get("id") for c in cards]
    if None in card_ids or len(card_ids) != len(set(card_ids)):
        errors.append("card IDs must be present and unique")

    for source in sources:
        if source.get("authority_class") not in AUTHORITY_RANK:
            errors.append(f"source {source.get('id')} has unknown authority_class")
        if not source.get("url") or not source.get("version_or_date") or not source.get("retrieved_on"):
            errors.append(f"source {source.get('id')} lacks provenance fields")

    for card in cards:
        if card.get("authority_class") not in AUTHORITY_RANK:
            errors.append(f"card {card.get('id')} has unknown authority_class")
        prov = card.get("source_provenance")
        if not isinstance(prov, list) or not prov:
            errors.append(f"card {card.get('id')} has no source_provenance")
            continue
        for p in prov:
            sid = p.get("source_id")
            source = source_map.get(sid)
            if not source:
                errors.append(f"card {card.get('id')} references unknown source {sid}")
                continue
            for field in ("url", "version_or_date", "retrieved_on", "freshness"):
                if not p.get(field):
                    errors.append(f"card {card.get('id')} provenance {sid} lacks {field}")
            if p.get("url") != source.get("url"):
                errors.append(f"card {card.get('id')} provenance URL disagrees with registry for {sid}")
            if card.get("authority_class") != source.get("authority_class"):
                errors.append(
                    f"card {card.get('id')} authority_class disagrees with registry source {sid}"
                )
            for field in ("version_or_date", "retrieved_on"):
                if p.get(field) != source.get(field):
                    errors.append(
                        f"card {card.get('id')} provenance {field} disagrees with registry for {sid}"
                    )
            source_freshness = (source.get("freshness") or {}).get("state")
            if p.get("freshness") != source_freshness:
                errors.append(
                    f"card {card.get('id')} provenance freshness disagrees with registry for {sid}"
                )
    return errors


def _matches(card: Dict[str, Any], context: Dict[str, Any]) -> bool:
    if card.get("question_key") != context.get("question_key"):
        return False

    app = card.get("applicability") or {}
    jurisdictions = app.get("jurisdictions") or []
    if jurisdictions and context.get("jurisdiction") not in jurisdictions:
        return False

    body_types = app.get("body_types") or []
    if body_types and context.get("body_type") not in body_types:
        return False

    if card.get("authority_class") == "LOCAL_CONSTITUTION_OR_RULE":
        expected = context.get("organisation_id")
        actual = app.get("organisation_id")
        if not expected or actual != expected:
            return False
    return True


def _provenance(card: Dict[str, Any], source_map: Dict[str, Dict[str, Any]]) -> List[Dict[str, Any]]:
    out = []
    for p in card["source_provenance"]:
        source = source_map[p["source_id"]]
        out.append({
            "source_id": source["id"],
            "title": source["title"],
            "publisher": source["publisher"],
            "authority_class": source["authority_class"],
            "url": source["url"],
            "version_or_date": source["version_or_date"],
            "retrieved_on": source["retrieved_on"],
            "freshness": deepcopy(source["freshness"]),
            "reuse": deepcopy(source.get("reuse", {})),
        })
    return out


def resolve(
    registry: Dict[str, Any],
    card_set: Dict[str, Any],
    context: Dict[str, Any],
    *,
    as_of: str,
) -> Dict[str, Any]:
    """Resolve one exact question_key against merged public + authorised local knowledge."""
    errors = _validate(registry, card_set)
    if errors:
        return _blocked(
            "INVALID_KNOWLEDGE",
            detail="Knowledge input failed structural/provenance validation.",
            validation_errors=errors,
        )

    if not context.get("question_key") or not context.get("jurisdiction"):
        return _blocked("INVALID_CONTEXT", detail="question_key and jurisdiction are required.")

    try:
        as_of_day = _parse_day(as_of)
    except ValueError:
        return _blocked("INVALID_CONTEXT", detail="as_of must be an ISO date.")
    if as_of_day is None:
        return _blocked("INVALID_CONTEXT", detail="as_of must be an ISO date.")

    sources = {s["id"]: s for s in registry["sources"]}
    matching = [c for c in card_set["cards"] if _matches(c, context)]
    if not matching:
        return _blocked(
            "NO_APPLICABLE_KNOWLEDGE",
            detail="No knowledge card matches the exact question and applicability context.",
        )

    usable: List[Dict[str, Any]] = []
    excluded: List[Dict[str, Any]] = []
    stale_or_nonoperational: List[Tuple[Dict[str, Any], str]] = []

    for card in matching:
        card_state = _freshness_state(card, as_of_day)
        source_states = [
            _freshness_state(sources[p["source_id"]], as_of_day)
            for p in card["source_provenance"]
        ]
        states = [card_state] + source_states
        bad_state = next((state for state in states if state not in FRESH), None)
        if bad_state:
            stale_or_nonoperational.append((card, bad_state))
            excluded.append({"card_id": card["id"], "reason": bad_state})
        else:
            usable.append(card)

    if context.get("requires_local_rule"):
        local_matching = [
            c for c in matching
            if c["authority_class"] == "LOCAL_CONSTITUTION_OR_RULE"
        ]
        local_usable = [
            c for c in usable
            if c["authority_class"] == "LOCAL_CONSTITUTION_OR_RULE"
        ]
        if not local_matching:
            return _blocked(
                "MISSING_LOCAL_RULE",
                detail="The question requires a verified local constitution/rule, but none was supplied.",
                excluded=excluded,
            )
        if not local_usable:
            return _blocked(
                "LOCAL_RULE_NOT_CURRENT",
                detail="A local rule was supplied but is stale, unverified or otherwise non-operational.",
                excluded=excluded,
            )

    if not usable:
        return _blocked(
            "NO_CURRENT_APPLICABLE_KNOWLEDGE",
            detail="Applicable knowledge exists but none is current enough for operational use.",
            excluded=excluded,
        )

    best_usable_rank = min(AUTHORITY_RANK[c["authority_class"]] for c in usable)
    higher_stale = [
        (card, state) for card, state in stale_or_nonoperational
        if AUTHORITY_RANK[card["authority_class"]] < best_usable_rank
    ]
    if higher_stale:
        return _blocked(
            "STALE_HIGHER_AUTHORITY",
            detail="A higher-authority applicable source is stale/non-operational; lower authority cannot silently substitute for it.",
            excluded=excluded,
            stale_higher=[
                {
                    "card_id": card["id"],
                    "state": state,
                    "authority_class": card["authority_class"],
                }
                for card, state in higher_stale
            ],
        )

    top = [
        c for c in usable
        if AUTHORITY_RANK[c["authority_class"]] == best_usable_rank
    ]
    top_answers = {c.get("answer_key") for c in top}
    if len(top_answers) > 1:
        return _blocked(
            "SAME_RANK_CONFLICT",
            detail="Equally ranked applicable knowledge cards disagree; professional/local resolution is required.",
            conflict_cards=[c["id"] for c in top],
            excluded=excluded,
        )

    selected = top
    selected_answer = next(iter(top_answers))

    if selected[0]["authority_class"] == "APPLICABLE_LAW":
        conflicting_local = [
            c for c in usable
            if c["authority_class"] == "LOCAL_CONSTITUTION_OR_RULE"
            and c.get("answer_key") != selected_answer
        ]
        if conflicting_local:
            return _blocked(
                "LAW_LOCAL_CONFLICT",
                detail="Applicable law and a verified local rule appear to disagree. Do not auto-apply either interpretation; refer to competent governance/legal advice.",
                conflict_cards=[selected[0]["id"]] + [c["id"] for c in conflicting_local],
                excluded=excluded,
            )

    displaced = [
        {
            "card_id": c["id"],
            "authority_class": c["authority_class"],
            "answer_key": c.get("answer_key"),
            "reason": "LOWER_AUTHORITY_CONFLICT",
        }
        for c in usable
        if AUTHORITY_RANK[c["authority_class"]] > best_usable_rank
        and c.get("answer_key") != selected_answer
    ]

    selected_sources = []
    for card in selected:
        selected_sources.extend(_provenance(card, sources))

    return {
        "status": "RESOLVED",
        "code": "RESOLVED_BY_AUTHORITY",
        "question_key": context["question_key"],
        "selected": [
            {
                "card_id": c["id"],
                "authority_class": c["authority_class"],
                "answer_key": c.get("answer_key"),
                "proposition": c.get("proposition"),
                "limitations": deepcopy(c.get("limitations", [])),
            }
            for c in selected
        ],
        "selected_sources": selected_sources,
        "displaced_lower_authority": displaced,
        "excluded": excluded,
        "action_authority": "NONE_FROM_KNOWLEDGE_LAYER",
        "refer": False,
        "integrity_note": "Resolution ranks evidence; it does not grant permission, replace local professional judgement or create organisational authority.",
    }
