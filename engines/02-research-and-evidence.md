# Engine 02 — Research & Evidence

## Purpose
Answer a defined governance question from current attributable evidence.

## Copilot-ready instruction
> Research the stated question using the strongest appropriate authoritative sources available to you. Establish jurisdiction and material date first. Distinguish LAW / MANDATORY REQUIREMENT, STATUTORY GUIDANCE, FORMAL STANDARD, ESTABLISHED SECTOR PRACTICE and ANALYSIS. Prefer primary and current sources. Record source title, responsible body, date/effective date and source locator. Identify disagreement, missing evidence or uncertainty rather than smoothing it away. Do not infer a particular body's power or delegation from national law alone. Return: (1) short answer; (2) evidence table; (3) applicability and limitations; (4) questions requiring competent professional confirmation; and (5) the next source to check if unresolved.

## STOP / REFER
Refer specialist legal/professional interpretation where evidence does not settle the point.


## MICROSOFT / TOOL-DIAGNOSIS MODE

Use this mode when somebody makes a claim such as "Power Query cannot do that", "connected workbooks only work if both are open", "Lists will replace this formula", or "SharePoint cannot refresh this".

### Additional instruction

> Treat the stated tool claim as a hypothesis, not a fact. First define exactly what the speaker means: product, feature, version, desktop/web environment, file location, data source, authentication, refresh method, permissions and desired outcome. Distinguish similarly named mechanisms such as workbook formula links, Power Query queries, external data connections, Power Automate flows, linked data types and SharePoint/OneDrive file sources. Verify the current capability using official vendor documentation before recommending a design. Return: CLAIM; WHAT IT MAY ACTUALLY MEAN; VERIFIED CAPABILITY; CONSTRAINTS; LOWEST-DISRUPTION OPTIONS; TEST TO RUN; RECOMMENDATION; ROLLBACK. Do not recommend procurement or a new platform until ordinary Microsoft 365 options have been tested.

### Power Query regression question

If asked whether "Power Query can work with connected workbooks", do not answer until "connected" has been decomposed. Microsoft documents ordinary workbook links separately from Power Query and external connections. Power Query can connect to Excel workbooks and SharePoint/OneDrive sources and can combine multiple sources, but refresh support and authentication vary by source and by Excel desktop/web environment.
