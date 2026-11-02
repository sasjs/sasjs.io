---
title: Frontend web
description: How a SASjs frontend is built and served - a static application on the adapter, and the three ways to deliver it from SAS.
---

# Frontend web

A SASjs front end is an ordinary web application - React, Angular, or plain JavaScript - that talks to SAS services through the [adapter](components/adapter.md). There is no template language in the middle: the browser renders the interface, SAS answers with data.

That separation is the whole design. The front end can be built, tested and reviewed with the tools web developers already use, by people who do not write SAS; the services can be written and tested by people who do not write JavaScript. Both live in one repository, and the CLI deploys both.

## What not to do

The traditional SAS approach is to generate the interface from SAS: `put` statements in a DATA step, or `proc stream`, writing HTML out of `_webout`. It works for a form. It stops working at the first feature that needs state, routing or a component library - the markup is now a string literal inside a SAS program, with no build step, no syntax checking and nobody willing to change it.

SASjs supports streaming content to `_webout` - that is how a built application is delivered - but the HTML it streamed was written by a front end developer, not by a DATA step.

## Three ways to serve the same application

| Approach | How | When |
| --- | --- | --- |
| **Streamed from SAS** | `sasjs web` packages the built front end as services; SAS serves the index, the assets and the API | one deployment target, no separate web server, no CORS - works on SAS 9 and Viya |
| **Static host, adapter to SAS** | `build/` or `dist/` goes to any static host or CDN; the adapter calls SAS directly | a CDN or existing web tier, and the SAS estate can accept cross-origin requests |
| **SASjs Server app portal** | upload the built app as a zip; the server hosts it, with per-user and per-group permissions | SAS 9 shops without a web tier, demos, internal tools |

All three run the same application code and the same services. The difference is who serves the files.

## Streamed from SAS

This is the option most SAS estates end up choosing, because it removes the two things that usually block a SAS web application: a web server nobody wants to own, and a CORS policy nobody wants to change.

```json
"streamConfig": {
  "streamWeb": true,
  "streamWebFolder": "web",
  "webSourcePath": "build",
  "streamServiceName": "My App"
}
```

`sasjs cbd -t myTarget` compiles the services, packages the front end into streaming services, and deploys both. The CLI prints the URL. See [Deploying to Viya](deploy-viya.md) and [SAS 9](deploy-sas9.md) for what that means on each platform.

## Developing locally

The front end runs on `localhost` and calls a real SAS environment, which is the fastest loop there is - the alternative is rebuilding and redeploying to see a CSS change.

```bash
npm start               # the dev server
sasjs cbd -t myTarget   # deploy the services it calls
```

Because the origin differs, the SAS side has to allow it: `cors` and `whitelist` settings on Viya, or the equivalent on the web tier. [CORS](cors.md) covers the details, including the version that catches everybody out - a browser request that works from `curl` and fails from the app is a preflight.

## Choosing a framework

- [React](react.md) and [Angular](angular.md) are the two seed applications: real apps, with login, a request history and a SASjs backend already wired up.
- `sasjs create my-app -t minimal` is a small application in plain JavaScript, which is the fastest way to see the adapter without a framework.
- Anything else works too: the adapter is a library, not a framework, and a Vue or Svelte or htmx front end uses it the same way.

## Next

- [Frontend deployment](frontend-deployment.md) - the deployment options in more detail.
- [State management](state-management.md) - where the application's data lives, and what to fetch again.
- [CORS](cors.md) - when the app and SAS are on different origins.
