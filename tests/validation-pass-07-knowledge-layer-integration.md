# Validation Pass 07 — Knowledge Layer / Editorial Main Integration

Date: 24 September 2026

Accepted Knowledge Layer source: `29fda8a653a45e3afdb99c3a64b0a993e20e1795`

Current main integrated: `cdfb70fb23daa94e7e5dccb5653730e41f7d0660`

Merge base: `c5f31ae1d726777aaf2271cb6d51735c1b25b7d6`

Integrated content commit before this evidence record: `c58360b7eeddf3b6f5bff0557186ed744bbcdd5a`

Branch: `candidate/democratic-services-knowledge-layer-integrated`

## Scope

Bounded reconciliation only. Preserve the six accepted/editorially reviewed main-line commits and the accepted Knowledge Layer without redesign, merge to main or deployment.

## Main-line commits reviewed

1. `1976e513922d3931f064f871108f91df0b80b668` — Give Modern Democratic Services a clearer editorial voice
2. `303e19f0932fe7062aa90a1211e2f09d1c8d1621` — Sharpen the quiet-modernisation editorial voice
3. `82b9ccd80334acebc963be993a2266f8c3a2df42` — Make the planning narrative more distinctive without changing controls
4. `8575704d272347c5ec967e8d6f0f63440f45b18b` — Tighten editorial claims on the start page
5. `631f08208c0cb910a7b9f1e6cefc5c7e2fcc43f4` — Keep quiet-modernisation wit evidence-safe
6. `cdfb70fb23daa94e7e5dccb5653730e41f7d0660` — Tighten the planning voice without widening claims

The six commits modify only `index.html`, `change.html` and `planner.html`.

## Conflict assessment

**NO TEXTUAL CONFLICT.**

The accepted Knowledge Layer changes:
- `docs/reference-architecture.md`
- `engines/02-research-and-evidence.md`
- `engines/03-governance-localiser.md`
- `knowledge/README.md`
- `knowledge/authority_resolver.py`
- `knowledge/knowledge-cards.json`
- `knowledge/public-source-registry.json`
- `templates/case-bus.md`
- `tests/test_knowledge_layer.py`
- `tests/validation-pass-06-knowledge-layer.md`

None overlap the three editorial HTML paths.

**NO MATERIAL SEMANTIC CONFLICT.**

The editorial sequence changes voice and then narrows potentially over-broad claims. It preserves the public-reference trust boundary, the ten-engine statement and the distinction between law/local rule/professional advice. The Knowledge Layer adds governed evidence/authority support below those same controls. No authority, permission, engine identity, Microsoft capability state or deployment behaviour is widened by combining them.

## Integration method

The integrated candidate was constructed from current main as the parent tree, then the exact accepted Knowledge Layer blobs were overlaid unchanged in one content commit.

This avoids replaying the old divergent history and makes the integration diff equal to: current main + accepted Knowledge Layer.

## Exact blob preservation

**PASS — 10/10 accepted Knowledge Layer files are byte-identical to `29fda8a...`.**

**PASS — current-main presentation/control files remain byte-identical to `cdfb70f...`:**
- `index.html`
- `change.html`
- `planner.html`
- `copilot-local-template.txt`
- `templates/capability-registry.md`
- `SECURITY.md`

## Knowledge Layer regression

The ten resolver scenarios were replayed against the integrated source state:

1. seed provenance — PASS
2. professional guidance cannot override local rule — PASS
3. stale higher authority blocks lower substitution — PASS
4. same-rank conflict blocks — PASS
5. missing local rule blocks — PASS
6. invalid/orphan provenance fails closed — PASS
7. law/local conflict refers — PASS
8. bibliographic-only source is not ingested into cards — PASS
9. lower-authority sources cannot self-promote — PASS
10. provenance snapshot mismatches fail closed — PASS

**PASS 10/10.**

The authority self-promotion case continues to cover all six combinations of professional/comparator/vendor source material claiming law/local-rule status. The provenance mismatch case continues to cover version/date, retrieval date and freshness independently.

## Directly affected existing regressions

**PASS — engine estate remains exactly 10.**

**PASS — PRIVATE OPERATOR BASELINE preserved** because `copilot-local-template.txt` is byte-identical to current main.

**PASS — Microsoft 365 posture preserved** because `templates/capability-registry.md` is byte-identical to current main.

**PASS — security/trust posture preserved** because `SECURITY.md` is byte-identical to current main.

**PASS — editorial HTML source structure:**
- `index.html`: one H1, one MAIN, zero SCRIPT, zero FORM
- `change.html`: one H1, one MAIN, zero SCRIPT, zero FORM
- `planner.html`: one H1, one MAIN, zero SCRIPT, zero FORM

**PASS — no repository-owned workflow files are introduced by the integrated tree.**

No browser/visual re-acceptance is newly claimed here because the accepted editorial HTML blobs are unchanged from current main; this integration changes none of their rendered source.

## Release state

**INTEGRATED CANDIDATE ONLY / NOT MERGED / NOT DEPLOYED.**

Separate Crown release authority remains required.
