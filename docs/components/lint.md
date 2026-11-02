---
title: Lint
description: SASjs Lint - configurable SAS code-quality rules, enforced in the editor and in the pipeline.
---

# Lint

A SAS code-quality checker. Rules are declarative and configurable, results carry line and column, and the same config drives the CLI and the editor - so the argument about style happens once, in a file, rather than in every pull request.

```bash
sasjs lint          # from a project with a .sasjslint
```

## What it checks

The rules cover the things that actually cost a SAS team time:

- **structure** - a header on every file and every macro, `%mend` naming its macro, macro parameters in parentheses, no nested comments in a doxygen header;
- **hygiene** - no hardcoded filerefs, no non-local macro variables leaking scope, one macro per file, the filename matching the macro name;
- **formatting** - indentation, trailing spaces, line length, invisible characters, tabs;
- **safety** - banned strings, discouraged functions, `%abort` where a silent failure would be worse.

A rule is switched on in `.sasjslint` by naming it - a boolean, or a number where it takes a value - and its severity is set separately:

```json
{
  "hasDoxygenHeader": true,
  "noTrailingSpaces": true,
  "maxLineLength": 300,
  "indentationMultiple": 2,
  "severityLevel": {
    "hasDoxygenHeader": "error",
    "maxLineLength": "warn"
  },
  "ignoredMacros": ["webout", "mpeinit"]
}
```

A rule left out is off. `maxLineLength` at `0` is also off, which is how a single rule is disabled in a project that inherits the rest.

## Where it runs

- **In the CLI** - `sasjs lint` for a folder or a whole project, with an exit code a pipeline can act on; `sasjs lint fix` applies the fixes that are mechanical, and `sasjs lint init` writes a starting config.
- **In VS Code** - diagnostics as you type, from the same config, through the [SASjs extension](vscode.md).
- **In `sasjs compile`** - a service is compiled the same way whether or not it was linted, so lint is a deliberate step rather than a silent gate.

## The rule set is a shared asset

The rules that ship with the tool are the ones the SASjs libraries themselves are held to - @sasjs/core, the CLI, the adapter and the server all lint in CI. Adopting the tool means adopting a rule set that has been argued about once, in public, in a config file.

## Where to go next

- [Source and releases](https://github.com/sasjs/lint), and [`@sasjs/lint` on npm](https://www.npmjs.com/package/@sasjs/lint).
- [CLI reference for `sasjs lint`](https://cli.sasjs.io/lint).
- [VS Code extension](vscode.md) - the same rules in the editor.
