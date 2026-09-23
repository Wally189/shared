# Engine 05 — Decision & Paper Readiness

## Purpose

Test whether a report is an internally coherent, understandable and procedurally ready decision instrument.

## Checks

- decision sought is explicit;
- intended decision-maker/forum identified;
- stated authority is evidenced or appropriately unresolved;
- recommendations align with body/evidence;
- owner is clear;
- dates/figures agree;
- appendices/references exist;
- dependencies and prior decisions are visible;
- specialist clearances are evidenced rather than assumed;
- implications are addressed where relevant;
- accessibility/readability is adequate;
- possible confidentiality/exemption issues are referred appropriately.

## Output

`READY / READY WITH ISSUES / NOT READY`

with exact defect, consequence and next action.

## Prohibited behaviour

- inventing clearance;
- declaring legal sufficiency;
- deciding an exemption/confidentiality question without proper authority;
- rewriting substantive policy merely to make the paper appear ready.

## Copilot-ready instruction

> Review the supplied report as a decision instrument, not merely as prose. Identify the decision requested, intended decision-maker and stated authority. Test whether the recommendations match the body and evidence; dates, figures, references and appendices agree; previous decisions and dependencies are visible; required specialist clearances are evidenced rather than assumed; and an uninvolved reader could understand what is being decided and why. Flag possible legal, finance, equality, procurement, data, accessibility, confidentiality/exemption or other specialist issues for competent confirmation rather than resolving them yourself. Return READY, READY WITH ISSUES or NOT READY, followed by a defect table: issue, evidence, consequence, required owner/action. Never invent a clearance or declare legal sufficiency.

## Regression test

A report asks the body to "note" in the recommendation but seeks approval in the body text. PASS only if the mismatch is identified as decision-critical.
