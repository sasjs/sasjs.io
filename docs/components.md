---
title: Components
description: The six parts of the SASjs framework - CLI, Macro Core, Adapter, Server, Lint and the VS Code extension - and what each one does.
---

# Components

SASjs is "batteries included": six pieces that cover building, running and delivering a SAS application. Each one stands on its own - you can adopt the lint rules without the CLI, or the CLI without the adapter - and they are designed to work together.

## At a glance

| Component | Package | Runs | Does |
| --- | --- | --- | --- |
| [CLI](#cli) | `@sasjs/cli` | Node, terminal or CI | Compiles, builds, deploys, tests, lints, documents |
| [Macro Core](#macro-core) | `@sasjs/core` | Inside SAS | The macros services are written with |
| [Adapter](#adapter) | `@sasjs/adapter` | Browser or Node | Talks to SAS from JavaScript |
| [Server](#server) | `@sasjs/server` | Node + a SAS binary | A REST API, drive and app portal on Foundation SAS |
| [Lint](#lint) | `@sasjs/lint` | Node, editor | SAS code-quality rules |
| [VS Code](#vs-code-extension) | extension | Editor | Highlighting, lint, execution, build and deploy |

## CLI

The command line tool that turns a folder of SAS files into something deployed. It owns the project config, the compile step, the build artefacts, the deploy to each platform, the test harness, the linter and the documentation generator.

```bash
npm i -g @sasjs/cli
sasjs --help
```

The commands you will use most: `create`, `compile`, `build`, `deploy` (and `cbd` for all three), `test`, `lint`, `doc`, `run`, `flow`, `request`, `job`, `servicepack`, `fs`, `db`, `folder`, `context`, `web`, `auth`, `add`, `snippets`, `version`, `logcheck`.

Reference: [cli.sasjs.io](https://cli.sasjs.io) - one page per command.

## Macro Core

The runtime half. About 200 macros for application development: JSON and CSV output, table transfer, metadata, file and folder operations, SAS 9 and Viya web services, error handling, and the session and security plumbing the rest of the framework relies on.

`sasjs compile` embeds the macros a service uses into the compiled program, which is what makes a deployed service independent of `SASAUTOS` and of the server's file system. You can also use the library directly - it is a normal `SASAUTOS` folder.

Reference: [core.sasjs.io](https://core.sasjs.io) - generated from the macro headers.

## Adapter

The JavaScript library that connects a front end to SAS. It handles the parts that are different on every platform so that the application code is not: authentication against Viya or SAS 9, service calls over the SASjs web service or the Viya APIs, uploading tables, streaming web apps, and reading the response back into JavaScript.

```javascript
import { SASjs } from '@sasjs/adapter'
```

It is what makes a React or Angular application portable between Viya, SAS 9 and SASjs Server.

Reference: [adapter.sasjs.io](https://adapter.sasjs.io).

## Server

An open-source Node web server wrapped around the SAS binary: it runs stored programs from a URL, serves a drive of files, hosts an app portal, and exposes a REST API with Swagger. It exists so that an estate with Foundation SAS, or a laptop, has somewhere to deploy to - the same project that deploys to Viya.

Reference: [server.sasjs.io](https://server.sasjs.io).

## Lint

A SAS code-quality checker: configurable rules for naming, structure, macro hygiene and style, run from the CLI or in the editor and reported with line numbers. `.sasjslint` holds the rules, so the argument about style happens once.

```bash
sasjs lint
```

Source and rule list: [github.com/sasjs/lint](https://github.com/sasjs/lint).

## VS Code extension

Everything above, in the editor: syntax highlighting for SAS, lint results as you type, execution of a program against Viya, SAS 9 or SASjs Server, and the compile/build/deploy commands without leaving VS Code.

Install: [SASjs for VS Code](https://github.com/sasjs/vscode-extension).

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

The next step depends on what you are building: [services](services.md) for a backend called from a browser, [React](react.md) or [Angular](angular.md) for a full application, or [Backend SAS](backend-getstarted.md) for a pure SAS delivery pipeline.
