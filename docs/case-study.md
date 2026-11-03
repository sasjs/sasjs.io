---
title: Data Controller for SAS
description: A commercial SAS application built entirely on the SASjs framework - 230 services, 55 macros and thirteen deployment targets across SAS 9, Viya and SASjs Server.
---

# Built on SASjs: Data Controller

[Data Controller for SAS](https://datacontroller.io) is the framework's proof: a commercial application, in daily use on SAS estates, built with every part of SASjs and deployed by the CLI to whichever platform the customer has.

It exists because editing data in a SAS table is a governance problem, not a technical one. The business needs to correct a value, add a row, approve a change - and the SAS team needs the audit trail, the validation and the approval workflow to be the same in every environment. Data Controller is that interface: an Angular application in the browser, 230 SAS services behind it, and a table-level policy of who may change what.

## The shape of it

Taken from the project's own configuration:

| | |
| --- | --- |
| Services | 230 `.sas` files in seven folders - `admin`, `approvers`, `auditors`, `editors`, `hooks`, `public`, `validations` |
| Macros | 55, in `sasjs/macros` |
| Front end | Angular, on `@sasjs/adapter` - the same library the seed apps use |
| Targets | 13 in one `sasjsconfig.json`: SAS 9, five Viya environments, seven SASjs Server |
| Deployment | `sasjs cbd -t <target>` - compile, build, deploy, per environment |

Thirteen targets is the point. A SAS 9 customer, a Viya customer and the CI server running tests all get the same code from the same repository, compiled the same way, with the differences confined to the target: `appLoc`, the server type, the context, the credentials.

## What it demonstrates

- **The compile step does the heavy lifting.** A deployment carries its services and the macros they use, so a customer upgrade does not mean "also deploy the macro library, in the right order, to the right folders".
- **One adapter, three platforms.** The Angular client calls `sasjs.request()` and does not know whether the answer came from a stored process, a Viya job or SASjs Server.
- **Permissions are the platform's.** The folder structure - editors, approvers, auditors - maps onto SAS 9 metadata permissions and Viya folder permissions, so the application's authority model is the estate's, not a second one invented in JavaScript.
- **The framework is usable at application scale.** 230 services and 55 macros is not a demo; it is what an application with a real permission model, an audit trail and a validation framework looks like.

## Where the same patterns are documented

Everything Data Controller relies on is in this site's guides - nothing in it is a private extension of the framework:

- [Services](services.md) - the unit of backend work, and how it is compiled and deployed.
- [Security](security.md) - identities, permissions and the trust boundaries the application inherits.
- [Testing](testing.md) - the harness the services are tested with.
- [Deploying to Viya](deploy-viya.md) and [SAS 9](deploy-sas9.md) - what a target does on each.

## Licensing and availability

Data Controller is a commercial product with a free non-commercial licence; SASjs itself, which it is built on, is MIT licensed. See [datacontroller.io](https://datacontroller.io) for the product, and [Support](support.md) for what the team behind both offers commercially.
