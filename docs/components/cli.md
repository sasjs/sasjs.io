---
title: CLI
description: The SASjs CLI - create, compile, build, deploy, test, lint and document a SAS project from the terminal or a pipeline.
---

# CLI

The command line tool that turns a folder of SAS files into something deployed. It owns the project config, the compile step, the artefacts, the deploy to each platform, the test harness, the linter and the documentation generator.

```bash
npm i -g @sasjs/cli
sasjs --help
```

## What it does

| Command | For |
| --- | --- |
| `create` | scaffolds a project - plain, or from the `react`, `angular`, `minimal`, `sasonly` or `jobs` template |
| `add` | defines a target: where it deploys, and the credentials it uses |
| `compile` | one program per service, with the macros it uses embedded |
| `build` | the deployable artefact for a target - a Viya service pack, a SAS 9 script, a SASjs Server file tree |
| `deploy` | loads that artefact into the environment |
| `cbd` | compile, build and deploy in one step |
| `test` | runs the project's tests, with coverage, returning JSON, JUnit XML, LCOV or CSV |
| `lint` | configurable SAS code-quality rules, before the commit rather than after the incident |
| `logcheck` | reads a SAS log and fails on what SAS printed - the run that reported success and logged `ERROR 22-322` |
| `doc` | generates HTML documentation from the doxygen headers in your macros and services |
| `run` | executes a SAS program in a compute or workspace session |
| `job` | executes a job that is already deployed, and brings back its log and output |
| `flow` | runs a set of jobs in dependency order, on Viya or SASjs Server |
| `request` | calls a deployed service, and writes the response to a file |
| `fs` | lists, uploads and downloads files on the server's drive |
| `web` | packages a front end as streaming SAS services |
| `auth`, `context`, `folder`, `db`, `servicepack`, `snippets`, `version` | the supporting operations of a deployment |

## One project, three platforms

A target decides where a project goes: `SASVIYA`, `SAS9` or `SASJS` (SASjs Server). The same `sasjs cbd -t <target>` deploys to any of them, and a project can carry a target for each - which is how the same code is tested against a local server and delivered to production.

```bash
sasjs add                 # a target, with prompts for its connection details
sasjs cbd -t viya         # compile, build, deploy
sasjs cb                  # the artefact, without the deploy
```

## In a pipeline

Nothing about the CLI assumes a human at the keyboard: `sasjs cbd` and `sasjs test` exit non-zero on failure, logs are written to `sasjsresults`, and `sasjs logcheck` turns a SAS log into a pass or fail. That is the whole of the CI integration - no plugin, no server.

```bash
sasjs cbd -t myTarget && sasjs test -t myTarget && sasjs logcheck
```

## Where to go next

- [Reference documentation](https://cli.sasjs.io) - every command, every option.
- [Services](../services.md) - the first end-to-end walkthrough.
- [Backend SAS](../backend-getstarted.md) - project layout and targets.
- [Source and releases](https://github.com/sasjs/cli).
