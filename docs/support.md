---
title: Support
description: SASjs is MIT licensed and free to use. Commercial support, training and development are available from the team that builds it.
---

# Support

SASjs is MIT licensed: no licence fee, no per-seat cost, no runtime fee, and no feature held back for a paid tier. Everything on this site is that software.

Commercial support exists for the part that licence cannot cover - when a deployment has to land, on an estate with its own constraints, on a date.

## What is free

| | |
| --- | --- |
| The software | all six components, MIT, source on [GitHub](https://github.com/sasjs) |
| This site and the reference docs | [CLI](https://cli.sasjs.io), [Core](https://core.sasjs.io), [Adapter](https://adapter.sasjs.io), [Server](https://server.sasjs.io) |
| Issues and questions | the Issues tab of the relevant repository, and the [SASjs chat room](https://matrix.to/#/#sasjs:4gl.io) |
| The seed apps | React, Angular, minimal, SAS-only and jobs templates - `sasjs create` |

## What is commercial

From [4GL Apps](https://sasapps.io), the team that builds the framework:

- **Support** - a named contact, a response time, and help with upgrades, deployment problems and platform differences. Useful on an estate where "the deploy script failed in production" is a business event.
- **Training** - a team that has written SAS for twenty years and web applications for ten, teaching the framework against your own code rather than a sample project.
- **Development** - fixed-price delivery of a SAS application: the services, the front end, the deployment pipeline, and the documentation.
- **A running application** - [Data Controller for SAS](https://datacontroller.io) is the packaged version of what this framework exists to build: governed data editing on SAS, deployed to your estate.

Contact: [sasapps.io/contact-us](https://sasapps.io/contact-us).

## What to send with a question

Whether it is an issue or a support call, the same four things make it answerable in one exchange:

1. the output of `sasjs --version`, and the `serverType` and `appLoc` of the target (never the credentials);
2. the command you ran, and its full output;
3. the SAS log, from `sasjsresults` if a `run`, `job execute` or `test` produced it - or `sasjs logcheck` on it, which turns the log into a list of what SAS objected to;
4. what you expected to happen.

## Next

- [Releases](releases.md) - what versions exist, and how to check what you are running.
- [About](about.md) - who builds it, and how to contribute.
