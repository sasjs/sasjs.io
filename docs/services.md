<!-- do not move or rename - is linked from here:
https://www.sas.com/content/dam/SAS/support/en/sas-global-forum-proceedings/2020/4260-2020.pdf
-->
# Services

A service is a SAS program a browser - or another system - can call, and which answers with data. In SASjs it is a `.sas` file in `sasjs/services`, compiled by the CLI and deployed to a target, so what runs in production is exactly what was reviewed in the repository.

This page is the end-to-end version: write one, compile it, deploy it, call it.

## 1. Write the service

A service is ordinary SAS. The only framework-specific part is how it receives input and returns output: `%webout()`.

```sas
/**
  @file
  @brief List the springs in an area
  @details Called with the area selected in the app's dropdown.
  <h4> SAS Macros </h4>
  @li mf_abort.sas
**/

/* the table the browser sent arrives as a WORK table, named as it was sent */
%webout(FETCH)

%mf_abort(
  iftrue=(%sysfunc(exist(work.areas))=0),
  msg=No area was supplied
)

proc sql;
  create table springs as
    select * from mydb.springs
    where area in (select area from work.areas);
quit;

%webout(OPEN)
%webout(OBJ,springs)
%webout(CLOSE)
```

`%webout()` is supplied by `sasjs compile`, not by you: the compiler prepends it (and the macros it depends on) to every service and every test, which is why the deployed program has no dependency on `SASAUTOS`. Its actions are:

| Call | Does |
| --- | --- |
| `%webout(FETCH)` | Turns each table the caller sent into a WORK table of the same name |
| `%webout(OPEN)` | Starts the JSON response |
| `%webout(OBJ, work.table)` | Adds a table, one JSON object per row |
| `%webout(ARR, work.table)` | Adds a table, one JSON array per row (smaller, no column names) |
| `%webout(CLOSE)` | Ends the JSON response |

Anything you `%put` goes into the log, which the caller can ask for with `_debug=131` - and which `sasjs logcheck` fails a deployment on if it contains an error.

## 2. Put it in the project

```text
sasjs/
├── sasjsconfig.json
├── services/
│   ├── common/
│   │   ├── appinit.sas      <- called first, on app start
│   │   └── getdata.sas
│   └── admin/
│       └── adduser.sas
├── macros/                  <- your macros, folded into the services that use them
└── tests/                   <- one test per service folder
```

The folders are declared in `sasjsconfig.json`; subfolders are for organisation and for the SAS 9 / Viya permission model, which grants access per folder. One service per file, lowercase names, and the filename is the service name.

A service is not the only thing a folder can hold: a `.js`, `.py` or `.r` file is compiled and deployed in the same way, which is how a JavaScript or Python backend works. See [JavaScript services](https://cli.sasjs.io/js-services) in the CLI documentation.

## 3. Compile, build, deploy

Assuming a target is already configured with `sasjs add`:

```bash
sasjs cbd -t myTarget
```

`cbd` is compile, build and deploy. Separately:

| Command | Produces |
| --- | --- |
| `sasjs compile` | one compiled program per service, macro, with the macros it uses embedded |
| `sasjs build` | the deployable artefact for the target - a Viya service pack, a SAS 9 deployment script, a JSON file tree for SASjs Server |
| `sasjs deploy` | loads that artefact into the environment |

What lands, under the target's `appLoc`:

- services in `/services/<folder>/<name>`, as jobs in Viya or stored processes in SAS 9 metadata;
- tests in `/tests/...`;
- jobs in `/jobs/...` - jobs are compiled without `%webout()` because they return nothing to a caller.

## 4. Call it

The adapter does the platform-specific work - authentication, the request shape, reading the response back:

```javascript
import { SASjs } from '@sasjs/adapter'

const sasjs = new SASjs({
  serverUrl: 'https://sas.example.com',
  appLoc: '/Public/app',
  serverType: 'SASVIYA' // or 'SAS9', or 'SASJS' for SASjs Server
})

const response = await sasjs.request('common/getdata', {
  areas: [{ area: 'Area 1' }]
})

console.log(response.springs) // array of row objects, columns in uppercase
```

The second argument is the tables to send: each key becomes a WORK table for `%webout(FETCH)`, and each array of objects becomes a CSV the adapter uploads. A table named `springs` comes back as `response.springs`, with column names uppercased.

The same call by hand, once you have a token:

```bash
curl -s -X POST "https://sas.example.com/SASjsApi/stp/execute?_program=/Public/app/common/getdata&_debug=131" \
  -H "Authorization: Bearer $TOKEN" \
  --data-urlencode "areas=area
Area 1"
```

## 5. Test it

A service with no test is a service that is tested in production. `sasjs test` runs the project's tests against a target - including a SASjs Server target, where no SAS licence is involved - and reports the results per test:

```bash
sasjs test -t myTarget
```

A test is compiled like a service - `%webout()` included - and reports `PASS` or `FAIL` per row, with coverage of services, jobs and macros in the same result table. See [Testing](testing.md) for the test file format and the assertion macros.

## Where to go next

- [Backend SAS](backend-getstarted.md) - the whole SAS side of a project, including targets and deployment.
- [React](react.md) or [Angular](angular.md) - a full application on top of these services.
- [CLI documentation](https://cli.sasjs.io) - every command and option.
- [Macro Core](https://core.sasjs.io) - the macros available inside a service.
