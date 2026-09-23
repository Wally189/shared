# Human Tool Adapters

These cards translate an engine recommendation into a safe human action in the tool actually available. They are not API instructions.

## Excel / Power Query
**BEFORE** — identify authoritative workbook; inspect formulas, links, queries, macros, named ranges and downstream users; check Capability Registry.

**DO** — make the smallest reversible test, normally with a safe copy and dummy/permitted data.

**RETURN** — exact change, refresh/result, any error, file/client used and rollback position.

**STOP** — if ownership, credentials, source location, downstream dependency or data sensitivity is unclear.

## Outlook / shared mailbox
**BEFORE** — identify mailbox type, purpose, owner, access, retention/archive position and client.

**DO** — inventory first. Test one reversible operating rule only after constraints are understood.

**RETURN** — observed behaviour, retrieval/action effect and any client/permission difference.

**STOP** — before bulk deletion, retention/archive changes, uncontrolled copying or AI processing of sensitive historic mail.

## OneNote
**USE FOR** — private working continuity where approved: current Progress Block, bounded experiment notes, capability observations and learning.

**DO NOT USE FOR** — replacing the authoritative formal record, storing secrets, or creating an unofficial personnel file.

**RETURN** — updated Progress Block with evidence and next single step.

## OneDrive / SharePoint / Lists
**BEFORE** — identify the current canonical home, owners, permissions and why a new/shared structure is needed.

**DO** — OneDrive for personal WIP; approved shared libraries/Lists for shared state only where demonstrably better.

**RETURN** — location, ownership, metadata/version behaviour and retrieval result.

**STOP** — before duplicating canonical records, widening access or moving records without an approved route.

## Copilot / AI
**BEFORE** — load the latest Progress Block, relevant Case Bus and only permitted evidence.

**DO** — route to the smallest useful engine set. Preserve sources and unknowns.

**RETURN** — findings, verification state, one bounded next action and replacement Progress Block.

**STOP** — when the bounded outcome is complete, capability is UNKNOWN and blocks the plan, or competent professional advice/approval is required.

## Power Automate or any automation
**DEFAULT** — no dependency.

Use only when the Capability Registry says AVAILABLE or LIMITED for the exact required use, the deterministic process is already stable, ownership/failure/rollback are understood, and local policy permits it. Otherwise keep the step manual or use an available deterministic alternative.