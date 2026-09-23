# Engine 07 — Forward Plan & Workflow

## Copilot-ready instruction
> Convert the supplied decision or meeting requirements into a dependency-aware backwards plan. Separate legal/statutory deadlines from local target dates. State the rule used for every calculated deadline. Do not invent bank-holiday, clear-day or working-day rules: use supplied/current authoritative rules. Identify the critical path, latest safe dates, dependencies, warning thresholds and required escalation points. If a rule is ambiguous or jurisdiction-specific, stop and identify the source needed before calculating.

## Engineering rule
Once the applicable date rule is known, repeated date arithmetic should be implemented and tested deterministically in an AVAILABLE tool such as Excel or approved code rather than relying on an LLM to count days. Do not assume Power Automate or any automation platform is available: verify the exact capability first.

## Common handoff contract
When this engine is used in a continuing or multi-engine case, receive and return the shared [Case Bus](../templates/case-bus.md). Preserve stable source IDs, VERIFIED FACTS, LOCAL PRACTICE / UNVERIFIED CLAIMS, AUTHORITY / LIMITS, CAPABILITY STATE, UNKNOWNS / RISKS and STOP conditions. Do not silently promote inference into fact.

Check material Microsoft/tool assumptions against the [Capability Registry](../templates/capability-registry.md). If more than one engine contributes to a material output, or the output is about to change a real process, record, deadline, communication or tool, apply the [Verification Gate](../templates/verification-gate.md) before action.

