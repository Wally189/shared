# Curriculum Tranche 01 — Acceptance & Learner Scenario Review

Date: 24 September 2026

Candidate content reviewed: `d9b50e91b56fc47ace8159432780d79f2ee64639`

Baseline: `408ecf719148d58d45757ae910e92166cd9a2985`

Scope: Golden Path, Foundations of Democratic Services, fictional end-to-end Decision Journey, Building the Democratic Services Team/Service, minimal Start/Operating Model integration, source reinforcement and static presentation support.

This is scenario-based internal acceptance, not evidence from recruited users. CAT-111-style representative-user testing remains a later evidence opportunity if the curriculum is developed further.

## Structural acceptance

- PASS — four bounded teaching assets exist: Learn / Foundations / Decision Journey / Service & Team.
- PASS — the existing Start page now offers a clear choice between guided learning and specialist reference use.
- PASS — Operating Model links back to prerequisite teaching and forward to the worked decision.
- PASS — each new teaching module has one H1, one MAIN, language and viewport metadata, labelled navigation, a current-page marker, zero SCRIPT and zero FORM.
- PASS — no missing internal links were found among the new/integrated pages.
- PASS — sitemap contains all four new public routes.
- PASS — the ten-engine estate and Knowledge Layer are unchanged.
- PASS — no JavaScript, account, CMS, LMS, search service or tracking dependency was introduced.

## Teaching-rhythm acceptance

Foundations, Decision Journey and Service & Team each provide:

- WHY IT MATTERS — PASS
- WHAT IT IS — PASS
- AUTHORITY / PROFESSIONAL CONTEXT — PASS
- WORKED EXAMPLE — PASS
- YOU TRY / APPLICATION — PASS
- WHAT GOOD PRACTICE NOTICES — PASS
- LOCALISE IT — PASS
- NEXT — PASS

Learn acts as the Golden Path rather than repeating the full lesson rhythm.

## Source/authority acceptance

New curriculum source classes are explicitly bounded:

- ADSO training / Certificate — PROFESSIONAL BODY / PROFESSIONAL-BODY LEARNING REFERENCE, not law.
- LGA councillor/officer and induction material — SECTOR GUIDANCE, not local constitutional authority.
- Best Value guide — STATUTORY GUIDANCE — ENGLAND; the operative 8 May 2024 guidance is distinguished from the open 15 July 2026 consultation on revised guidance.
- Existing overview and scrutiny guide — STATUTORY GUIDANCE — ENGLAND.
- CIPFA/Solace — PROFESSIONAL GOVERNANCE FRAMEWORK, not legislation or local constitutional authority.

PASS — the modules retain the existing rule that current local governing documents and competent professional advice govern local operational use.

## Six learner-persona scenario tests

### A — New starter

Start question: "I know almost nothing about Democratic Services. Where do I begin?"

Route: Start → Learn → Foundations → Decision Journey → Operating Model.

Result: PASS for tranche objective.

Why: the learner is no longer required to decode the five-layer architecture before understanding members/officers, professional purpose and a real decision journey.

Residual: later tranches still need deeper craft teaching for agendas, chair support, minutes, scrutiny and public participation.

### B — Existing Democratic Services Officer

Start question: "I understand my daily tasks but want to see the whole operating system."

Route: Start → reference route or Learn → Decision Journey / Operating Model → Local Discovery / Maturity.

Result: PASS.

Why: the Golden Path explicitly permits experienced readers to bypass foundations, while the decision journey connects familiar tasks into one lifecycle.

### C — Senior Democratic Services / governance manager

Start question: "How do I assess whether my service is resilient and where to improve?"

Route: Learn → Service & Team → Local Discovery → Maturity → Quiet Modernisation → Planning Workbench.

Result: PASS with residual.

Why: the new capability/cover/induction/QA layer closes the largest previous people-system gap without prescribing a staffing model.

Residual: no full workforce-capacity model, recruitment method or management framework is claimed; these remain local/HR-governed.

### D — Transformation / digital colleague

Start question: "Which technology should replace this messy process?"

Route: Learn → Foundations / Decision Journey → Local Discovery → Quiet Modernisation → Tool Diagnosis.

Result: PASS.

Why: technology is deliberately sequenced after institution, decision logic and process archaeology.

### E — Senior manager establishing or rebuilding a service

Start question: "What must the function be able to do before I draw an organisation chart?"

Route: Learn → Foundations → Decision Journey → Operating Model → Service & Team.

Result: PASS for first-tranche scope.

Why: the learner can now derive capabilities, ownership, cover and professional dependencies before discussing job titles.

Residual: later teaching should add fuller service-design examples, workload/capacity evidence and staged implementation.

### F — Small / resource-constrained authority

Start question: "We cannot create a large specialist team. Is the model still usable?"

Route: Service & Team → Operating Model → Maturity → Quiet Modernisation.

Result: PASS.

Why: the page explicitly rejects universal staffing ratios and permits one person to cover several capabilities where ownership, competence and cover are real.

## Representative application tasks

| Task | Candidate result |
|---|---|
| Explain what Democratic Services is and why it exists | PASS — Foundations |
| Distinguish member judgement, officer support and specialist advice | PASS — Foundations worked case |
| Trace a proposal from need to formal record and follow-through | PASS — Decision Journey |
| Identify national baseline vs local constitutional verification | PASS — Foundations + Decision Journey + Operating Model |
| Recognise when a paper is not genuinely decision-ready | PASS — Decision Journey exercise + existing toolkit |
| Identify the capabilities needed for a resilient service | PASS — Operating Model + Service & Team |
| Identify key-person dependency / cover risk | PASS — Service & Team exercise |
| Start service diagnosis before redesign | PASS — Golden Path routes to Local Discovery |
| Choose technology only after the problem is understood | PASS — Golden Path sequencing |
| Define a bounded improvement and evidence loop | PASS via existing Maturity / Quiet Modernisation / Lab routes |
| Understand AI as bounded support, not authority | PASS via existing AI / Security routes |
| Produce a complete 90-day rebuild plan | PARTIAL — intentionally outside Tranche 01; planning/improvement material exists but no new prescriptive programme was added |

## Visual / responsive evidence

Offline screen-media renders were produced for the Learn and Service & Team layouts at 390px and 1440px from the initial tranche content. Subsequent candidate commits only hardened source wording, URLs and source-currentness notes; `style.css` and the teaching layout were not changed. A final browser re-render was attempted but blocked by the local browser administrator policy, so these screenshots are retained as layout evidence and are not claimed as an exact-byte render of the final content commit. The evidence renderer used an equivalent two-column desktop / one-column mobile grid rule solely for screenshot generation because it does not support the candidate's nested CSS `min()` expression inside Grid. Candidate source was not altered for the screenshots.

Source-level responsive controls remain the same static CSS family already accepted on main: wrapped navigation, fluid max-width content, single-column mobile teaching path, overflow-contained tables and no script dependency.

This evidence is suitable for candidate visual review but is not claimed as independent Chrome/Safari/Firefox acceptance.

## Defects / residuals

1. No critical tranche defect found.
2. The curriculum is deliberately incomplete: core meeting craft, scrutiny practice, member support and public-participation teaching remain future curriculum work.
3. Persona tests are structured simulations, not recruited-user evidence.
4. External-source availability/currentness should be rechecked at release/research refresh points.
5. The new professional/sector sources are indexed for curriculum evidence only; the governed AI Knowledge Layer was deliberately not widened in this tranche.

## Final source-currentness and structural recheck

Rechecked against candidate content `d9b50e91b56fc47ace8159432780d79f2ee64639` after source hardening:

- PASS — main remains the commissioned baseline `408ecf719148d58d45757ae910e92166cd9a2985`; candidate is ahead and not merged.
- PASS — ADSO professional-learning references remain explicitly non-statutory.
- PASS — LGA councillor/officer and councillor-induction references use the current canonical `www.local.gov.uk` host.
- PASS — the operative 8 May 2024 Best Value statutory guidance is distinguished from the open 15 July 2026 consultation on revised guidance; the consultation is recorded only as a currentness watch.
- PASS — CIPFA/Solace governance material remains labelled as a professional governance framework, not law or local constitutional authority.
- PASS — Learn, Foundations, Decision Journey, Service & Team, Start, Operating Model and Sources each have one H1, one MAIN, `lang=en`, viewport metadata, labelled navigation, zero SCRIPT and zero FORM; no missing internal link was found in that reviewed set.
- PASS — sitemap contains all four new curriculum routes.
- PASS — the `engines/` tree SHA and `knowledge/` tree SHA are byte-identical to baseline; the ten-engine and Knowledge Layer estates were not changed.

## Acceptance

ACCEPT candidate for Crown review.

HOLD merge/deployment pending separate Crown release authority.
