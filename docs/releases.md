---
title: Releases
description: Where each SASjs component is published, how versions are cut, and how to check what you are running.
---

# Releases

Each component is released independently, from its own repository, with semantic versioning driven by conventional commit messages. There is no single "SASjs version": a project pins the packages it uses, and the CLI reports what it has.

## Where each one lives

| Component | Package | Releases |
| --- | --- | --- |
| [CLI](components/cli.md) | [`@sasjs/cli`](https://www.npmjs.com/package/@sasjs/cli) | [sasjs/cli releases](https://github.com/sasjs/cli/releases) |
| [Macro Core](components/core.md) | [`@sasjs/core`](https://www.npmjs.com/package/@sasjs/core) | [sasjs/core releases](https://github.com/sasjs/core/releases) |
| [Adapter](components/adapter.md) | [`@sasjs/adapter`](https://www.npmjs.com/package/@sasjs/adapter) | [sasjs/adapter releases](https://github.com/sasjs/adapter/releases) |
| [Server](components/server.md) | [`@sasjs/server`](https://www.npmjs.com/package/@sasjs/server) | [sasjs/server releases](https://github.com/sasjs/server/releases) - executables as well as the package |
| [Lint](components/lint.md) | [`@sasjs/lint`](https://www.npmjs.com/package/@sasjs/lint) | [sasjs/lint releases](https://github.com/sasjs/lint/releases) |
| [VS Code](vscode.md) | extension | [sasjs/vscode-extension releases](https://github.com/sasjs/vscode-extension/releases) |

## Checking what you have

```bash
sasjs --version                      # the CLI you are running
npm view @sasjs/cli version          # the newest published version
npm outdated                         # what a project is behind on
```

A project's `package.json` is the place to pin Core and the adapter. The CLI is usually global, which is why `sasjs --version` is part of any bug report.

## How a release happens

Commits carry conventional messages - `feat:`, `fix:`, `docs:`, and a scope where it helps. Merging to the default branch runs the test suite, and a release is cut from the commit messages: a `feat:` is a minor version, a `fix:` a patch, a `BREAKING CHANGE:` a major one. The changelog is generated from the same messages, so the release notes are the commit history rather than a separate document that drifts from it.

That has one consequence worth knowing: the version number tells you the nature of the change, and the release notes tell you the detail. A `fix:` release can still change behaviour if the previous behaviour was wrong.

## Upgrading

- **Core** is embedded at compile time, so upgrading it means recompiling and redeploying - which is also why an upgrade cannot break a service you have not rebuilt.
- **The CLI** is global; upgrade it with `npm i -g @sasjs/cli`.
- **The adapter** is a project dependency, so a normal `npm install` brings it in; check the release notes for breaking changes before a major.
- **Server** is a single binary: download the release, verify its checksum, and replace it - the settings and the drive live outside the binary.

## Following along

- Watch the repository you depend on (Releases only) for the releases that matter to you.
- The [SASjs chat room](https://matrix.to/#/#sasjs:4gl.io) and [LinkedIn](https://linkedin.com/company/sasjs) carry announcements.
