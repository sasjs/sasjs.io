---
title: Deploying to SAS 9
description: What sasjs deploy does on SAS 9 - the web service it needs in metadata, the target settings, and what lands in the folder tree.
---

# Deploying to SAS 9

On SAS 9 a service becomes a **Stored Process** in a metadata folder, and the compiled program is what the Stored Process server (or the workspace server) executes. Deployment is the act of creating those Stored Processes and their folder tree.

## One-off: the web service in metadata

`sasjs deploy` does not write to metadata directly. It runs the generated deployment script through a Stored Process web service in metadata - the SASjs web service - and that program creates the folders and Stored Processes.

That web service is a one-off setup per metadata server, done by an administrator, and the CLI expects it at a fixed location. If a deployment fails at the point of execution with a 404 from `/SASStoredProcess/`, the web service is what is missing.

Without it there is still a route: `sasjs build` writes the SAS deployment script as part of the build output, and that script can be run by hand in SAS Studio or Enterprise Guide. It creates the same Stored Processes, under your own identity rather than the web server's - which matters if the services need to write where only the service account can.

## The target

```json
{
  "name": "sas9",
  "serverType": "SAS9",
  "serverUrl": "https://sas9.example.com",
  "appLoc": "/Products/my-project"
}
```

| Setting | Meaning |
| --- | --- |
| `serverUrl` | the web tier - the same host that answers `/SASStoredProcess/` |
| `appLoc` | the metadata folder the project deploys into; created if it does not exist |
| `serverType` | `SAS9` |

Credentials are the user and password that reach that web service, added with `sasjs add cred -t sas9` and kept outside the repository.

## Deploy

```bash
sasjs cbd -t sas9
```

or the steps separately:

```bash
sasjs compile
sasjs build -t sas9
sasjs deploy -t sas9
```

What lands under `appLoc`:

| Artefact | Where |
| --- | --- |
| services | `/services/<folder>/<name>` as Stored Processes |
| tests | `/tests/...`, compiled like services so results can be returned |
| jobs | `/jobs/...`, without the `%webout()` pre-code |
| the front end, with `streamConfig.streamWeb` | `/services/<streamServiceName>`, a streaming Stored Process |

Deploy is idempotent: it overwrites what exists by default, so the same command is a create or an update.

## Verify

The fastest check is the CLI's own: run a service and read its log.

```bash
sasjs run sasjs/services/common/appinit.sas -t sas9
sasjs job execute /Products/my-project/jobs/nightly -t sas9
```

A deployed service is also callable in a browser:

```text
https://sas9.example.com/SASStoredProcess/do?_program=/Products/my-project/services/common/getdata
```

`&_debug=131` returns the log with the output. For a pipeline, `sasjs job execute` and `sasjs run` leave their logs in `sasjsresults`, and `sasjs logcheck` reads them and fails on what SAS printed - which is the difference between "deployed" and "deployed and works".

## Things that bite on SAS 9

- **Permissions are on the folder.** Grant access to `/Products/my-project` and the subfolders decide who can call which service; the deploy runs as you, so a folder the web server cannot read is a service nobody can call.
- **The load balancer.** The SAS Load Balancer ships with three parallel multibridge connections, which is low for an application with concurrent users; 5-10 per CPU core is a sensible floor.
- **Encoding.** Stored Processes and the metadata server must agree on encoding, or non-ASCII data is mangled in the response. UTF-8 throughout the estate is the only version of this that stays fixed.
- **The web server's identity.** Services run under the workspace server's account by default, not yours. A program that needs your LIBNAMEs needs them defined for that account.

## Next

- [Viya](deploy-viya.md) - the same project, deployed to a Viya estate.
- [Frontend deployment](frontend-deployment.md) - serving the app that calls these services.
- [CORS](cors.md) - when the app is served from somewhere other than SAS.
