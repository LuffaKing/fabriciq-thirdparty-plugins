# Fabric IQ plugin for Claude

This repository hosts the **Fabric IQ** plugin for Claude and a Claude plugin
marketplace that lists it.

Fabric IQ connects Claude to the Microsoft Fabric IQ remote MCP server, so you can
ask questions about your Power BI reports and semantic models in plain language
and get answers backed by your data. See [plugins/fabriciq](plugins/fabriciq/README.md)
for details.

## Install

In Claude Code:

```
/plugin marketplace add microsoft/fabriciq-thirdparty-plugins
/plugin install fabriciq@fabriciq
```

When prompted, connect the Fabric IQ connector and sign in with your Microsoft
Entra work or school account.

## Repository layout

```
.claude-plugin/marketplace.json   Marketplace manifest
plugins/fabriciq/                 The Fabric IQ plugin
  .claude-plugin/plugin.json      Plugin manifest
  .mcp.json                       Fabric IQ remote MCP server
  skills/fabriciq/                Fabric IQ skill
```

## Contributing

This project welcomes contributions and suggestions. Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Attribution

The bundled skill is adapted from
[microsoft/skills-for-fabric](https://github.com/microsoft/skills-for-fabric) (MIT).

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft
trademarks or logos is subject to and must follow
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
