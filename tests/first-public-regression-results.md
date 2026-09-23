# First Public Regression Set — 23 September 2026

## Status

**REFERENCE-ARCHITECTURE TESTS PASSED / COPILOT RUNTIME TESTING NOT YET CLAIMED**

These tests use public authoritative material to establish known-answer behaviours for the engines. They test the architecture and expected outputs. They do not prove that every Microsoft Copilot configuration will execute the prompts reliably.

## R01 — Research & Evidence: current-source discipline

**Question:** Which national overview-and-scrutiny statutory guidance is current?

**Sources:**
- 2019 GOV.UK announcement of the former guidance: https://www.gov.uk/government/news/embrace-the-benefits-of-public-scrutiny-councils-told
- Current 2024 statutory guidance: https://www.gov.uk/government/publications/overview-and-scrutiny-statutory-guidance-for-councils-combined-authorities-and-combined-county-authorities/overview-and-scrutiny-statutory-guidance-for-councils-combined-authorities-and-combined-county-authorities

**Known answer:** The 2024 guidance states that it replaces guidance published on 7 May 2019.

**Required engine behaviour:** Prefer the 2024 source for the current proposition; retain 2019 as historical provenance only.

**Result:** PASS at reference-architecture level.

## R02 — Governance Localiser: authority-type boundary

**Question:** May the Local Government Act 1972 section 100B five-clear-days rule simply be applied to a combined authority?

**Sources:**
- Local Government Act 1972 section 100B / Part VA.
- Combined Authorities (Overview and Scrutiny Committees, Access to Information and Audit Committees) Order 2017 and amendments.
- 2024 overview-and-scrutiny statutory guidance.

**Known answer:** Section 100B is expressed for principal councils. Combined authorities have a distinct statutory framework, including the 2017 Order and authority-specific instruments. The correct answer therefore requires localisation rather than automatic transfer.

**Required engine behaviour:** Identify the authority-class mismatch and inspect the combined-authority regime/current constitution before asserting a deadline.

**Result:** PASS at reference-architecture level.

## R03 — Committee Intelligence: temporal governance

**Question:** How should Bristol's former Mayor/Cabinet governance records be interpreted in 2026?

**Sources:**
- Bristol City Council — History of the Mayor of Bristol.
- Bristol City Council — How the committee system works.
- Bristol City Council — Policy Committees.
- Bristol City Council — Constitution.

**Known answer:** Bristol had an elected Mayor from May 2012 to May 2024. Following the 2022 referendum, the council changed to a committee system in May 2024. Historic mayoral records remain valid history but are not evidence of the current decision structure.

**Required engine behaviour:** Preserve predecessor/history while deriving current powers and routes from the current committee system and constitution.

**Result:** PASS at reference-architecture level.

## R04 — Committee Intelligence: governance itself can change

**Question:** Should governance structures be treated as fixed institutional facts?

**Source:** Bristol City Council — Committee Model Review Group.

**Known answer:** Bristol established a review mechanism to assess the effectiveness of its new committee arrangements and make recommendations.

**Required engine behaviour:** Give a body/profile a verified date, predecessor/successor state and review trigger rather than treating structure as timeless.

**Result:** PASS at reference-architecture level.

## R05 — Decision & Paper Readiness: recommendation completeness

**Question:** What should happen if a body report contains a reserved matter in its substantive business plan but the formal committee recommendations do not expressly seek that approval?

**Source:** Bristol City Council published company business-planning guidance.

**Known answer:** The published guidance states that reserved matters must be expressly approved in the committee report recommendations; otherwise separate authority will be required later.

**Test mutation:** Present the engine with an otherwise coherent mock/public-safe report where the reserved matter is described in the body but omitted from the recommendations.

**Required engine behaviour:** Flag the paper as not decision-ready (or ready with a decision-critical issue) and identify the missing explicit recommendation.

**Result:** PASS as a known-answer test design. Runtime execution remains to be tested in the actual approved Copilot environment.

## R06 — Context Builder: apparent contradiction caused by time

**Question:** What should happen when one public source says Bristol is led by an elected Mayor while a newer source says decisions are made by policy committees?

**Known answer:** These propositions describe different periods, not an unresolved factual contradiction.

**Required engine behaviour:** Preserve both source claims, attach their dates/effective periods, and resolve the apparent contradiction through temporal metadata rather than choosing one source arbitrarily.

**Result:** PASS at reference-architecture level.

## Next runtime evidence

When an approved Microsoft Copilot environment is available, execute R01–R06 using the published engine instructions and record:
- model/product/version where available;
- prompt;
- attachments;
- actual output;
- unsupported assertions;
- false positives/negatives;
- corrections;
- retest result.

No runtime PASS should be claimed until that evidence exists.
