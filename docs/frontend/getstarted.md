Frontend Web
====================

## Hosting
To launch a web site, you need access to a server!  Your options are:

1 - localhost (launch on your own PC)

2 - SAS Server

3 - third party server

### Working Locally

Working locally (`localhost`) means that you will be starting up a server on your own machine, and using that to connect to SAS.  This is convenient, but will require bypassing some security settings by enabling [cors](/cors) in your browser.

The `sasjsConfig` will also need to be updated with the `serverUrl` so that SASjs knows where the SAS server is located.

### SAS Server

See [deployment](/frontend/deployment).

Another option is webdav: http://www.re.be/webdav_sync/index.xhtml


### Third Party Server

To work on a third party server, if on a different domain, it will normally need to be whitelisted from SAS.

<meta name="description" content="To launch a web site, you need access to a server! With SAS there are a number of approaches you can take.">