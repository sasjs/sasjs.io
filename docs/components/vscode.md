---
title: VS Code extension
description: SASjs for VS Code - SAS syntax highlighting, linting, execution, and compile/build/deploy without leaving the editor.
---

# VS Code extension

SAS development in VS Code, with the framework's tooling inside it: syntax highlighting for SAS, lint results as you type, execution of a program against a real server, and the CLI's commands without switching to a terminal.

Install it from the [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=SASjs.sasjs-for-vscode) or from [Open VSX](https://open-vsx.org/extension/SASjs/sasjs-for-vscode).

## What it adds

| Feature | Detail |
| --- | --- |
| **Syntax highlighting** | SAS language support - DATA step, macros, PROC SQL, and the doxygen headers the framework uses |
| **Linting** | the [SASjs Lint](lint.md) rules, as you type, from `.sasjslint` |
| **Execution** | run a program against Viya, SAS 9 or SASjs Server, and read the log in the output pane |
| **Build and deploy** | `compile`, `build`, `deploy` and `cbd` for a target, from the command palette |
| **Formatting** | the formatter's output applied to the open file |

## Why it is part of the framework

The extension is not a separate product with its own idea of a project: it reads the same `sasjs/sasjsconfig.json`, calls the same CLI, and reports the same lint rules. A developer who works in VS Code and a pipeline that deploys from a container are running the same commands against the same config.

## Where to go next

- [Source and releases](https://github.com/sasjs/vscode-extension).
- [Lint](lint.md) - the rules the editor enforces.
- [CLI](cli.md) - the commands it drives.
