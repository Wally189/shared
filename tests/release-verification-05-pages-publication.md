# Release Verification 05 — Pages Publication Path Repair

Date: 24 September 2026

## Trigger

PR #39 merged successfully to `main` as:

`533492a39ead3576f04811710483fb7efb27e8fb`

Source review and Validation Pass 04 were clean. The repository then produced two successful Pages deployments for the same SHA:

- custom `Deploy static site to GitHub Pages` run `35954759256`;
- GitHub-managed branch `pages build and deployment` run `35954758844`.

The custom run generated a correct `release.html` and deployed an artifact whose release identity matched the merge SHA. The GitHub-managed branch deployment subsequently published the repository source without that workflow-generated file.

## Public-artifact defect

A read-only public HTTPS verification from GitHub Actions run `35955222002` requested:

`https://wally189.github.io/shared/release.html`

Observed:

`HTTP 404`

Therefore the PR #39 release was **NOT accepted as deployed** at that point, notwithstanding successful merge and green deployment jobs.

## Root cause

The repository had two competing Pages publication paths:

1. the repository-owned artifact deployment in `.github/workflows/pages.yml`;
2. the repository's configured branch-based GitHub Pages publication from `main`.

Both could successfully deploy the same commit. The later branch deployment could overwrite the artifact deployment, while `release.html` existed only in the generated artifact.

## Repair

Use exactly one publication path: the already-configured native branch Pages publication from `main`.

Changes:

- remove the competing repository-owned `.github/workflows/pages.yml`;
- remove `.nojekyll` so the native Pages build can render release metadata;
- add `release.html` and `reference-version.txt` with minimal YAML front matter;
- render the exact source SHA through `site.github.build_revision`;
- leave the handbook, engine files and templates as static/public reference files.

## Bounded pre-production proof

Candidate branch Jekyll probe:

- workflow: `Probe branch Pages Jekyll build`;
- run: `35955568666`;
- tested source SHA: `f2e5eb08d800e2091860b39745b4e3f84316f14d`;
- result: **SUCCESS**.

Verified in the generated site:

- `release.html` contained the exact tested source SHA;
- `reference-version.txt` contained the exact tested source SHA;
- raw engine/template paths remained present, including:
  - `engines/01-context-builder.md`;
  - `engines/10-challenge-improvement.md`;
  - `templates/case-bus.md`;
  - `templates/capability-registry.md`;
  - `templates/planning-brief.md`;
- `copilot-local-template.txt`, `planner.html`, `support.html` and `security.html` remained present;
- planning and security markers remained intact.

## Security / architecture effect

No backend, API, form, site JavaScript, organisational data access, permission widening or Copilot authority is introduced.

The public trust model remains:

`PUBLIC REFERENCE → LOCALLY INVOKED INSTRUCTION → BOUNDED ANALYSIS/PLAN → HUMAN / ORGANISATIONAL CHECKPOINT`

## Final acceptance gate

This repair is not a deployment claim until, after merge:

1. `main` contains the accepted hotfix;
2. exactly the configured branch-based Pages path builds/deploys the release;
3. public `release.html` returns HTTP 200 and shows the exact final `main` SHA;
4. public `planner.html`, `support.html`, `security.html` and `copilot-local-template.txt` return HTTP 200 with the accepted markers;
5. the result is recorded on the release PR.

Concurrent main changes detected during repair: commits `6c003dc6c3067a7b3f6f49d9ab56bfde6906e993` and `1d98735383a0b261cc4103a9c06d4fe251d9f14d` were preserved by rebuilding the repair from current `main` before review.

Status at this record: **HOTFIX CANDIDATE / FINAL LIVE ACCEPTANCE PENDING**.
