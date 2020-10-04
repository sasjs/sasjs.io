SASJS-CLI
====================

The CLI tool fulfills 3 main purposes:

* Creation of a project repository in an 'opinionated' way
* Compilation each service, including all the dependent macros / macro variables and pre / post code
* Build - creation of the master SAS deployment, including build macros, macro variables, and pre/post code
* Deployment - execute an array of local scripts and remote SAS programs to create your app on the SAS Server

There is also a feature to let you deploy your frontend as a service, bypassing the need to access the SAS Web Server.

Installation
---------------------

The runtime environment for the CLI is Node.  We recommend using [NVM](https://github.com/nvm-sh/nvm) instead of [Node](https://nodejs.org/en/) directly, as this does not require root permissions.

```Bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
source ~/.bashrc
nvm install node
```

The CLI can now be installed using Node Package Manager (npm) as follows:

```Bash
npm i -g @sasjs/cli
```

### Upgrades

Due to a bug in NPM, the following approaches for upgrades are not reliable:

* `npm i -g @sasjs/cli@latest` (`sasjs v` will show latest version, but code isn't actually updated)
* `npm update @sasjs/cli` (works but the first time you use the `sasjs` command there will be an error)

These issues are resolved in NPM 7 (`npm i -g npm@next-7`).  If you prefer to use the current GA version, the workaround is to explicitly delete the SASjs files before installing, eg:

```Bash
cd /Users/allan/.nvm/versions/node/v13.9.0/lib/node_modules
rm -rf sasjs-cli
npm i -g @sasjs/cli
```


Project Creation
---------------------
To create a new project, run:  `sasjs create mynewproject`

To install in an existing project, change into that directory and run: `sasjs create` (without arguments).  This will create a `sas` folder inside the directory.

Compilation
---------------------
From the root of the project, run:  `sasjs compile`.  This will take all of the macros in the `services` folder and create equivalents in the `sasbuild` folder.  Each service will contain all of the dependent macros as listed under `dependencies` in the header, as well as the `serviceinit.sas` and `serviceterm.sas` files.
![sasjscliflow.png](/img/sasjscompile.png)

If `streamWeb` is `true` then the `index.html` file in your `webSourcePath` is scanned and any linked JS / CSS files are also compiled into the `streamWebFolder` folder.  The `index.html` becomes a `clickme` service in your `appLoc` SAS folder root.

### Base64 encoding
If you don't have an `index.html` and you just want to compile arbitrary binary content (such as images, mp3, excel files etc) as base64 services, set the location of the content in `assetPaths`.  All files in the specified folder(s) will be turned into web services.

Build
---------------------
From the root of the project, run: `sasjs build`.  This will create a deployment script that can be executed in SAS to create the backend services.  The `appLoc` is configured in the `/sas/config.json` file, along with the `serverType` (SAS9 or SASVIYA).  A `buildinit.sas` program can be configured to run, along with specific macro variables (`tgtBuildVars`), according to the settings in `sasjsconfig.json`.

If you have sensitive build variables (such as an `access_token`) you can set these in a `.env` file in your project root.

If the services folder does not exist in the `sasjsbuild` folder, then the `sasjs compile` step is also executed.  The alias to run both compile and build steps is `sasjs cb`.
![sasjscliflow.png](/img/sasjsbuild.png)

### Viya Build Script
The Viya build script requires a number of variables to be prepared by an administrator.  Execute the following:

```sas
filename mc url "https://raw.githubusercontent.com/sasjs/core/main/all.sas";
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

```sas
%let client=MyClient;
%let secret=MySecret;
/* these values are long - split over multiple lines with %trim()*/
%let ACCESS_TOKEN=MyGeneratedAccessToken;
%let REFRESH_TOKEN=MyGeneratedRefreshToken;
```

The above can then be securely placed in a read-protected directory (such as a home directory on the SAS server) and `%inc`'d.

!!! Warning
    Saving security tokens in project repositories, especially if they are committed to source control, is a security risk - as anyone with access can use them to make modifications on the Viya platform.  Be sure to use a secure mechanism such as the `%inc` approach described above, or another approved mechanism for securing these kinds of variables.


Deploy
---------------------
The build program generated in the previous step can be deployed in 3 ways:

1 - MANUAL: copy paste the code into SAS Studio or Enterprise Guide and run it

2 - SSH: build a shell script or bat file to load, and execute with a web service

3 - API: Use the SAS APIs

Points 2 and 3 can be configured / executed with a single `sasjs deploy` or `sasjs d` command.  You can compile, build AND deploy using `sasjs cbd [target]`.  If you don't specify a target (eg sas9 or viya) then the first target in the `sasjsconfig.json` file is used.

### CopyPaste approach
The build script (named as per `buildOutputFileName`) can be copy pasted into SAS Studio and executed to create the backend services.  Please note:

* You will be running under your own identity.  If you need files created under the Web Server identity, deploy your build script using a web service.
* For Viya, you must use SASStudioV (or ensure the client/secret/access_token are provided)

### SSH approach
You can SSH (rsync or scp) your build script onto the SAS Server then `%inc` it from a web service - the web service could be created using the code below:

```sas
filename mc url "https://raw.githubusercontent.com/sasjs/core/main/all.sas";
%inc mc;
filename ft15f001 temp;
parmcards4;
  %inc "/path/to/your/sasjsdeploy.sas"/source2;
;;;;
%mp_createwebservice(name=Executor, code=ft15f001 ,replace=YES)
```
This creates the service in your HOME directory (SAS 9 or Viya).

You can now create a local script (eg `mysas9deploy.sh`) and add it to the `tgtDeployScripts` array (the root is always the `sasjs` folder).

```Bash
echo "sasjs: uploading frontend"
rsync -avz /home/me/myapp/dist/* me@sasserver:/var/www/html/myapp

echo "sasjs: uploading deploy program"
scp sasjsbuild/mysas9deploy.sas me@sasserver:/tmp/mysas9deploy.sas

echo "sasjs: running Executor"
curl -v -L -k  -b cookiefile -c cookiefile "$URL&$CREDS"
```

### API Approach

Any files in your `tgtDeployScripts` array that have a ".sas" extension will be sent to the relevant API (9 or Viya) for execution.

#### Viya API deployment
The Viya deploy requires 3 things:

* access_token
* serverUrl
* contextName

In order of priority, the `access_token` is taken from the following locations:

* `tgtDeployVars`
* `tgtBuildVars`
* the `.env` file.  This is the preferred / recommended location!

The `serverUrl` is the location of your Viya server.  The `contextName` is the execution service on which your SAS code will execute.  You can get a list of available contexts by running a `GET` to the following endpoint:  `/compute/contexts`

#### SAS 9
For SAS 9 deployment we integrate with SAS9API by Analytium ([https://sas9api.io](https://sas9api.io)), you can contact them for a free trial copy.

Configuration as follows:

```JSON
  "tgtDeployVars": {
      "serverName": "SASApp",
      "repositoryName": "Foundation"
  },
  "serverUrl": "https://SASSERVER:PORT",
```

Demo
---------------------

A 2 minute video demonstrating how an app can be built and a deployment script created is shown below.

<iframe width="560" height="315" src="https://www.youtube.com/embed/hUpBqExNec4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


<meta name="description" content="SASjs CLI tips and documentation for building SAS Applications on SAS 9 and Viya ">