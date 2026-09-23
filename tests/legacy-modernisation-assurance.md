# Legacy-to-Modern Assurance Pass — 23 September 2026

## Question

Would the reference architecture help modernise a functioning but messy Democratic Services environment characterised by duplicate spreadsheets, inconsistent file naming, uncontrolled free text, colour-coded workflow cues, mixed digital confidence and some reluctance to change?

## Finding

**PARTIAL → CORRECTED**

The original architecture correctly favoured incremental, reversible improvement, but it described the destination more strongly than the transition from a legacy working culture.

## Defects found and corrections

### A01 — Existing mess treated too much as technical debt

**Risk:** deleting or redesigning a workbook before understanding the tacit process it encodes.

**Correction:** new transition sequence: OBSERVE → STABILISE → STANDARDISE → CONSTRAIN → SIMPLIFY → MIGRATE → AUTOMATE → RETIRE.

**Evidence:** GOV.UK legacy guidance says to start from user needs rather than merely recreating the legacy system in new technology.

### A02 — Spreadsheet replacement was too binary

**Risk:** unnecessary migration, staff resistance and loss of working logic.

**Correction:** classify each workbook as register, workflow tracker, calculation model, report/view, temporary analysis, template, duplicate/shadow or unknown. Decision states: KEEP / CLEAN / CONSTRAIN / MIGRATE / RETIRE / INVESTIGATE.

### A03 — Uncontrolled free text not addressed strongly enough

**Risk:** inconsistent status labels, failed filtering, duplicate meanings and manual correction.

**Correction:** prefer controlled fields for controlled concepts. Use Excel data validation or Microsoft Lists Choice/Lookup columns where appropriate; reserve free text for narrative.

### A04 — Colour semantics not explicitly governed

**Risk:** essential meaning trapped in neon highlighting or font colour; inconsistent conventions and accessibility problems.

**Correction:** colour becomes a secondary visual cue. Meaning must exist in text/data first. Use neutral, stable functional semantics.

**Evidence:** WCAG 2.2 SC 1.4.1 requires colour not to be the sole means of conveying information.

### A05 — File naming standard too weak

**Risk:** poor retrieval and “final/final2/use-this” proliferation.

**Correction:** working-file starting pattern: YYYY-MM-DD - Body or workstream - Subject - Record type. Use storage-system version history/metadata rather than encoding every state into filenames.

### A06 — Adoption psychology was implicit rather than designed

**Risk:** technically correct changes fail because staff experience them as criticism, extra work or imposed novelty.

**Correction:** lead with pain removed; preserve familiar vocabulary; make preferred behaviour easiest; use moment-of-need learning; involve respected helpers/early adopters; invite sceptics into adversarial testing; credit existing expertise; keep pilots reversible.

**Evidence:** Microsoft 365 adoption guidance explicitly covers engagement, training and champions; Microsoft training guidance recommends contextual training and different learning styles.

### A07 — Parallel running could become permanent

**Risk:** two truths, twice the work.

**Correction:** every pilot needs an old-route retirement trigger and records/archiving action.

## Public-language rule

Do not describe people as resistant, old-fashioned or technologically weak. Describe observable system conditions: established practice, mixed digital confidence, duplicated information, uncontrolled fields, unclear ownership, manual workarounds or change risk.

## Acceptance

The architecture now explicitly supports modernising a working legacy service without requiring a big-bang system replacement or cultural confrontation.
