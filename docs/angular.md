---
title: Angular
description: An Angular application on a SAS backend - scaffolded with sasjs create -t angular, with the adapter and a SASjs backend in one repository.
---

# Angular

The Angular seed app is the same application as the React one, in Angular: `ng new` under the hood, the [SASjs Adapter](https://adapter.sasjs.io) configured, a login screen, and a SAS backend in the same repository.

```bash
sasjs create my-app -t angular
cd my-app && npm install
```

Source: [sasjs/angular-seed-app](https://github.com/sasjs/angular-seed-app).

## What you get

```text
my-app/
├── sasjs/                 <- the backend, exactly as in the React seed
│   ├── sasjsconfig.json
│   ├── services/common/
│   └── macros/
├── src/app/
│   ├── sasjs/             <- the adapter instance and its Angular service
│   └── components/        <- including the SAS login form
└── angular.json
```

The adapter is wrapped in an injectable service, so a component asks for data rather than for SAS:

```typescript
this.sasjs.request('common/getdata', { areas }).then((res) => {
  this.springs = res.springs
})
```

## Develop

```bash
npm start               # ng serve, on localhost:4200
sasjs cbd -t myTarget   # compile, build and deploy the services it calls
```

## Deploy

```bash
sasjs cbd -t myTarget      # the services
sasjs web -t myTarget      # the front end, packaged as a streaming app
sasjs deploy -t myTarget   # both, into the target
```

Two Angular-specific notes:

- remove `<base href="/">` from `src/index.html` if the app is deployed under a subfolder of the SAS server, or the router will resolve against the domain root;
- `ng build --prod` writes to `dist/`, which is what `streamConfig.webSourcePath` should point at.

## Next

- [Services](services.md) - the backend the app calls.
- [Frontend deployment](frontend-deployment.md) - the options for serving the built app.
- [Adapter documentation](https://adapter.sasjs.io) - the full request, auth and file API.
