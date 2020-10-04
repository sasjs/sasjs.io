---
layout: article
title: Running SAS code from the commandline
description: SASjs CLI lets you run arbitrary SAS code in a Viya Compute Session, directly from the terminal (or commandline session).
og_image: https://sasjs.io/img/sasjs-cli-run.png?_=1
---

sasjs run
====================

The `sasjs run` command enables developers to submit SAS code for execution from the commandline.

<script id="asciicast-FK3Xr2RhqAjhIcqLLLKD7xCvM" src="https://asciinema.org/a/FK3Xr2RhqAjhIcqLLLKD7xCvM.js" async></script>

## Prerequisites
Before using this command, you will need to [install](/sasjs-cli/#installation) the SASJS CLI and add a deployment [target](/sasjs-cli-add).

## Syntax

```
sasjs run <sourcecode> [additional arguments]
```

Additional arguments may include:

* `--target` (alias `-t`) - the target environment in which to deploy the services.  If not specified, the first target will be used instead.


## sasjs run

This will create a session and execute some SAS code.  The log will be returned as a file in the current directory.  The source file must have a ".sas" extension.

### Syntax

> `sasjs run somecode.sas -t target`

### Usage

```
# create minimal SAS program
cat > ./somecode.sas <<'EOL'
  %put hello from SASjs;
EOL

# run the SAS code on the target
sasjs run somecode.sas -t myTarget
```


## Roadmap

We plan to support the following:

 * keeping sessions alive
 * directing log output
 * extracting items from the session

 If there are items you are looking for, or have problems / ideas, do raise an [issue](https://github.com/sasjs/cli/issues).