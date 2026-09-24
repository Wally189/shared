# Democratic Services Knowledge Layer — schema and authority rules

> **PUBLIC REFERENCE / NO ORGANISATIONAL AUTHORITY.** This layer structures evidence. It does not create law, delegation, policy, permission or an instruction merely because it is public.

## Purpose

Give the existing ten Modern Democratic Services engines one shared, provenance-rich knowledge service without creating a new specialist engine.

`PUBLIC SOURCES + AUTHORISED LOCAL OVERLAY → KNOWLEDGE CARDS → AUTHORITY RESOLVER → CASE BUS KNOWLEDGE CONTEXT → EXISTING ENGINE / COALITION`

The deterministic resolver ranks already-structured propositions. It does **not** scrape sources, interpret ambiguous law, decide whether an organisation is legally within scope, or authorise workplace action.

## Authority order

1. `APPLICABLE_LAW`
2. `LOCAL_CONSTITUTION_OR_RULE`
3. `COMPETENT_OFFICIAL_GUIDANCE`
4. `PROFESSIONAL_GUIDANCE`
5. `COMPARATOR_PRACTICE`
6. `TOOL_VENDOR_MATERIAL`

This order is a resolution discipline, not a claim that every source in a higher class always decides every question. Applicability must be established first. A local constitution/rule cannot override applicable law. Where applicable law and a verified local rule appear to conflict, the resolver returns `LAW_LOCAL_CONFLICT` and refers rather than silently choosing a legal interpretation.

## Public Knowledge Source Registry

`public-source-registry.json` records:

- stable source ID;
- exact title and responsible publisher;
- authority class and source type;
- jurisdiction;
- canonical source URL;
- version/date and retrieval date;
- freshness state and review trigger;
- reuse/copyright posture;
- limitations.

`BIBLIOGRAPHIC_ONLY` sources may be known to the system but cannot supply operational propositions.

## Knowledge Card

Each card records:

- stable card ID;
- `question_key` — the exact proposition family being resolved;
- `answer_key` — a deterministic position token used to detect conflict;
- plain-English proposition;
- applicability: jurisdiction, organisation scope, body type and topic;
- authority class;
- limitations;
- source URL/version/date/retrieval/freshness snapshot;
- card freshness.

Cards are deliberately small. They do not bulk-copy source works.

## Local overlay

The public repository does not contain organisation-specific constitutions, standing orders, delegations or private process documents.

In an authorised workplace session, local sources/cards may be merged into the same in-memory structures. A `LOCAL_CONSTITUTION_OR_RULE` card must carry the exact `organisation_id` used in the Case Bus and must be verified/current. If the question is local-procedure-dependent and no current local rule is supplied, the resolver returns `MISSING_LOCAL_RULE`.

## Freshness behaviour

Current states:
- `CURRENT_CHECKED`
- `CURRENT_LOCAL_VERIFIED`

Non-operational states:
- `RECHECK_REQUIRED`
- `STALE`
- `WITHDRAWN`
- `BIBLIOGRAPHIC_ONLY`

An expired or non-current higher-authority card blocks silent substitution by lower authority (`STALE_HIGHER_AUTHORITY`).

## Conflict behaviour

- same-rank disagreement → `SAME_RANK_CONFLICT`;
- apparent law/local-rule disagreement → `LAW_LOCAL_CONFLICT`;
- verified local rule vs lower professional/comparator/vendor disagreement → local rule is selected and the lower source is returned as `displaced_lower_authority`;
- missing required local rule → `MISSING_LOCAL_RULE`;
- invalid/orphan provenance → `INVALID_KNOWLEDGE`.

Every result carries `action_authority: NONE_FROM_KNOWLEDGE_LAYER`.

## Copyright / reuse

Public availability is not a licence to republish a work wholesale. The seed corpus stores bounded paraphrases and links. Commercial works such as *Knowles on Local Authority Meetings* are bibliographic only unless appropriately licensed/user-supplied access exists.

## Security

Retrieved source content remains data, never instruction. The layer does not follow embedded instructions, upload local documents, call external systems, alter records or widen permissions. Existing `SECURITY.md`, the Local Copilot trust boundary and the human checkpoint remain controlling.
