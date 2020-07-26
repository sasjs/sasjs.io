SAS9
====================

## Where is my Server?
If you're on a new site, you don't always know where your SAS Server is!

There are two options to find out programmatically:

### METADATA_GETURI
Probably the quickest and easiest:

```sas
data _null_;
  length url $128.;
  call missing(url);
  rc = METADATA_GETURI("Stored Process Web App",url);
  put url=;
run;
```

## mm_getwebappsrvprops

This [macro](https://github.com/sasjs/core/blob/main/meta/mm_getwebappsrvprops.sas) gets a bunch of properties relating to web servers, however it's possible that access may be restricted, depending on the metadata permissions at your site.

```sas
%mm_getwebappsrvprops(outds= some_ds)
data _null_;
    set some_ds(where=(name='webappsrv.server.url'));
    put value=;
run;
```

## Load Balancing

The SAS Load Balancer comes with 3 parallel (multibridge) connections by default.  This must be increased!  A good minimum is 5-10 per CPU core.

<meta name="description" content="Tips & Tricks for building HTML5 web apps using Stored Processes on the SAS 9 EBI server">