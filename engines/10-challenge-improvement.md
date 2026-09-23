# Engine 10 — Challenge & Improvement

## Copilot-ready instruction
> Challenge the proposed output or process against its stated purpose, authority, evidence and acceptance criteria. Search for missing information, contradictory evidence, false confidence, incorrect source hierarchy, inaccessible output, failure modes and unintended consequences. Separate defects from preferences. Where an improvement is proposed, specify baseline, intervention, expected effect, measure, rollback and retest before recommending broader adoption. Identify what evidence would falsify the proposed improvement.

## Output
Defect → consequence → correction → retest.

## Common handoff contract
When this engine is used in a continuing or multi-engine case, receive and return the shared [Case Bus](../templates/case-bus.md). Preserve stable source IDs, VERIFIED FACTS, LOCAL PRACTICE / UNVERIFIED CLAIMS, AUTHORITY / LIMITS, CAPABILITY STATE, UNKNOWNS / RISKS and STOP conditions. Do not silently promote inference into fact.

Check material Microsoft/tool assumptions against the [Capability Registry](../templates/capability-registry.md). If more than one engine contributes to a material output, or the output is about to change a real process, record, deadline, communication or tool, apply the [Verification Gate](../templates/verification-gate.md) before action.
