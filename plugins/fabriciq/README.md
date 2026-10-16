# Fabric IQ

Ask questions about your Power BI reports and semantic models in Microsoft Fabric,
in plain language, and get answers backed by your data.

Fabric IQ finds the reports and semantic models you can access, understands their
tables, measures and relationships, writes and runs the DAX query for you, and
explains the result. You don't need to know DAX or where the data lives.

## What you can ask

- "What were total sales by region last quarter?"
- "Which products had the biggest drop in margin compared to last year?"
- "Show the top 10 customers by revenue in the Contoso Sales report."
- "How many open support tickets do we have per priority?"

If more than one report or model matches your question, Fabric IQ asks you which
one you mean.

## Requirements

- A Microsoft Entra work or school account.
- Access to Microsoft Fabric or Power BI, with permission to read the reports
  and semantic models you want to ask about.

## Getting started

1. Install the Fabric IQ plugin.
2. Connect the Fabric IQ connector when prompted, and sign in with your
   Microsoft Entra account.
3. Ask a question about your data.

## Data and privacy

Fabric IQ runs with your own delegated permissions. It only sees reports and
semantic models you already have access to, and existing row-level and
object-level security still applies. It reads data and runs queries; it does not
create, change or delete reports, models or measures.

Your questions and the query results are sent between Claude and Microsoft
Fabric. The plugin itself stores no data and contains no credentials. See the
[Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839).

## Support

- Documentation: [Microsoft Fabric documentation](https://learn.microsoft.com/fabric/)
- Help: [Microsoft Fabric support](https://support.fabric.microsoft.com/support)

## License

MIT. The bundled skill is adapted from
[microsoft/skills-for-fabric](https://github.com/microsoft/skills-for-fabric) at
commit bc42aaf734771bf752c1d7082dd91e5a6ca72b9f; upstream attribution is preserved
in LICENSE.
