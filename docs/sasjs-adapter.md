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

`appLoc` - this is the folder under which the SAS services will be created.
`serverType` - either `SAS9` or `SASVIYA`
`debug` - if `true` then SAS Logs and extra debug information is returned.


<meta name="description" content="SASjs Adapter tips and user documentation for building SAS Applications on SAS 9 and Viya ">