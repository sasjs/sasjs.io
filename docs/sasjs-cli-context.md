---
layout: article
title: Managing SAS Viya Compute Contexts with SASjs
description: Documentation on how to use the SASjs CLI to create, edit, delete, export and list SAS Viya Compute Contexts
og_image: https://sasjs.io/img/sasjs-cli-context.png
---

sasjs context
====================

The `sasjs context` command allows users to list all and export individual Compute Contexts.  Administrators may also create, edit and delete contexts.

A compute context is used when firing up a new SAS session (it itself inherits from a Launcher Context).  Example use cases for this tool:

* Creating a new compute context as part of a CI/CD deploy
* Deleting a compute context as part of a tidy up
* Discovering which compute contexts can actually be used
* Modifying a compute context, eg to update the autoexec or system account used

<script id="asciicast-FsXbbv87BFPpzVWkVpysftBnI" src="https://asciinema.org/a/FsXbbv87BFPpzVWkVpysftBnI.js" async></script>

## Prerequisites
Before using this command, you will need to install the SASJS CLI and [add a deployment target](/sasjs-cli-add).

## Syntax

```
sasjs context <action> [additional arguments]
```

Additional arguments include:

* `--source` (alias `-s`) - the source JSON file to create or edit a compute context.  Used in the create and edit actions.
* `--target` (alias `-t`) - the target environment in which to create the compute context.  If not specified, the first target will be used instead.


## Compute Context Structure

The create and edit actions use the same JSON structure for adding / modifying contexts.  This also matches the context made by the [export](/sasjs-cli-context#sasjs-context-export) action, which can be used to provide a template for adding / modifying new contexts.  The JSON is defined as follows:

```
{
  "name": "myNewComputeContext",
  "attributes": {
    "reuseServerProcesses": true,
    "runServerAs": "mycasaccount"
  },
  "environment": {
    "autoExecLines": [
      "%put autoexec line 1;",
      "%put autoexect line 2;"
    ],
    "options": []
  },
  "launchContext": {
    "contextName": "SAS Job Execution launcher context"
  },
  "launchType": "service",
}
```
To explain the sections:

* `name` - name of the compute context you will create
* `reuseServerProcesses` - since Viya 3.5 you can re-use sessions, this improves performance significantly but requires the sessions to run under a system account (defined below)
* `runServerAs` - the system account to use when re-using server processes
* `autoExecLines` - an array of SAS program lines.  These will execute ONCE when the server process is started, so expensive libname assignments could be placed here, speeding up web service response times.
* `options` - an array of SAS option settings
* `contextName` - the name of the _launcher_ context used to spawn the compute context
* `launchtype` - a mandatory parameter, more details [here](https://support.sas.com/content/dam/SAS/support/en/sas-global-forum-proceedings/2018/2083-2018.pdf)


## sasjs context create

Used to create a new compute context.

### Syntax

> `sasjs context create -s source.json -t target`

### Usage

```
# create minimal context config
cat > ./myContext.json <<'EOL'
{
  "name": "myNewComputeContext",
  "launchContext": {
    "contextName": "SAS Job Execution launcher context"
  },
  "launchType": "service",
}
EOL

# create the context using the target defined in sasjs add
sasjs context create -s ./myContext.json -t myTarget
```
## sasjs context delete

Used to delete an existing context.  No source JSON needed, contextName is used instead.

### Syntax

> `sasjs context delete <contextName> -t target`

### Usage

```
sasjs context delete myUndesirableComputeContext -t myTarget
```


## sasjs context edit

Used to edit an existing context

### Syntax

> `sasjs context edit <contextName> -s source.json -t target`

### Usage

```
# create JSON file with the changes to apply
cat > ./myContext.json <<'EOL'
{
  "name": "myRenamedComputeContext",
  "launchContext": {
    "contextName": "Some Other launcher context"
  },
  "launchType": "service",
}
EOL

# update the context named myComputeContext
sasjs context edit myComputeContext -s ./myContext.json -t myTarget
```

## sasjs context export

Exports specified compute context to contextName.json in the current folder  No soure JSON needed, contextName is used instead.

### Syntax

> `sasjs context delete <contextName> -t target`

### Usage

```
sasjs context delete myRenamedComputeContext -t myTarget
```


## sasjs context list

Outputs a list of all accessible and inaccessible contexts.  Accessible contexts are discovered by attempting to run `%put &=sysuserid;` on each context.

### Syntax

> `sasjs context list -t target`

### Usage

```
sasjs context list -t myTarget
```