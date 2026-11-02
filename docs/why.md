---
title: Why SASjs
description: What SASjs changes about developing on SAS - one project for Viya, SAS 9 and desktop SAS, with git, tests, a build and a deploy.
---

# Why SASjs

SAS is very good at running programs and unusually bad at everything around them. A team that writes excellent SAS still ends up with code that lives on a server, is tested by running it, is deployed by copying files, and is documented in a Word document that is already out of date.

That is not a criticism of the people writing it. SAS tooling has historically been aimed at analysts, not at software delivery, and the delivery part has been left to whoever was available. SASjs is an opinionated answer to that gap.

## The four symptoms

- **The code is not in a repository.** It is in `SASAUTOS`, or in a metadata folder, or on a share that only two people can reach. There is no diff, no review, and no way to know what is deployed where.
- **There is no build.** "Deploy" means a person copying files into the right folders in the right order, and remembering the macro library dependency.
- **There is no test.** The first execution of a change is the test, and it happens in the environment the business uses.
- **The target is baked in.** A program written for a stored process does not run as a Viya job, so a move to Viya means a rewrite of the delivery mechanism even when the logic is unchanged.

## What SASjs changes

| Symptom | With SASjs |
| --- | --- |
| Code lives on the server | Code lives in git. The server is a deployment target. |
| Deploy is a manual copy | `sasjs cbd` compiles, builds and deploys from the repository, and the same command runs in a pipeline. |
| Tests are manual | Services are called from a test harness that runs locally and in CI, with coverage measured. |
| One target per project | `sasjsconfig.json` names targets - Viya, SAS 9, server - and the same project deploys to each. |
| Documentation is a separate document | Doxygen headers on macros and services are built into a browsable site by `sasjs doc`. |
| Style is a matter of opinion | Configurable lint rules, enforced in the editor and in the pipeline. |

## How it fits together

SASjs has two halves, and they meet at the boundary SAS already has: the macro library runs *inside* SAS, and the CLI runs *outside* it.

1. **You write services** - `.sas` files with a header that declares their inputs and outputs. Inside a service you use the macro library: `%mf_abort`, `%mp_jsonout`, `%ms_getsession`, and the rest.
2. **`sasjs compile`** turns each service into a self-contained program, embedding the macros it needs, so the deployed program has no dependency on `SASAUTOS` and no dependency on the server's file system.
3. **`sasjs build`** writes the artefact a target can consume - a service pack, a Viya job folder, a web app.
4. **`sasjs deploy`** loads it into the environment, using the target's own API: the SASjs web service on SAS 9, the Viya APIs on Viya, the REST API on SASjs Server.
5. **At runtime**, a browser or Node application calls the service through the adapter, which knows how to authenticate, how to send tables, and how to read the response - on all three platforms.

Because the compilation step embeds the macros, what runs in production is exactly what was tested, not "the same code, but with whatever is in `SASAUTOS` this week".

## Who it is for

- Teams delivering SAS applications - web apps, data-loading tools, reporting portals - where more than one person maintains the code.
- Teams moving to Viya that want the delivery mechanism to be portable rather than rewritten.
- SAS shops with a change-control requirement: who changed what, when, and what exactly is deployed.
- Anyone who has ever debugged production by opening a program in Enterprise Guide over a remote desktop.

## What it is not

- **Not a replacement for SAS Studio, Enterprise Guide or SAS DI.** Those are development and ETL tools; SASjs is the build and delivery layer underneath what you write in them.
- **Not a scheduler.** It deploys jobs; your scheduler still triggers them.
- **Not a metadata manager.** It writes to metadata on SAS 9 and to folders on Viya as a deployment act, and leaves governance to the platform.
- **Not a runtime you have to adopt.** The macro library is usable without the CLI, the CLI without the adapter, and the adapter against an estate that has never heard of SASjs.

## Cost and licence

Everything in the framework is MIT licensed: the CLI, the adapter, the macro library, the lint rules, the server and the VS Code extension. There is no paid tier and no runtime fee. Commercial support, training and development are available from the team that builds it - see [About](about.md).
