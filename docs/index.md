---
title: DevOps for SAS
hide:
  - navigation
  - toc
description: SASjs is an open-source framework for building, testing, documenting and deploying SAS applications - on Viya, SAS 9 and desktop SAS - from git and your own IDE.
---

<div class="sasjs-hero" markdown>

# DevOps for SAS

Build, test, document and deploy SAS applications on Viya, SAS 9 and desktop SAS - from git, in the IDE you already use.

[Get started](services.md){ .md-button .md-button--primary }
[Why SASjs](why.md){ .md-button }

```bash
npm i -g @sasjs/cli
```

</div>

## The short version

SAS code usually lives outside the tooling everything else lives in: no repository, no tests, no build, no deploy, and a copy-paste into a stored process or a Viya job when it is ready. SASjs gives a SAS project the same shape as any other software project.

- **One project, any SAS.** Compile and deploy the same services to Viya, to SAS 9 (EBI or Foundation), and to SASjs Server - the platform is a target, not a rewrite.
- **Git is the source of truth.** Your code lives in a repository, not in `SASAUTOS` on a server whose filesystem nobody can see.
- **Test before you ship.** Services are called from a test harness that runs anywhere, including CI, and coverage is measured.
- **Deploy in seconds.** `sasjs cbd` compiles the project, builds the deployable artefact, and loads it into the target environment.
- **Documentation comes out of the code.** Doxygen headers on your macros and services become a browsable site.
- **Apps, not just programs.** The adapter and the CLI build and deploy HTML5 applications on SAS, with a SAS (or JS, or Python) backend.

## Components

Six pieces, usable on their own or together. [What each one does](components/index.md).

<div class="grid cards" markdown>

-   **CLI**

    ---

    Compile, build, deploy, test and document a SAS project from the terminal or a pipeline.

    [`@sasjs/cli`](https://cli.sasjs.io)

-   **Macro Core**

    ---

    A library of SAS macros for application development - the runtime half of the framework.

    [`@sasjs/core`](https://core.sasjs.io)

-   **Adapter**

    ---

    The JavaScript library that connects a browser or Node app to SAS, on Viya, SAS 9 or server.

    [`@sasjs/adapter`](https://adapter.sasjs.io)

-   **Server**

    ---

    An open-source web server on Foundation SAS: a REST API, a drive, and an app portal.

    [`@sasjs/server`](https://server.sasjs.io)

-   **Lint**

    ---

    Configurable SAS code-quality rules, so a style argument is settled once, in a config file.

    [`@sasjs/lint`](https://github.com/sasjs/lint)

-   **VS Code**

    ---

    Syntax highlighting, linting, execution and compile/build/deploy inside the editor.

    [SASjs for VS Code](https://github.com/sasjs/vscode-extension)

</div>

## Where it runs

SASjs does not need a particular SAS product to exist - it needs a place to deploy to.

| Platform | What deployment means |
| --- | --- |
| **SAS Viya** | Services become job definitions in a folder, or a web app served from a folder, in a context you choose. |
| **SAS 9 (EBI or Foundation)** | Services become stored processes and files under a metadata folder, deployed over the SASjs web service (`ms_server`). |
| **SASjs Server** | Services become files on the server's drive, run on SAS, JS, Python or R, with a REST API in front. |
| **Desktop SAS** | The same project runs against a local SAS session, which is how most development and testing is done. |

The same `sasjs cbd` deploys to any of them - the target in your config decides which.

## Built on it

[Data Controller for SAS](https://datacontroller.io) - a governed, audited interface for business users to load and edit data in SAS tables - is built entirely on this framework: SAS services compiled and deployed by the CLI, a browser front end on the adapter, and the macro library underneath.

The framework itself is MIT licensed and developed in the open: [github.com/sasjs](https://github.com/sasjs).

## Three commands

```bash
sasjs create myapp -t minimal   # a project with a service, a macro and tests
cd myapp && npm install
sasjs cbd -t mytarget           # compile, build, deploy
```

`cbd` is `compile`, `build` and `deploy` in one - and `sasjs test` runs the project's tests before you get that far.

## Learn more

- [Why SASjs](why.md) - the problem it solves, and what it deliberately does not do.
- [Services quickstart](services.md) - a service, called from the browser, in one sitting.
- [Knowledge base](design.md) - how the framework is put together, and why.
- [FAQ](faq.md) and [Glossary](glossary.md).
- Reference documentation for each component: [CLI](https://cli.sasjs.io), [Core](https://core.sasjs.io), [Adapter](https://adapter.sasjs.io), [Server](https://server.sasjs.io).
