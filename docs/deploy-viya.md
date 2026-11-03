---
title: Deploying to Viya
description: What sasjs deploy does on SAS Viya - the target and its auth, what lands in the folder tree, streaming apps, and how to verify it.
---

# Deploying to Viya

On Viya a service becomes a **job definition** in a folder, and the compute server runs it in a compute context. The folders and jobs are objects in Viya's database, addressed by path and managed through the Viya APIs - there is no directory on the operating system that holds them, so nothing is deployed by copying a file.

## The target

```json
{
  "name": "viya",
  "serverType": "SASVIYA",
  "serverUrl": "https://sas.example.com",
  "appLoc": "/Public/app/my-project",
  "contextName": "SAS Job Execution compute context"
}
```

| Setting | Meaning |
| --- | --- |
| `serverUrl` | the Viya environment - the host that answers `/SASLogon/` and the compute APIs |
| `appLoc` | the folder in Viya's content tree (SAS Drive) the project deploys into; created if it does not exist |
| `contextName` | the compute context the jobs run in - `SAS Job Execution compute context` when you want the job execution service to run them |
| `serverType` | `SASVIYA` |

## Authentication

Viya has no password login for automation; the CLI needs a client id and secret, or an access token.

```bash
sasjs add                # prompts for serverUrl, client, secret, appLoc, contextName
sasjs auth -t viya       # log in, and hold the token for the following commands
```

`sasjs add` writes the client and secret where they are not committed - the project config keeps the target, the credentials stay in the user profile. On an estate with a self-signed certificate, `sasjs add --insecure` accepts it for that command only; the permanent fix belongs in the target's `httpsAgentOptions`, or in the certificate chain.

## Deploy

```bash
sasjs cbd -t viya
```

or the steps separately: `sasjs compile`, `sasjs build -t viya`, `sasjs deploy -t viya`.

What lands under `appLoc`:

| Artefact | Where |
| --- | --- |
| services | `/services/<folder>/<name>` as jobs |
| tests | `/tests/...` |
| jobs | `/jobs/...`, without the `%webout()` pre-code |
| the front end, with `streamConfig.streamWeb` | `/services/<streamServiceName>` as a streaming job, plus `assets` and the logo |

Deployment is idempotent - it overwrites - so the same command creates or updates.

## Streaming the front end

With `streamConfig.streamWeb` set, `sasjs build` packages the built front end (from `webSourcePath`, `build/` or `dist/` depending on your framework) into services that the adapter can request, and the whole application is served by Viya: no web server to host, no CORS to configure, and the same folder permissions that protect the data protect the app.

```json
"streamConfig": {
  "streamWeb": true,
  "streamWebFolder": "web",
  "webSourcePath": "build",
  "streamServiceName": "My App",
  "streamLogo": "logo.png"
}
```

The CLI prints the app's URL after a deploy with streaming enabled.

## Verify

```bash
sasjs run sasjs/services/common/appinit.sas -t viya    # run a program in a compute session
sasjs job execute /Public/app/my-project/jobs/nightly -t viya
```

A deployed service is callable through the job execution service:

```text
https://sas.example.com/SASJobExecution?_PROGRAM=/Public/app/my-project/services/common/getdata&_debug=131
```

Both `run` and `job execute` leave a log in `sasjsresults`, and `sasjs logcheck` reads those logs and fails on errors - which is what catches the run that reports success and printed `ERROR 22-322` anyway.

## Things that bite on Viya

- **The context decides the identity.** `runServerAs` and `reuseServerProcesses` on the compute context are how a service account is used and how SAS processes are reused between requests. Without `reuseServerProcesses`, every request pays the session start.
- **`streamWebFolder` is a folder in the content tree**, not an OS directory: the front end's files are objects in Viya, and that folder's permissions are what decide who can fetch the app.
- **Encoding and locale** come from the compute session, not from the adapter. A context with a different encoding from your development sessions will change what your `proc sql` compares.
- **The token expires.** `sasjs deploy` fails on an expired token with a 401 or 403; `sasjs auth -t viya` re-authenticates, and `sasjs deploy` alone finishes the job without recompiling.

## Next

- [SAS 9](deploy-sas9.md) - the same project, deployed to metadata.
- [Frontend deployment](frontend-deployment.md) - the options for serving the app that calls these services.
- [Viya notes](guide-viya.md) - compute context, server reuse and the REST APIs.
