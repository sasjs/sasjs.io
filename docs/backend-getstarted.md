---
title: Backend SAS
description: The SAS side of a SASjs project - the folder layout, the config file, targets for Viya, SAS 9 and SASjs Server, and the compile/build/deploy cycle.
---

# Backend SAS

A SASjs project keeps its SAS code in a folder structure the CLI understands, names its environments as targets, and gets to them with a compile/build/deploy cycle. This page is the shape of all that; [Services](services.md) covers writing the code itself.

## SAS 9 and Viya are the same project

The delivery mechanism differs; the project does not. A service is a compiled program either way, and the differences are confined to what a target does with it.

| | SAS 9 | Viya |
| --- | --- | --- |
| What a service becomes | a Stored Process in a metadata folder | a job definition in a folder, held in Viya's database and managed through its APIs |
| What runs it | the Stored Process server (or the workspace server) | the compute server, in a compute context you choose |
| Identity | client or system identity | client or system identity (3.5 and later) |
| Metadata | the metadata server | PostgreSQL |
| Deployment API | the SASjs web service, in metadata | the Viya REST APIs |
| Output | `_webout` fileref | `_webout` fileref |

Both accept `_debug`, and both stream arbitrary content to `_webout`, which is what makes the same adapter work against either.

## The project

```text
my-project/
├── sasjs/
│   ├── sasjsconfig.json     <- folders and targets
│   ├── services/            <- the services, in subfolders
│   │   ├── common/          <- appinit comes first, on app start
│   │   └── admin/
│   ├── macros/              <- macros, folded into the services that use them
│   ├── programs/            <- SAS programs included by services
│   ├── db/                  <- one folder per library: DDL and load programs
│   ├── tests/               <- one test per service folder
│   └── targets/             <- per-target macros, services and programs
│       ├── sas9/
│       └── viya/
└── src/                     <- the front end, if there is one
```

`sasjs create` writes this for you:

```bash
npm i -g @sasjs/cli
sasjs create my-project -t sasonly   # backend only
sasjs create my-app -t react         # React front end + this backend
```

The templates are `react`, `angular`, `minimal`, `sasonly` and `jobs`; with no `-t` you get the plain folder structure. If the folder already holds SAS code, `sasjs init` adds the tooling without writing over it.

## The config file

`sasjs/sasjsconfig.json` declares where the code is and where it goes. The two parts that matter here:

```json
{
  "macroFolders": ["sasjs/macros"],
  "serviceConfig": {
    "serviceFolders": ["sasjs/services/common", "sasjs/services/admin"],
    "initProgram": "sasjs/services/serviceinit.sas"
  },
  "defaultTarget": "viya",
  "targets": [
    {
      "name": "viya",
      "serverType": "SASVIYA",
      "serverUrl": "https://sas.example.com",
      "appLoc": "/Public/app/my-project",
      "contextName": "SAS Job Execution compute context"
    },
    {
      "name": "sas9",
      "serverType": "SAS9",
      "serverUrl": "https://sas9.example.com",
      "appLoc": "/Products/my-project"
    }
  ]
}
```

`appLoc` is the folder everything is deployed under - a metadata folder path on SAS 9, a folder path in Viya's content tree (SAS Drive) on Viya. A target can override any root setting, which is how one project deploys different code to different environments.

The full set of keys is documented at [sasjsconfig](https://cli.sasjs.io/sasjsconfig.html), and the JSON schema is at [cli.sasjs.io/sasjsconfig-schema.json](https://cli.sasjs.io/sasjsconfig-schema.json) - point your editor at it and the file autocompletes.

## Targets and credentials

`sasjs add` prompts for a target and writes it to the project config, or to `~/.sasjsrc` if you choose the global scope:

```bash
sasjs add                  # a new target, prompts for the connection details
sasjs add cred -t myTarget # credentials for an existing target
sasjs auth -t myTarget     # log in / refresh the access token
```

On Viya that means a client id and secret (SASjs Server keeps the token for you); on SAS 9 it means the user and password used to reach the SASjs web service. `sasjs add cred` stores them outside the repository, so a target can be committed and its credentials cannot.

## Compile, build, deploy

```bash
sasjs compile          # one program per service, macros embedded
sasjs build            # the deployable artefact for the target
sasjs deploy -t myTarget
```

or, in one go:

```bash
sasjs cbd -t myTarget
```

Each step is separate because each is useful on its own: `compile` is what you run to check the SAS is valid to build, `build` produces something you can inspect and archive, and `deploy` can be re-run against a new environment without rebuilding. `sasjs cb` stops before the deploy, and `sasjs deploy` after a `sasjs auth` fixes an expired token without recompiling.

## Jobs, services and tests

- **Services** answer a caller, so they are compiled with `%webout()` and deployed under `/services/`.
- **Jobs** answer nobody - they are the batch programs a scheduler runs - so they are compiled without `%webout()` and deployed under `/jobs/`.
- **Tests** are compiled like services so their results can be returned, and deployed under `/tests/`.

## Two things to get right

**Code injection.** A URL parameter is SAS code as far as the macro processor is concerned. Viya quotes them automatically and SAS 9 does not, so treat a parameter as untrusted input: validate it, or avoid it and send a table instead. `sasjs compile` quotes what it can, and the macro library has `%mf_abort` and the `%mf_*` validation macros for the rest.

**Data storage.** A SAS data set is a good place for read-only data and a bad place for concurrent writes - there is no row-level locking. If the application writes, write to a database (or SASjs Server's drive, which is a filesystem, not a data layer) rather than to a `.sas7bdat` that several sessions have open.

## Next

- [Services](services.md) - writing, testing and calling one.
- [Deploy](buildviya.md) - what deployment means on each platform.
- [Knowledge base](design.md) - how the framework is put together.
