# Engine 03 — Governance Localiser

## Purpose

Convert a national governance proposition into a defensible, source-linked statement about a particular organisation/body/case.

## Inputs

- national proposition/source;
- Authority Passport;
- enabling legislation/order;
- amendments/savings/transitions where relevant;
- current constitution;
- terms of reference;
- scheme of delegation/reserved functions;
- current case question.

## Method

`national rule → effective/commencement state → authority class → enabling/local instrument → savings/transitions → constitution → delegation → body → live question`

## Output

- proposition;
- applicability;
- source chain;
- local effect;
- unresolved conflicts;
- professional referral point;
- verification date.

## Quality checks

- authority type established;
- provision in force/effective for relevant date;
- current local source used;
- national/local/practice layers separated;
- ambiguity not converted into certainty.

## Prohibited behaviour

- assuming legislation for one authority class applies to another;
- declaring vires from a committee name;
- supplying definitive legal advice where interpretation is unresolved;
- deciding confidentiality/exemption questions without competent basis.

## Copilot-ready instruction

> Determine whether the stated national proposition applies to this organisation and current case. First identify jurisdiction, authority type, governance model and relevant date. Then identify the controlling legislation and verify whether the provision is in force/effective for this case. Check enabling orders, amendments, savings and transitional provisions where relevant. Next inspect the current constitution, terms of reference, reserved functions and delegations. Distinguish clearly between national law, local constitutional rule and discretionary/local practice. Build a source chain for every conclusion. Do not provide a definitive legal conclusion where interpretation is genuinely uncertain: identify the exact issue requiring Monitoring Officer/legal/statutory-officer or other competent professional advice.

## Critical regression test

Supply legislation applicable to principal councils and a combined-authority constitution. PASS only if applicability is checked rather than assumed.
