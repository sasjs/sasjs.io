---
title: Adapter
description: The @sasjs/adapter JavaScript library - the browser and Node client that talks to SAS on Viya, SAS 9 and SASjs Server.
---

# Adapter

The JavaScript library that connects a front end to SAS. It exists because the request that runs a job, the login, and the shape of the response are different on every platform - and the application code should not be.

```bash
npm install @sasjs/adapter
```

```javascript
import { SASjs } from '@sasjs/adapter'

const sasjs = new SASjs({
  serverUrl: 'https://sas.example.com',
  appLoc: '/Public/app/my-project',
  serverType: 'SASVIYA' // 'SAS9', or 'SASJS' for SASjs Server
})

const res = await sasjs.request('common/getdata', { areas: [{ area: 'Area 1' }] })
```

## What it handles

- **Authentication** - the Viya token exchange, the SAS 9 stored process login, and the SASjs Server token model, behind one login call.
- **Service calls** - `request()` runs a service and resolves with the tables it returned, column names uppercased, whichever platform served it.
- **Tables in** - an array in the request payload becomes a CSV the server turns into a WORK table, which is how a browser sends data to `%webout(FETCH)`.
- **Files** - upload to the server's drive, and download from it.
- **Streamed web apps** - fetching the index and the assets of an application that SAS itself is serving.
- **Compute vs JES** - on Viya, either the Job Execution Service or the compute APIs directly, which is what a Node process needs.

## The classes

| Export | For |
| --- | --- |
| `SASjs` | the one you normally use: config, login, `request()`, files, and the platform-specific clients underneath |
| `SASViyaApiClient` | the Viya REST APIs directly - contexts, sessions, jobs, files |
| `SAS9ApiClient` | the SAS 9 stored process web service |
| `SASjsApiClient` | the SASjs Server REST API |

The seed applications use `SASjs` and nothing else; the lower-level clients are there for a Node process that needs a specific API rather than a service call.

## Where it is used

Every SASjs front end is built on it: the React and Angular seed apps, [Data Controller for SAS](https://datacontroller.io), and the CLI itself, which uses the Node build of the same library to deploy and to run code remotely.

## Where to go next

- [Documentation](https://adapter.sasjs.io) - the API, the config, and the platform differences.
- [Source and releases](https://github.com/sasjs/adapter), and [`@sasjs/adapter` on npm](https://www.npmjs.com/package/@sasjs/adapter).
- [React](../react.md) or [Angular](../angular.md) - an application that uses it.
