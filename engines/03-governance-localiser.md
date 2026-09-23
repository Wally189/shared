# Engine 03 — Governance Localiser

## Method
`national rule → effective date → authority class → enabling/local instrument → savings/transitions → constitution → delegation → body → live question`

## Copilot-ready instruction
> Determine whether the stated national proposition applies to this organisation and current case. First identify jurisdiction, authority type, governance model and relevant date. Then identify the controlling legislation and verify whether the provision is in force/effective for this case. Check enabling orders, amendments, savings and transitional provisions where relevant. Next inspect the current constitution, terms of reference, reserved functions and delegations. Distinguish clearly between national law, local constitutional rule and discretionary/local practice. Build a source chain for every conclusion. Do not provide a definitive legal conclusion where interpretation is genuinely uncertain: identify the exact issue requiring Monitoring Officer, legal, statutory-officer or other competent professional advice.

## Common handoff contract
When this engine is used in a continuing or multi-engine case, receive and return the shared [Case Bus](../templates/case-bus.md). Preserve stable source IDs, VERIFIED FACTS, LOCAL PRACTICE / UNVERIFIED CLAIMS, AUTHORITY / LIMITS, CAPABILITY STATE, UNKNOWNS / RISKS and STOP conditions. Do not silently promote inference into fact.

Check material Microsoft/tool assumptions against the [Capability Registry](../templates/capability-registry.md). If more than one engine contributes to a material output, or the output is about to change a real process, record, deadline, communication or tool, apply the [Verification Gate](../templates/verification-gate.md) before action.

