# SASJS-CLI

The CLI tool fulfills 3 main purposes:

* Creation of a project repository in an 'opinionated' way
* Compilation each service, including all the dependent macros and pre / post code
* Deployment script generation - run this in SAS Studio to create all your backend services in Viya or SAS9.

There is also a feature to let you deploy your frontend as a service, bypassing the need to access the SAS Web Server.

## Installation
The tool must be installed globally in order to function as a command.  Simply run:

```
npm i -g sasjs-cli
```

## Project Creation
To create a new project, run:  `sasjs create mynewproject`

To install in an existing project, change into that directory and run: `sasjs create` (without arguments).  This will create a `sas` folder inside the directory.

## Compilation
From the root of the project, run:  `sasjs build`.  This will take all of the macros in the `services` folder and create equivalents in the `sasbuild` folder.  Each service will contain all of the dependent macros as listed under `dependencies` in the header, as well as the `serviceinit.sas` and `serviceterm.sas` files.
![sasjscliflow.png](/img/sasjscliflow.png)

## Deployment script generation
`sasjs build` also creates a deployment script that can be executed in SAS Studio to create the backend services.  The `appLoc` is configured in the `/sas/config.json` file, along with the `serverType` (SAS9 or SASVIYA).

### Viya Deployment Script
The Viya deployment script requires a number of variables to be prepared by an administrator.  Execute the following:

```
filename mc url "https://raw.githubusercontent.com/macropeople/macrocore/master/mc_all.sas";
%inc mc;
%let client=MyClient;
%let secret=MySecret;
%mv_getapptoken(client_id=&client,client_secret=&secret)
```
This will generate a URL in the log, which must be followed to generate a refresh code (one time step):

```
%mv_getrefreshtoken(client_id=&client,client_secret=&secret,code=wKDZYTEPK6)
```

The ACCESS_TOKEN and REFRESH_TOKEN are now in the log.  In future, when running `sasjs build` for a Viya target, the following values must be provided:

```
%let client=MyClient;
%let secret=MySecret;
/* these values are long - split over multiple lines with %trim()*/
%let ACCESS_TOKEN=MyGeneratedAccessToken; 
%let REFRESH_TOKEN=MyGeneratedRefreshToken; 
```

The above can then be securely placed in a read-protected directory (such as a home directory on the SAS server) and `%inc`'d.

!!! Warning
    Saving security tokens in project repositories, especially if they are committed to source control, is a security risk - as anyone with access can use them to make modifications on the Viya platform.  Be sure to use a secure mechanism such as the `%inc` approach described above, or another approved mechanism for securing these kinds of variables.



# Demo
A 2 minute video demonstrating how an app can be built and a deployment script created is shown below.

<iframe width="560" height="315" src="https://www.youtube.com/embed/hUpBqExNec4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
