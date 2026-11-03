---
title: React
description: A React application on a SAS backend - scaffolded with sasjs create -t react, with the adapter configured, services in the same repository, and one command to deploy both.
---

# React

The React seed app is a working application, not a skeleton: `create-react-app` under the hood, the [SASjs Adapter](https://adapter.sasjs.io) configured, a login screen, a request history, and a SAS backend in the same repository.

```bash
sasjs create my-app -t react
cd my-app && npm install
```

Source: [sasjs/react-seed-app](https://github.com/sasjs/react-seed-app).

## What you get

```text
my-app/
├── sasjs/                 <- the backend
│   ├── sasjsconfig.json   <- targets for viya, sas9 and a SASjs Server
│   ├── services/common/   <- appinit.sas, getdata.sas
│   ├── services/serviceinit.sas
│   └── macros/
├── src/                   <- the React application
│   ├── App.js
│   ├── api/               <- the adapter instance and the request helpers
│   └── components/        <- including the SAS login form
└── package.json
```

The adapter is created once, in `src/api`, from the target that `sasjs` deploys to:

```javascript
import { SASjs } from '@sasjs/adapter'

const sasjs = new SASjs({
  serverUrl: process.env.REACT_APP_SERVER_URL,
  appLoc: process.env.REACT_APP_APPLOC,
  serverType: 'SASVIYA'
})

export const getData = (areas) => sasjs.request('common/getdata', { areas })
```

The same component then works against Viya, SAS 9 and SASjs Server: the adapter hides which one is underneath.

## Develop

```bash
npm start               # the React dev server on localhost:3000
sasjs cbd -t myTarget   # compile, build and deploy the services it calls
```

While developing, the front end runs locally and calls a remote SAS environment - which means the SAS environment has to allow the request: see [CORS](cors.md) and the target's `cors`/`whitelist` settings. If you would rather have no server at all in the loop, point the adapter at a SASjs Server on your own machine.

## Deploy

The front end and the services deploy separately, and the CLI does both:

```bash
sasjs cbd -t myTarget      # the services
sasjs web -t myTarget      # the front end, packaged as a streaming app
sasjs deploy -t myTarget   # both, into the target
```

With `streamConfig.streamWeb` set, the front end is packaged as services and served from the SAS folder tree - on Viya from SAS Drive, on SAS 9 from metadata - so there is no separate web server to run and no CORS to configure. Without it, deploy `build/` to whatever serves your static assets and point the adapter at SAS.

The seed app's `sasjsconfig.json` has a target for each - `viya`, `sas9` and `sasjs` - so switching environments is `-t viya` versus `-t sas9`.

## Next

- [Services](services.md) - the backend the app calls.
- [Frontend deployment](frontend-deployment.md) - the options for serving the built app.
- [Adapter documentation](https://adapter.sasjs.io) - the full request, auth and file API.
