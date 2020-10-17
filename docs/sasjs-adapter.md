SASjs Adapter
====================

The SASjs adapter is a JS library and a set of SAS Macros that handle the communication between the frontend app and backend SAS services.

There are three parts to consider:

1. JS request / response
2. SAS inputs / outputs
3. Configuration

## JS Request / Response

To install the library you can simply run `npm install sasjs` or include a `<script>` tag with a reference to our [CDN](https://www.jsdelivr.com/package/npm/sasjs).

Full technical documentation is available [here](https://adapter.sasjs.io).  The main parts are:

### Instantiation
The following code will instantiate an instance of the adapter:

```javascript
let sasJs = new SASjs.default(
  {
    appLoc: "/Your/SAS/Folder",
    serverType:"SAS9"
  }
);
```
More on the config later.

### SAS Logon
The login process can be handled directly, as below, or as a callback function to a SAS request.

```javascript
sasJs.logIn('USERNAME','PASSWORD'
  ).then((response) => {
  if (response.isLoggedIn === true) {
    console.log('do stuff')
  } else {
    console.log('do other stuff')
  }
}
```

###  Request / Response
A simple request can be sent to SAS in the following fashion:

```javascript
sasJs.request("/path/to/my/service", dataObject)
  .then((response) => {
    // all tables are in the response object, eg:
    console.log(response.tablewith2cols1row[0].COL1.value)
  })
```
We supply the path to the SAS service, and a data object.  The data object can be null (for services with no input), or can contain one or more tables in the following format:

```javascript
let dataObject={
	"tablewith2cols1row": [{
		"col1": "val1",
		"col2": 42
	}],
	"tablewith1col2rows": [{
		"col": "row1"
	}, {
		"col": "row2"
	}]
};
```

There are optional parameters such as a config object and a callback login function as described [here](https://adapter.sasjs.io/classes/sasjs.sasjs-1.html#request).

The response object will contain returned tables and columns.  Table names are always lowercase, and column names uppercase.

The adapter will also cache the logs (if debug enabled) and even the work tables.  For performance, it is best to keep debug mode off.

## SAS Inputs / Outputs

The SAS side is handled by a number of macros in the [macro core](https://github.com/sasjs/core) library.

The following snippet shows the process of SAS tables arriving / leaving:
```sas
/* fetch all input tables sent from frontend - they arrive as work tables */
%webout(FETCH)

/* some sas code */
data some sas tables;
  set from js;
run;

%webout(OPEN)  /* open the JSON to be returned */
%webout(OBJ,some) /* `some` table is sent in object format */
%webout(ARR,sas) /* `sas` table is sent in array format, smaller filesize */
%webout(OBJ,tables,fmt=N) /* unformatted (raw) data */
%webout(OBJ,tables,label=newtable) /* rename tables on export */
%webout(CLOSE) /* close the JSON and send some extra useful variables too */

```

## Configuration

Configuration on the client side involves passing an object on startup, which can also be passed with each request.  The main config items are:

* `appLoc` - this is the folder under which the SAS services will be created.
* `serverType` - either `SAS9` or `SASVIYA`
* `debug` - if `true` then SAS Logs and extra debug information is returned.
* `useComputeApi` - if `true` and the serverType is `SASVIYA` then the REST APIs will be called directly (rather than using the JES web service).
* `contextName` - if missing or blank, and `useComputeApi` is `true` and `serverType` is `SASVIYA` then the JES API will be used.


The adapter supports a number of approaches for interfacing with Viya (`serverType` is `SASVIYA`).  For maximum performance, be sure to [configure your compute context](/guide-viya/#shared-account-and-server-re-use) with `reuseServerProcesses` as `true` and a system account in `runServerAs`.  This functionality is available since Viya 3.5.  This configuration is supported when [creating contexts using the CLI](/sasjs-cli-context/#sasjs-context-create).

### Using JES Web App

In this setup, all requests are routed through the JES web app, at `YOURSERVER/SASJobExecution`.  This is the most reliable method, and also the slowest.  One request is made to the JES app, and remaining requests (getting job uri, session spawning, passing parameters, running the program, fetching the log) are made on the SAS server by the JES app.

```
{
  appLoc:"/Your/Path",
  serverType:"SASVIYA"
}
```

### Using the JES API
Here we are running Jobs using the Job Execution Service except this time we are making the requests directly using the REST API instead of through the JES Web App.  This is helpful when we need to call web services outside of a browser (eg with the SASjs CLI or other commandline tools).  To save one network request, the adapter prefetches the JOB URIs and passes them in the `__job` parameter.

```
{
  appLoc:"/Your/Path",
  serverType:"SASVIYA",
  useComputeApi: true
}
```

### Using the Compute API
This approach is by far the fastest, as a result of the optimisations we have built into the adapter.  With this configuration, in the first sasjs request, we take a URI map of the services in the target folder, and create a session manager - which spawns an extra session.  The next time a request is made, the adapter will use the 'hot' session.  Sessions are deleted after every use, which actually makes this _less_ resource intensive than a typical JES web app, in which all sessions are kept alive by default for 15 minutes.

```
{
  appLoc:"/Your/Path",
  serverType:"SASVIYA",
  useComputeApi: true,
  contextName: 'yourComputeContext'
}
```


<meta name="description" content="SASjs Adapter - tips and user documentation for building SAS Applications on SAS 9 and Viya ">