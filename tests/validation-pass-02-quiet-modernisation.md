# Validation Pass 02 — Quiet legacy modernisation

**Date:** 23 September 2026  
**Question:** Does the reference architecture adequately address migration from a functioning but messy legacy office system with duplicated spreadsheets, informal colour/status conventions, weak file naming, inconsistent free text, low digital confidence and some resistance to change?

## Finding

**PARTIAL before correction → PASS after correction at reference-architecture level.**

The original site described a strong destination architecture but under-specified the human and migration problem.

## Evidence checked

1. GOV.UK Service Standard — start from user needs and iterate frequently.
2. GOV.UK guidance on applying the Service Standard — complex legacy environments cannot be solved in one go; start small enough to learn.
3. GOV.UK guidance on moving away from legacy systems — understand the existing landscape and involve affected stakeholders before changeover.
4. Microsoft Excel data validation — restrict entries to valid types/choices and provide input/error messages.
5. Microsoft Lists column types and validation — Choice/Lookup/validation improve consistency for structured fields.
6. Microsoft Champion Programme guidance — peer champions support Office 365 adoption.
7. NHS England change model — shared purpose, staff ownership, measurement, small tests, spread/adoption.
8. W3C WCAG 2.2 use-of-colour guidance / GOV.UK WCAG guidance — colour must not be the sole carrier of information.

## Defects found in v1

### D01 — Destination bias
The architecture said where to end up but not how to migrate an inherited working system without destroying tacit knowledge.

**Correction:** add Quiet Modernisation method: Observe → Stabilise → Structure → De-duplicate → Improve the home → Automate.

### D02 — Spreadsheet advice too dismissive
“Do not make a spreadsheet canonical because everybody knows how to colour cells” was directionally correct but risked sounding contemptuous and ignored legitimate Excel uses.

**Correction:** explicitly classify spreadsheets as KEEP / REPAIR / REPLACE / RETIRE based on function. Keep Excel for calculations/analysis; move shared state only where another structure is materially better.

### D03 — Colour problem under-specified
The site did not distinguish decorative colour, semantic colour and inaccessible colour-only status signalling.

**Correction:** neutral visual language; limited semantic colours; always pair colour with text/label/state; never frame personal/gendered aesthetic choices as the problem.

### D04 — Free-text controls under-specified
The architecture recommended Lists but did not explain how to stop pseudo-structured free text.

**Correction:** recommend Excel data validation and List Choice/Lookup/column validation where the domain is actually constrained.

### D05 — Digital confidence missing
The roadmap assumed users could adopt the new method once it was shown.

**Correction:** add micro-coaching ladder and peer/champion model.

### D06 — Resistance treated too abstractly
The roadmap lacked a diagnosis of why an experienced colleague might resist.

**Correction:** distinguish lack of benefit, fear of breakage, loss of status/control, skills gap, legitimate defence of a working method, and principled resistance. Respond differently to each.

### D07 — Sceptics not used as assurance
Resistant staff were implicitly a change-management problem rather than potentially excellent adversarial testers.

**Correction:** deliberately use a sceptical experienced user to discover failure modes before spread.

## Safety / ethics check

“Subtle and psychological” is implemented as low-friction, dignity-preserving adoption — not covert manipulation. The model rejects humiliation, public competence ranking, deceptive framing, gendered criticism and surprise migration.

## Acceptance

- public-safe and employer-neutral: PASS
- evidence-supported: PASS
- preserves functioning legacy controls before replacement: PASS
- supports structured data hygiene: PASS
- addresses digital confidence: PASS
- addresses resistant users proportionately: PASS
- does not require AI adoption: PASS
- keeps changes small/reversible: PASS


## Post-validation correction

A subsequent source check found that the phrase “published NHS examples report lower resistance where staff were involved” overstated the available evidence. The public page has been corrected to the narrower supported proposition: NHS guidance recommends shared purpose, staff involvement, process mapping, measurement, testing and spread/adoption.

The pass also added:
- a reusable Spreadsheet Triage worksheet;
- an explicit source for task-context training from Microsoft adoption guidance;
- links from the Microsoft 365, Toolkit and Quiet modernisation pages.

This strengthens the reference model by correcting an overclaim rather than retaining wording merely because it sounded plausible.
