---
title: Server
description: SASjs Server - an open-source NodeJS web server on the SAS binary, with a REST API, a drive, stored programs and an app portal.
---

# Server

An open-source web server wrapped around the SAS binary. It gives an estate with Foundation SAS - or a laptop - somewhere to deploy to, with the same project that deploys to Viya: a REST API, a drive for files and services, and a portal for applications.

```text
linux.zip  ->  ./api-linux     # a single binary, no Node install required
```

## What it provides

| | |
| --- | --- |
| **REST API** | stored programs from a URL, sessions with state, log and output, and a Swagger reference served by the server itself |
| **SASjs Drive** | a file system for services, apps and data, addressed over the same API - this is what `sasjs deploy` writes to |
| **Stored programs** | a program is a file on the drive; the extension decides the runtime |
| **App portal** | uploaded web applications, launched by users, with per-user and per-group permissions |
| **Runtimes** | SAS, JavaScript, Python and R, chosen per program |

## Two modes

- **Desktop** - single user, no authentication, no database. This is how a developer runs a backend locally, or how a demo runs without a SAS licence for the web tier.
- **Server** - multi-user, authenticated, with a database for users and permissions, LDAP or OpenID Connect for identity, and the same API underneath.

## Why it exists

A SASjs project targets `SASVIYA`, `SAS9` or `SASJS`. The third is this server: it means a project can be developed, tested and demonstrated with no Viya estate and no metadata server, and it means SAS 9 shops have a way to run web applications without the stored process web tier in the path.

The JavaScript runtime is also how a service can have a mock backend: the same services, a different implementation, no SAS at all.

## Where to go next

- [Documentation](https://server.sasjs.io) - installation, settings, sessions, stored programs and the API.
- [Source and releases](https://github.com/sasjs/server), and [`@sasjs/server` on npm](https://www.npmjs.com/package/@sasjs/server).
- [Deploying to Viya](../deploy-viya.md) - the same deployment model, on Viya.
