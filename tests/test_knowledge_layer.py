#!/usr/bin/env python3
from __future__ import annotations

import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "knowledge"))
from authority_resolver import resolve  # noqa: E402


def load_seed():
    return (
        json.loads((ROOT / "knowledge" / "public-source-registry.json").read_text()),
        json.loads((ROOT / "knowledge" / "knowledge-cards.json").read_text()),
    )


def local_source(source_id="LOCAL-CONST-TEST", *, freshness="CURRENT_LOCAL_VERIFIED", expires_on=None):
    return {
        "id": source_id,
        "title": "TEST FIXTURE — local constitution rule",
        "publisher": "Synthetic test authority",
        "authority_class": "LOCAL_CONSTITUTION_OR_RULE",
        "source_type": "TEST_ONLY_SYNTHETIC_LOCAL_RULE",
        "jurisdiction": ["England"],
        "url": "test://local/constitution",
        "version_or_date": "TEST ONLY v1",
        "retrieved_on": "2026-09-24",
        "freshness": {
            "state": freshness,
            "checked_on": "2026-09-24",
            "expires_on": expires_on,
            "review_trigger": "test",
        },
        "reuse": {"mode": "TEST_ONLY"},
        "limitations": ["Synthetic test fixture; not a real organisation rule."],
    }


def source(source_id, authority, *, freshness="CURRENT_CHECKED", expires_on=None):
    return {
        "id": source_id,
        "title": f"TEST FIXTURE {source_id}",
        "publisher": "Synthetic test source",
        "authority_class": authority,
        "source_type": "TEST_ONLY_SYNTHETIC",
        "jurisdiction": ["England"],
        "url": f"test://{source_id}",
        "version_or_date": "TEST ONLY v1",
        "retrieved_on": "2026-09-24",
        "freshness": {
            "state": freshness,
            "checked_on": "2026-09-24",
            "expires_on": expires_on,
            "review_trigger": "test",
        },
        "reuse": {"mode": "TEST_ONLY"},
        "limitations": ["Synthetic test fixture only."],
    }


def card(card_id, authority, answer, source_id, *, freshness="CURRENT_CHECKED", expires_on=None):
    url = "test://local/constitution" if authority == "LOCAL_CONSTITUTION_OR_RULE" else f"test://{source_id}"
    return {
        "id": card_id,
        "question_key": "meeting.test_cutoff",
        "answer_key": answer,
        "proposition": f"TEST ONLY proposition {answer}",
        "authority_class": authority,
        "applicability": {
            "jurisdictions": ["England"],
            "organisation_scope": "TEST_ONLY",
            "organisation_id": "TEST-COUNCIL" if authority == "LOCAL_CONSTITUTION_OR_RULE" else None,
            "body_types": ["committee"],
            "topics": ["meeting_procedure"],
        },
        "limitations": ["Synthetic test fixture only."],
        "source_provenance": [{
            "source_id": source_id,
            "url": url,
            "version_or_date": "TEST ONLY v1",
            "retrieved_on": "2026-09-24",
            "freshness": freshness,
        }],
        "freshness": {
            "state": freshness,
            "checked_on": "2026-09-24",
            "expires_on": expires_on,
        },
    }


def context(**overrides):
    base = {
        "question_key": "meeting.test_cutoff",
        "jurisdiction": "England",
        "organisation_id": "TEST-COUNCIL",
        "body_type": "committee",
        "requires_local_rule": True,
    }
    base.update(overrides)
    return base


def test_seed_provenance():
    registry, cards = load_seed()
    result = resolve(
        registry,
        cards,
        {
            "question_key": "meeting.agenda_public_access",
            "jurisdiction": "England",
            "organisation_id": "TEST-COUNCIL",
            "body_type": "principal_council",
            "requires_local_rule": False,
        },
        as_of="2026-09-24",
    )
    assert result["status"] == "RESOLVED", result
    assert result["selected"][0]["card_id"] == "KC-LGA1972-AGENDA-ACCESS"
    provenance = result["selected_sources"][0]
    for required in (
        "source_id",
        "title",
        "publisher",
        "url",
        "version_or_date",
        "retrieved_on",
        "freshness",
    ):
        assert provenance.get(required), (required, provenance)
    assert provenance["url"].startswith("https://www.legislation.gov.uk/")


def test_professional_guidance_cannot_override_local_rule():
    registry = {"sources": [
        local_source(),
        source("PRO-GUIDANCE-TEST", "PROFESSIONAL_GUIDANCE"),
    ]}
    cards = {"cards": [
        card(
            "LOCAL-RULE-CARD",
            "LOCAL_CONSTITUTION_OR_RULE",
            "LOCAL_17_00",
            "LOCAL-CONST-TEST",
            freshness="CURRENT_LOCAL_VERIFIED",
        ),
        card(
            "PRO-CARD",
            "PROFESSIONAL_GUIDANCE",
            "PROFESSIONAL_12_00",
            "PRO-GUIDANCE-TEST",
        ),
    ]}
    result = resolve(registry, cards, context(), as_of="2026-09-24")
    assert result["status"] == "RESOLVED", result
    assert result["selected"][0]["card_id"] == "LOCAL-RULE-CARD"
    assert result["selected"][0]["authority_class"] == "LOCAL_CONSTITUTION_OR_RULE"
    assert [d["card_id"] for d in result["displaced_lower_authority"]] == ["PRO-CARD"]
    assert result["action_authority"] == "NONE_FROM_KNOWLEDGE_LAYER"


def test_stale_higher_authority_blocks_lower_substitution():
    registry = {"sources": [
        source("LAW-TEST", "APPLICABLE_LAW", expires_on="2026-09-23"),
        source("PRO-GUIDANCE-TEST", "PROFESSIONAL_GUIDANCE"),
    ]}
    cards = {"cards": [
        card("LAW-CARD", "APPLICABLE_LAW", "LAW_POSITION", "LAW-TEST", expires_on="2026-09-23"),
        card("PRO-CARD", "PROFESSIONAL_GUIDANCE", "PRO_POSITION", "PRO-GUIDANCE-TEST"),
    ]}
    result = resolve(
        registry,
        cards,
        context(requires_local_rule=False),
        as_of="2026-09-24",
    )
    assert result["status"] == "BLOCKED", result
    assert result["code"] == "STALE_HIGHER_AUTHORITY", result


def test_same_rank_conflict_blocks():
    registry = {"sources": [
        local_source("LOCAL-A"),
        local_source("LOCAL-B"),
    ]}
    cards = {"cards": [
        card(
            "LOCAL-A-CARD",
            "LOCAL_CONSTITUTION_OR_RULE",
            "A",
            "LOCAL-A",
            freshness="CURRENT_LOCAL_VERIFIED",
        ),
        card(
            "LOCAL-B-CARD",
            "LOCAL_CONSTITUTION_OR_RULE",
            "B",
            "LOCAL-B",
            freshness="CURRENT_LOCAL_VERIFIED",
        ),
    ]}
    result = resolve(registry, cards, context(), as_of="2026-09-24")
    assert result["status"] == "BLOCKED", result
    assert result["code"] == "SAME_RANK_CONFLICT", result


def test_missing_local_rule_blocks():
    registry = {"sources": [source("LAW-TEST", "APPLICABLE_LAW")]}
    cards = {"cards": [
        card("LAW-CARD", "APPLICABLE_LAW", "LAW_POSITION", "LAW-TEST"),
    ]}
    result = resolve(registry, cards, context(), as_of="2026-09-24")
    assert result["status"] == "BLOCKED", result
    assert result["code"] == "MISSING_LOCAL_RULE", result


def test_invalid_orphan_provenance_fails_closed():
    registry = {"sources": [
        source("PRO-GUIDANCE-TEST", "PROFESSIONAL_GUIDANCE"),
    ]}
    cards = {"cards": [
        card("BROKEN", "PROFESSIONAL_GUIDANCE", "X", "MISSING-SOURCE"),
    ]}
    result = resolve(
        registry,
        cards,
        context(requires_local_rule=False),
        as_of="2026-09-24",
    )
    assert result["status"] == "BLOCKED", result
    assert result["code"] == "INVALID_KNOWLEDGE", result


def test_law_local_conflict_refers():
    registry = {"sources": [
        source("LAW-TEST", "APPLICABLE_LAW"),
        local_source(),
    ]}
    cards = {"cards": [
        card("LAW-CARD", "APPLICABLE_LAW", "LAW_POSITION", "LAW-TEST"),
        card(
            "LOCAL-CARD",
            "LOCAL_CONSTITUTION_OR_RULE",
            "LOCAL_POSITION",
            "LOCAL-CONST-TEST",
            freshness="CURRENT_LOCAL_VERIFIED",
        ),
    ]}
    result = resolve(registry, cards, context(), as_of="2026-09-24")
    assert result["status"] == "BLOCKED", result
    assert result["code"] == "LAW_LOCAL_CONFLICT", result
    assert result["refer"] is True


def test_bibliographic_only_not_ingested_into_cards():
    registry, cards = load_seed()
    bibliography = {
        source["id"]
        for source in registry["sources"]
        if source["freshness"]["state"] == "BIBLIOGRAPHIC_ONLY"
    }
    used = {
        provenance["source_id"]
        for card_record in cards["cards"]
        for provenance in card_record["source_provenance"]
    }
    assert "CGI-KNOWLES-8" in bibliography
    assert bibliography.isdisjoint(used), (bibliography, used)


TESTS = [
    test_seed_provenance,
    test_professional_guidance_cannot_override_local_rule,
    test_stale_higher_authority_blocks_lower_substitution,
    test_same_rank_conflict_blocks,
    test_missing_local_rule_blocks,
    test_invalid_orphan_provenance_fails_closed,
    test_law_local_conflict_refers,
    test_bibliographic_only_not_ingested_into_cards,
]


if __name__ == "__main__":
    for test in TESTS:
        test()
        print(f"PASS {test.__name__}")
    print(f"PASS {len(TESTS)}/{len(TESTS)}")
