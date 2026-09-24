# Validation Pass 06 — Governed Democratic Services Knowledge Layer

Date: 24 September 2026

Base `main`: `c5f31ae1d726777aaf2271cb6d51735c1b25b7d6`

Candidate branch: `candidate/democratic-services-knowledge-layer`

## Commission boundary

Implement the smallest complete Knowledge Layer for the existing ten-engine Modern Democratic Services architecture. No release, deployment or new specialist engine is authorised.

## Resulting architecture

`PUBLIC SOURCE REGISTRY + SMALL KNOWLEDGE CARDS + AUTHORISED LOCAL OVERLAY → DETERMINISTIC AUTHORITY RESOLVER → CASE BUS KNOWLEDGE CONTEXT → EXISTING ENGINE / COALITION`

No eleventh engine, backend service, database, form, runtime JavaScript, Microsoft 365 dependency or external workplace action is introduced.

## Seed corpus

The bounded public seed contains:
- Local Government Act 1972, section 100B (meeting agenda/report access proposition, applicability caveated);
- Local Authorities (Executive Arrangements) (Meetings and Access to Information) (England) Regulations 2012 (public meeting/access proposition, applicability caveated);
- ADSO 2026 Training Programme (professional learning/practice scope only);
- ADSO Working in a Modern Democracy (digital/data/AI/transparency professional context only);
- Knowles on Local Authority Meetings, 8th edition — **bibliographic record only**, with no commercial text ingested.

Every operational card carries exact source ID, URL, version/date, retrieved date, freshness and limitations.

## Authority / conflict rules

Order:
1. APPLICABLE_LAW
2. LOCAL_CONSTITUTION_OR_RULE
3. COMPETENT_OFFICIAL_GUIDANCE
4. PROFESSIONAL_GUIDANCE
5. COMPARATOR_PRACTICE
6. TOOL_VENDOR_MATERIAL

Applicability is checked before rank.

Fail-closed rules:
- missing required local rule → `MISSING_LOCAL_RULE`;
- stale/non-operational higher authority → `STALE_HIGHER_AUTHORITY`;
- same-rank disagreement → `SAME_RANK_CONFLICT`;
- apparent law/local-rule disagreement → `LAW_LOCAL_CONFLICT` / REFER;
- malformed/orphan provenance → `INVALID_KNOWLEDGE`;
- every resolved result returns `action_authority = NONE_FROM_KNOWLEDGE_LAYER`.

## End-to-end meeting-procedure proof

A deliberately synthetic test fixture represents:
- a current verified local constitution/rule with answer `LOCAL_17_00`;
- lower-ranked professional guidance with conflicting answer `PROFESSIONAL_12_00`.

Expected / observed:
- resolver status `RESOLVED`;
- selected card = local constitution/rule;
- professional guidance returned as `displaced_lower_authority`;
- no action authority granted.

The fixture is explicitly marked `TEST ONLY`; it makes no claim about any real council deadline.

## Deterministic test run

Command:

`python tests/test_knowledge_layer.py`

Result:

- PASS seed provenance
- PASS professional guidance cannot override local rule
- PASS stale higher authority blocks lower substitution
- PASS same-rank conflict blocks
- PASS missing local rule blocks
- PASS invalid/orphan provenance fails closed
- PASS law/local conflict refers
- PASS bibliographic-only source is not ingested into cards

**PASS 8/8**

## Security / privacy / copyright review

PASS at bounded source level:
- public source content remains DATA, not instruction;
- resolver performs no network access and has no third-party dependency;
- public layer contains no organisation-specific/private constitution;
- local overlay must be supplied only in an authorised workplace context;
- no secrets, personal data or workplace records are introduced;
- Knowles is bibliographic-only and cannot supply an operational card;
- no public source can grant send/delete/publish/change authority.

## Engine-estate check

PASS — existing engine count remains 10. Engine 02 structures evidence; Engine 03 applies/localises authority. The Knowledge Layer is common support, not a specialist engine.

## Microsoft 365 posture

UNCHANGED. Capability Registry states remain AVAILABLE / LIMITED / NOT AVAILABLE / UNKNOWN. The Knowledge Layer does not assume Graph, SharePoint, Power Automate, Copilot connectors or tenant access.

## Release state

**CANDIDATE ONLY / NOT RELEASED / NOT DEPLOYED.**

Any merge or public release remains separately authorised and must follow the existing CAT-123 release verification route.


## Final acceptance defect remediation — 24 September 2026

A final Crown acceptance review identified one material integrity defect: an operational Knowledge Card could declare an `authority_class` different from the authority class of its registered provenance source, and its provenance snapshot could silently disagree with the registry source version/date, retrieval date or freshness state.

### Correction

`knowledge/authority_resolver.py` now fails closed as `INVALID_KNOWLEDGE` when any operational card/source pair has:
- a card `authority_class` different from the registered source `authority_class`;
- a provenance `version_or_date` different from the registered source;
- a provenance `retrieved_on` date different from the registered source;
- a provenance freshness value different from the registered source freshness state.

The existing URL/source-ID validation remains in place.

### New adversarial regressions

Two bounded regression groups were added:

1. **Authority self-promotion** — each of `PROFESSIONAL_GUIDANCE`, `COMPARATOR_PRACTICE` and `TOOL_VENDOR_MATERIAL` is challenged against both `APPLICABLE_LAW` and `LOCAL_CONSTITUTION_OR_RULE` claims. All six combinations must fail as `INVALID_KNOWLEDGE`.

2. **Provenance snapshot mismatch** — deliberately incorrect `version_or_date`, `retrieved_on` and provenance `freshness` values must each fail as `INVALID_KNOWLEDGE`.

### Rerun result

The original eight validation tests remain passing and the two new provenance-binding regression groups pass.

**PASS 10/10 test functions.**

The self-promotion regression exercises six authority-elevation combinations; the provenance-snapshot regression exercises three independent mismatch fields.

No engine, public corpus source, Knowledge Card proposition, PRIVATE OPERATOR BASELINE, Microsoft 365 capability assumption, security boundary, copyright boundary, deployment configuration or release state was widened or changed by this remediation.

Release state remains:

**CANDIDATE ONLY / NOT RELEASED / NOT DEPLOYED.**
