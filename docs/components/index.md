---
title: Components
description: The six parts of the SASjs framework - CLI, Macro Core, Adapter, Server, Lint and the VS Code extension - and what each one does.
---

# Components

SASjs is "batteries included": six pieces that cover building, running and delivering a SAS application. Each one stands on its own - you can adopt the lint rules without the CLI, or the CLI without the adapter - and they are designed to work together.

## At a glance

| Component | Package | Runs | Does |
| --- | --- | --- | --- |
| [CLI](cli.md) | `@sasjs/cli` | Node, terminal or CI | Compiles, builds, deploys, tests, lints, documents |
| [Macro Core](core.md) | `@sasjs/core` | Inside SAS | The macros services are written with |
| [Adapter](adapter.md) | `@sasjs/adapter` | Browser or Node | Talks to SAS from JavaScript |
| [Server](server.md) | `@sasjs/server` | Node + a SAS binary | A REST API, drive and app portal on Foundation SAS |
| [Lint](lint.md) | `@sasjs/lint` | Node, editor | SAS code-quality rules |
| [VS Code](vscode.md) | extension | Editor | Highlighting, lint, execution, build and deploy |

<div class="grid cards" markdown>

-   **[CLI](cli.md)**

    ---

    `create`, `compile`, `build`, `deploy`, `test`, `lint`, `doc` - the project, from the terminal or a pipeline.

-   **[Macro Core](core.md)**

    ---

    About 200 SAS macros: JSON output, table transfer, metadata, file operations, error handling.

-   **[Adapter](adapter.md)**

    ---

    One JavaScript API for Viya, SAS 9 and server: auth, service calls, tables, files, streamed apps.

-   **[Server](server.md)**

    ---

    An open-source web server on the SAS binary - a REST API, a drive, and an app portal.

-   **[Lint](lint.md)**

    ---

    Configurable code-quality rules, in the editor and in CI, from one `.sasjslint`.

-   **[VS Code](vscode.md)**

    ---

    Highlighting, lint diagnostics, execution and the build commands, in the editor.

</div>

## How they fit together

```text
   your service (.sas)  +  macro core  ->  sasjs compile  ->  compiled program
                                                                   |
                        sasjs build  ->  artefact per target  <----+
                                                                   |
   sasjs deploy  ->  Viya jobs  |  SAS 9 stored processes  |  SASjs Server drive
                                                                   |
   browser / Node app  -- adapter -->  the deployed service  <------+
```

The compiler embeds the macros a service uses, so the program that runs in production carries its own dependencies at the version that was reviewed - there is no `SASAUTOS` on the server to disagree with the repository.

The next step depends on what you are building: [services](../services.md) for a backend called from a browser, [React](../react.md) or [Angular](../angular.md) for a full application, or [Backend SAS](../backend-getstarted.md) for a delivery pipeline.
