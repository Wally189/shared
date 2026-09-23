# Security Remediation Acceptance — Candidate

Date: 23 September 2026
Candidate head before merge: 41bb8482aebc2788c066fb49782a629558fdf251

## Defects confirmed

1. Homepage explicitly told AI systems to use a public page as an operating instruction.
2. Copilot page described public content as a master instruction / AI entry point.
3. Public copy-ready engine files could be treated as live instructions without a local review/version boundary.
4. No single public Security & Trust Model page.
5. No deployment-generated release/version/SHA artefact.
6. No dedicated SEC-01..SEC-10 trust-boundary regression suite.
7. Supply-chain controls were not explicitly documented.

## Remediation implemented

- public website demoted to UNTRUSTED EXTERNAL REFERENCE MATERIAL;
- user/local organisation explicitly invokes `copilot-local-template.txt`;
- prompt-injection/data-vs-instruction rules added;
- public-derived work defaults to RESEARCH / ANALYSE / COMPARE / DRAFT / PLAN / CHECK;
- consequential actions require a human/approved organisational checkpoint;
- internal-material and progress-log minimisation boundaries added;
- specialist engine files labelled reviewed local templates and tied to local trust/release review;
- `security.html` added;
- AI-facing pages carry a restrained external-content warning;
- Pages workflow generates `release.html` and `reference-version.txt` from the actual `GITHUB_SHA`;
- `SECURITY.md` documents repository/supply-chain posture and compromised-release withdrawal;
- SEC-01..SEC-10 and functionality-regression records added;
- old `copilot.txt` removed.

## Static navigation / publication test

- repository HTML pages: 22;
- internal broken links: 0 (release.html is intentionally deployment-generated);
- structural failures: 0;
- HTML forms: 0;
- site JavaScript: 0;
- old self-authorising phrase patterns in HTML: 0;
- old self-authorising phrase patterns in Markdown/text/YAML/CSS scan: 0;
- obvious GitHub/AWS/private-key/password assignment patterns in text scan: 0.

## Functionality preservation

REFERENCE PASS:
- public research;
- Local Organisation Discovery;
- Microsoft tool diagnosis;
- ten AI engines;
- three-file context method;
- progressive coach;
- OneNote progress method;
- mailbox modernisation;
- plain-English SOP;
- exact-deadline/senior drafting;
- ethical adoption;
- maturity model;
- public test laboratory;
- source register;
- baby-step workflow.

See `tests/security-remediation-functionality.md`.

## Security regression status

SEC-01..SEC-10: REFERENCE PASS.
Workplace Copilot runtime: UNTESTED until executed in the actual approved environment.

See `tests/security-trust-regression.md`.

## Supply-chain review

- repository is public;
- rulesets API returns an empty set;
- classic branch-protection endpoint is inaccessible to the current GitHub App, therefore classic protection is NOT VERIFIED;
- current main commit before remediation was GitHub-verified/signed;
- public site has no third-party JavaScript/runtime dependency;
- deployment workflow uses official GitHub Actions.

Recommended operator controls remain in `SECURITY.md`: MFA/passkeys, branch/ruleset protection, PR review, no force-push/delete, secret scanning/push protection where available, and periodic app/token review.

## Deployment gate

PASS only when:
1. PR is merged to main;
2. GitHub Pages workflow succeeds;
3. live `release.html` displays the exact merged main SHA;
4. live `security.html` and `copilot-local-template.txt` are reachable.
