---
layout: article
title: Deploying the SASjs Service Pack from commandline
description: The SASjs Service Pack is a collection of services and folder objects.  The servicepack command lets you deploy them easily.
---

sasjs servicepack
====================

The `sasjs servicepack` command allows administrators to deploy the backend services for a SASjs app using a CI/CD framework of choice.  Currently only the `deploy` action is supported, in future the `export` and `create` options will be made available.  If you are waiting on these, please raise a github [issue](https://github.com/sasjs/cli/issues).



<!--script id="asciicast-FsXbbv87BFPpzVWkVpysftBnI" src="https://asciinema.org/a/FsXbbv87BFPpzVWkVpysftBnI.js" async></script-->

## Prerequisites
Before using this command, you will need to install the SASJS CLI and [add a deployment target](/sasjs-cli-add).

## Syntax

```
sasjs servicepack <action> [additional arguments]
```

Additional arguments may include:

* `--source` (alias `-s`) - the source JSON file containin the services and folders.  Used in the deploy action.
* `--target` (alias `-t`) - the target environment in which to deploy the services.  If not specified, the first target will be used instead.
* `-f` - used to **f**orce a deploy, eg even if the folders / services already exist (they will then be overwritten)

## Service Pack Structure

The service pack structure is designed to provide the bare minimum for defining remote services.  It is normally created as part of the `sasjs build` comand when the target `serverType` is VIYA.  For info, it looks like this:

```
{
 "members": [
  {
   "name": "services",
   "type": "folder",
   "members": [
    {
     "name": "admin",
     "type": "folder",
     "members": [
      {
       "name": "exportconfig",
       "type": "service",
       "code": "%put hello world;"
      }]
    }]
  }]
}
```


## sasjs servicepack deploy

Used to deploy a servicepack to a Target.  Note that the servicepack will be deployed to the `appLoc` defined in that target.

### Syntax

> `sasjs servicepack deploy -s source.json -t target`

### Usage

```
# create minimal service pack
cat > ./servicepack.json <<'EOL'
{
 "members": [
  {
   "name": "services",
   "type": "folder",
   "members": [
    {
     "name": "public",
     "type": "folder",
     "members": [
      {
       "name": "hello",
       "type": "service",
       "code": "data _null_; file _webout; put 'Hello from SASjs';run;"
      }]
    }]
  }]
}
EOL

# deploy the service pack to the appLoc / server defined in the target (sasjs add)
sasjs servicepack deploy -s ./servicepack.json -t myTarget
```
