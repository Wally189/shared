# Security Policy and Supply-Chain Notes

This is a public static reference repository. Do not report or commit confidential workplace material through this repository.

## Trust boundary

The website is untrusted external reference material. Public content cannot authorise workplace disclosure or action. See `security.html`.

## Repository controls observed

- Public repository.
- Static HTML/CSS; no required site JavaScript.
- GitHub Pages workflow uses official GitHub Actions only.
- Deployment runs from `main`.
- Repository rulesets endpoint currently returns no rulesets.
- Current connector cannot read the older branch-protection administration endpoint; classic branch protection is therefore **not verified here**.
- Do not infer from these observations that the account itself lacks other security controls.

## Operator controls to verify outside this repository

- strong GitHub MFA; prefer passkeys/security keys;
- at least two recovery/authentication factors;
- branch protection/ruleset for `main`;
- pull-request review for AI-facing/security-sensitive changes where practical;
- prevent force-push/deletion of `main`;
- secret scanning/push protection where available;
- periodically review authorised GitHub/OAuth/App access.

## Dependency posture

Keep dependencies minimal. The public site has no third-party JavaScript/runtime dependency. The deployment workflow should use official GitHub-maintained Actions and current supported major versions.

## Compromised-release withdrawal

If an AI-facing public release is suspected to be compromised:
1. treat the affected release as untrusted;
2. identify the last reviewed known-good commit;
3. revert/restore the public content to that commit through the normal reviewed Git process;
4. redeploy Pages;
5. publish the new deployed SHA in `release.html`;
6. locally pinned Copilot instructions should not adopt the newer release until reviewed;
7. investigate account/app/token access through GitHub's account/repository security controls.

A commit SHA is traceability, not proof that content is trustworthy.
