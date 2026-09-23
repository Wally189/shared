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
- hidden rows / columns / sheets;
- macros / scripts;
- external links / queries;
- data validation;
- conditional formatting;
- protection;
- manual copy-and-paste steps;
- colour conventions;
- free-text conventions;
- downstream reports / emails;
- people who rely on it;
- recurring dates / committee cycle dependencies.

## 3. Data quality

Field | Intended meaning | Current type | Valid values | Free text necessary? | Proposed control

Use controlled values for controlled concepts. Reserve narrative fields for genuine notes/rationale.

## 4. Colour semantics

Colour / formatting | Current meaning | Is meaning written anywhere? | Replace with explicit field/text? | Keep as secondary cue?

Essential meaning must not depend on colour alone.

## 5. Canonical status

Is this the authoritative record?
If not, what is?
Does another tracker duplicate the same state?
Which system wins if they disagree?

## 6. Decision

Choose one:

- KEEP — fit for purpose;
- CLEAN — presentation/naming only;
- CONSTRAIN — improve validation/fields without platform migration;
- MIGRATE — move to a better canonical system;
- RETIRE — duplicate/obsolete, archive appropriately;
- INVESTIGATE — insufficient knowledge to change safely.

## 7. Safe transition

Smallest change:
User(s) to test:
Success measure:
Do-not-harm measure:
Rollback:
Old-route retirement trigger:
Records/retention action:
