---
title: About
description: Who builds SASjs, how it is licensed, where to get help, and how to contribute.
---

# About

SASjs is built and maintained by the team behind [4GL Apps](https://sasapps.io) and [Data Controller for SAS](https://datacontroller.io). It started as the internal delivery tooling for our own SAS applications and is published because the same gap exists on almost every SAS estate.

## Licence

Everything in the framework - the CLI, the adapter, the macro library, the lint rules, the server and the VS Code extension - is MIT licensed. You can use it commercially, modify it, and ship it inside your own products, with no runtime fee and no per-seat cost.

## Where to find things

| What | Where |
| --- | --- |
| Source code | [github.com/sasjs](https://github.com/sasjs) - one repository per component |
| Issue tracker | the Issues tab of the relevant repository |
| Reference documentation | [CLI](https://cli.sasjs.io), [Core](https://core.sasjs.io), [Adapter](https://adapter.sasjs.io), [Server](https://server.sasjs.io) |
| Chat | [SASjs on Matrix](https://matrix.to/#/#sasjs:4gl.io) |
| Updates | [SASjs on LinkedIn](https://linkedin.com/company/sasjs) |

## Getting help

- **A bug, or a question about behaviour** - open an issue on the repository that owns the component. A reproducible case (the config, the command, the log) gets an answer much faster.
- **A question about how to structure a project** - the [knowledge base](design.md), the [CLI documentation](https://cli.sasjs.io) and the [glossary](glossary.md) cover most of it; the chat room covers the rest.
- **Commercial support, training or development** - [4GL Apps](https://sasapps.io) provides it, including fixed-price delivery of SAS apps built on the framework.

## Contributing

The framework is developed in the open and contributions are welcome: bug reports, documentation fixes, new lint rules, and pull requests against any component. Each repository has its own contributing notes and commit conventions; the CLI, Core, Adapter and Server all run their own test suites in CI, so a pull request that adds a test is the easiest one to merge.

If you are unsure where a change belongs, open an issue first - the framework spans six repositories and it is not always obvious.
