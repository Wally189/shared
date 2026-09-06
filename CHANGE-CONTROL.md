# Bounded GitHub change control

Status: pilot control for this private repository.

## Purpose

Use GitHub where version-controlled technical change, diff review, automated checking, rollback and traceable closure provide a real advantage.

For non-trivial technical changes in this repository, prefer:

ISSUE → BRANCH → CHANGE → TEST → PULL REQUEST → REVIEW → MERGE → VERIFY → CLOSE ISSUE.

Trivial, low-risk edits may use a lighter route when the control burden would exceed the benefit.

## Authority boundary

Google Drive remains authoritative for Crown OS institutional documents, governance records, business records and human-readable canonical institutional knowledge unless a specific current authority states otherwise.

GitHub is authoritative only for the version-controlled technical artefacts actually maintained in the relevant repository and branch. A Drive reference may point to GitHub evidence; GitHub must not silently become a competing copy of Drive truth.

## Information boundary

Do not commit passwords, tokens, API keys, credentials, unnecessary personal data, confidential third-party material, regulated/sensitive records, or specialist House records that belong in another controlled system.

Use repository secrets or an approved external secret-management mechanism for credentials when automation genuinely requires them.

## Closure evidence

A change is not complete merely because code was written or a PR merged. Verify the accepted result on the authoritative branch or target environment as applicable, then close the originating Issue only when its acceptance condition is actually met.

## Pilot limitation

This file does not designate `Wally189/shared` as the federation-wide Crown OS shared repository and does not create new Crown, House or specialist authority.