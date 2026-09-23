# Spreadsheet Triage

Workbook:
Owner / knowledgeable user:
Location:
Last materially updated:
Current users:
Purpose in one sentence:

## 1. What job is this workbook doing?

Select all that genuinely apply:

- REGISTER / SOURCE OF TRUTH
- WORKFLOW TRACKER
- CALCULATION MODEL
- REPORT / VIEW
- TEMPORARY ANALYSIS
- TEMPLATE
- DUPLICATE / SHADOW COPY
- UNKNOWN

## 2. Hidden business logic

Check before changing:

- formulas and named ranges;
- hidden rows, columns or sheets;
- macros or scripts;
- external links or queries;
- data validation;
- conditional formatting;
- protection;
- manual copy-and-paste steps;
- colour conventions;
- free-text conventions;
- downstream reports or emails;
- people who rely on it;
- recurring dates or committee-cycle dependencies.

## 3. Data quality

Field | Intended meaning | Current type | Valid values | Free text necessary? | Proposed control

Use controlled values for controlled concepts. Reserve narrative fields for genuine notes, rationale and exceptions.

## 4. Colour semantics

Colour / formatting | Current meaning | Is meaning documented? | Replace with explicit field/text? | Keep as secondary cue?

Essential meaning must not depend on colour alone.

## 5. Canonical status

Is this the authoritative record?
If not, what is?
Does another tracker duplicate the same state?
Which record wins if they disagree?

## 6. Decision

Choose one:

- KEEP — Excel remains the right tool;
- REPAIR — purpose is sound but hygiene/validation/naming/protection needs improvement;
- REPLACE — another existing tool is materially better for the shared state/workflow;
- RETIRE — duplicate, obsolete or superseded; archive appropriately;
- INVESTIGATE — insufficient knowledge to change safely.

## 7. Safe transition

Smallest change:
Users to test:
Success measure:
Do-not-harm measure:
Authoritative record during pilot:
Rollback:
Cutover / old-route retirement trigger:
Records / retention action:
