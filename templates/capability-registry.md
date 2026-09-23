> **PUBLIC REFERENCE TEMPLATE — INACTIVE UNTIL LOCALLY SELECTED.** This starter records capability observations. It grants no permissions and should contain no secrets.

# Microsoft 365 Capability Registry — starter

A Microsoft 365 product or licence label is not proof that a capability is usable. Record the actual client, tenant context, permission, policy, source and test conditions relevant to the bounded case.

## States
- **AVAILABLE** — observed or authoritatively confirmed for the required use.
- **LIMITED** — usable, but a material constraint applies.
- **NOT AVAILABLE** — confirmed unavailable or not permitted for the required use.
- **UNKNOWN** — not yet checked; a plan should not depend upon it.

| Capability | State | Client / environment | Permissions / policy | Dependencies / constraints | Source or observed test | Last verified | Next test |
|---|---|---|---|---|---|---|---|
| Excel desktop | UNKNOWN |  |  |  |  |  |  |
| Excel web | UNKNOWN |  |  |  |  |  |  |
| Workbook links | UNKNOWN |  |  |  | source location / trust / refresh |  |  |  |
| Power Query | UNKNOWN |  |  |  | source / authentication / refresh |  |  |  |
| OneDrive work/school | UNKNOWN |  |  |  | ownership / sharing / versioning |  |  |  |
| SharePoint libraries | UNKNOWN |  |  |  | site / access / metadata |  |  |  |
| Microsoft Lists | UNKNOWN |  |  |  | site / permissions / column design |  |  |  |
| OneNote | UNKNOWN |  |  |  | approved storage / sharing |  |  |  |
| Outlook classic | UNKNOWN |  |  |  | rules / archive / shared mailbox behaviour |  |  |  |
| New Outlook | UNKNOWN |  |  |  | feature / shared mailbox differences |  |  |  |
| Shared mailboxes | UNKNOWN |  |  | Full Access / Send As etc. | owner / retention / client behaviour |  |  |  |
| Teams | UNKNOWN |  |  |  | team/site ownership |  |  |  |
| Power Automate | UNKNOWN |  |  | licence / policy / connector permission | flow ownership / failure / continuity |  |  |  |
| Microsoft Copilot | UNKNOWN |  |  | licence / organisational AI policy | grounding / attachment / data constraints |  |  |  |

## Integrity rules
1. Verify only the capability needed for the current case.
2. Prefer a bounded observed test plus current official documentation where product behaviour matters.
3. Record limitations explicitly; AVAILABLE does not mean unlimited.
4. Re-check after material client, licence, tenant, policy or permission changes.
5. UNKNOWN never means AVAILABLE.
6. Do not record passwords, tokens, secrets or unnecessary personal data.
