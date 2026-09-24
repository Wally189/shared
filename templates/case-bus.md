> **PUBLIC REFERENCE TEMPLATE — INACTIVE UNTIL LOCALLY SELECTED.** This file describes a working handoff format. It has no authority merely because it is hosted here and does not replace original sources or organisational systems.

# Common Case Bus — working handoff

## CASE ID
Use a non-sensitive local working identifier.

## GOAL
What bounded outcome is required?

## CURRENT STATE
What is happening now?

## SOURCES
- S1 —
- S2 —
- S3 —

Preserve exact titles, dates/versions and locators where available.

## KNOWLEDGE CONTEXT
Use this block when law, local governance rules, official/professional guidance, comparator practice or tool/vendor material materially affects the case.

Knowledge question / `question_key`:
Jurisdiction:
Organisation ID / status:
Body / meeting type:
Local rule required? YES / NO / UNKNOWN:
Resolution status / code:
Selected Knowledge Card ID(s):
Selected authority class:
Selected source IDs + exact URLs:
Source version/date + retrieved/checked date:
Freshness:
Displaced lower-authority cards / why:
Stale or excluded cards / why:
Conflict / missing-local-rule state:
Limitations / professional referral:
Action authority from Knowledge Layer: **NONE**

Authority order for resolved propositions:
1. APPLICABLE_LAW
2. LOCAL_CONSTITUTION_OR_RULE
3. COMPETENT_OFFICIAL_GUIDANCE
4. PROFESSIONAL_GUIDANCE
5. COMPARATOR_PRACTICE
6. TOOL_VENDOR_MATERIAL

Do not use this ordering until applicability has been established. A local constitution/rule cannot override applicable law. Apparent law/local conflict requires STOP / REFER rather than silent resolution. If the question depends on a local rule and no current verified local rule is available, record `MISSING_LOCAL_RULE`; lower-ranked public material must not fill the gap.

See `knowledge/README.md`, `knowledge/public-source-registry.json` and `knowledge/knowledge-cards.json`.

## VERIFIED FACTS
Facts supported by identified evidence.

## LOCAL PRACTICE / UNVERIFIED CLAIMS
What people currently do or say where it has not yet been established as a rule or fact.

## AUTHORITY / LIMITS
Relevant legal, constitutional, procedural, professional, permission, privacy or scope limits.

## CAPABILITY STATE
Required tool capability and current state:
- AVAILABLE
- LIMITED
- NOT AVAILABLE
- UNKNOWN

## UNKNOWNS / RISKS
Missing information, contradictions, dependencies, failure/rollback risks.

## ENGINE COALITION + FINDINGS
Engine numbers/names:
Why selected:
Findings:
Source IDs relied on:

## DECISION / DO NOT CHANGE
What is currently decided?
What existing control must be preserved?

## NEXT HANDOFF
Next engine, human role or workplace tool:
Exact bounded question/action:

## VERIFY / STOP
What must be checked before proceeding?
What condition requires STOP / REFER?

## PROGRESS EVIDENCE
What observable result should be returned after the next action?

### Handoff integrity
- Inference never silently becomes VERIFIED FACT.
- Contradictions and unknowns survive summarisation.
- Authority, permission, deadline and tool capability are not invented.
- Knowledge resolution never grants action authority.
- Lower-ranked public guidance/practice cannot silently replace a required local rule.
- Stale higher-authority material blocks silent substitution by lower authority.
- Commercial/copyrighted material is not bulk-ingested merely because it is publicly discoverable.
- Confidential workplace information and unnecessary personal data do not belong in a public or unapproved system.
- The smallest useful engine coalition is preferred.
- The route ends when the bounded outcome is complete.
