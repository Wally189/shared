# Validation Pass 02 — Quiet modernisation and legacy adoption

Date: 23 September 2026

## Context

The architecture was re-tested against a realistic starting environment: functioning but old-fashioned administration with duplicated spreadsheets, colour-coded conventions, uncontrolled free text, inconsistent filenames, low digital confidence and some resistance to change.

## Findings

### V02-01 — Target-state bias
**Finding:** The site described the desired architecture more strongly than the migration path from a functioning legacy environment.
**Correction:** Added Quiet modernisation and an operational-archaeology stage.
**Status:** corrected.

### V02-02 — Register multiplication risk
**Finding:** The eight-register model could be read as permission to create eight new artefacts alongside existing trackers.
**Correction:** Reframed as a conceptual target; map/consolidate existing sources first.
**Status:** corrected.

### V02-03 — Visual folklore not explicitly handled
**Finding:** Colour highlighting and coloured text can encode undocumented meaning.
**Correction:** Require meaning to be decoded and converted to structured status/owner/dependency fields before visual conventions are removed.
**Status:** corrected.

### V02-04 — Uncontrolled free text
**Finding:** Microsoft section did not explicitly distinguish narrative text from fields that should be typed/validated.
**Correction:** Added Choice/Person/Date/Yes-No guidance and validation rationale based on Microsoft Lists/SharePoint capabilities.
**Status:** corrected.

### V02-05 — Colour/accessibility
**Finding:** No explicit rule that colour must be secondary to textual/structural meaning.
**Correction:** Added WCAG 2.2 Use of Color rule and neutral functional palette principle.
**Status:** corrected.

### V02-06 — File naming/versioning nuance
**Finding:** A single naming convention is inappropriate across personal working files and canonical SharePoint documents.
**Correction:** Personal working files may use date/purpose; shared canonical documents should prefer stable identity plus version history/metadata.
**Status:** corrected.

### V02-07 — Low digital confidence / resistance
**Finding:** Roadmap was technically cautious but not explicit enough about adoption support.
**Correction:** Added assisted adoption, diagnostic treatment of resistance, familiar first versions, bounded parallel running and low-temperature language.
**Status:** corrected.

### V02-08 — AI setup usability
**Finding:** Engine files existed but the literal basic-Copilot setup process was underexplained.
**Correction:** Added six-step OneDrive/paste/attach/use method.
**Status:** corrected.

### V02-09 — Current combined-authority legal trail
**Finding:** The 2017 combined-authority Order is amended; old locally saved copies are unsafe as current authority.
**Correction:** Strengthened currentness warning. 2026 SI 719 expressly amends the 2017 Order and identifies earlier relevant amendments including SI 2024/430 and 2026/517.
**Status:** corrected.

## Technical validation

- Static HTML/CSS remains the delivery model.
- No new JavaScript, trackers or forms added.
- Colour remains non-essential to site meaning.
- Existing text/background contrast ratios remain above WCAG AA for body, muted and link text.
- Internal-link check required after merge candidate generation.
- GitHub Pages deployment required after merge.

## Evidence

- GOV.UK Service Manual — Moving away from legacy systems.
- GOV.UK — Encouraging people to use digital services / assisted digital.
- GOV.UK — Implement a data quality action plan (2025, updated 2026).
- Microsoft Support — columns, validation, versioning and list formatting.
- W3C WCAG 2.2 — Use of Color.
- Behavioural Insights Team — EAST methodology.
- ICO — section 46 records-management guidance.
