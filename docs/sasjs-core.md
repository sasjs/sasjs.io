MacroCore Library
====================

The MacroCore library provides routines and helpers for use in SAS side application logic and deployments.  It is divided into 5 sections:

* **BASE** - Macro functions (`mf_*`) and macro procedures (`mp_*`) that can be used in all flavours of SAS.  No XCMD is assumed.

* **META** - Macros (`mm_*`) that interface with SAS 9 metadata.  No XCMD assumed.

* **METAX** - Metadata macros that depend on XCMD, eg those interfacing with the Batch tools.

* **VIYA** - Macros that interface with SAS Viya.  No XCMD assumed.

Check out the [source code](https://github.com/sasjs/core) and [documentation](https://core.sasjs.io).

## Installation

The easest way to make these macros available is to just include them in your session as follows:

```sas
filename mc url "https://raw.githubusercontent.com/sasjs/core/main/all.sas";
%inc mc;
```

If you don't have internet access from your SAS session, you can download the macros directly from [here](https://raw.githubusercontent.com/sasjs/core/main/all.sas) and place them in your autoexec, or initialisation file.

A further option might be to `git clone` the repository, and set up sasautos, eg:

```sas
options insert=(sasautos="/your/path/macrocore/base"));
options insert=(sasautos="/your/path/macrocore/meta"));
```

The finaly deployment option, if you are building web apps, is Node Package Manager - simply run `npm install macrocore` in your project repository.  Using [sasjs-cli](/sasjs-cli) you can compile these macros into your web services at build time, and lock them to a particular release.

## Useful Features

### Generating Viya Client & Secret in SAS Studio

The CORE library can be used by an administrator to register a Viya Client & Secret.  Execute the following:

```sas
filename mc url "https://raw.githubusercontent.com/sasjs/core/main/all.sas";
%inc mc;

/* create random client and secret */
%mv_registerclient(outds=clientinfo)
```

This will generate a URL in the log, which must be followed to generate a refresh code (one time step).  Paste that code into the macro below:

```
/* paste the code below */
%mv_tokenauth(inds=clientinfo,code=xET8ETs74z)
```
There is now a table in the WORK library containing the access token.  The `clientinfo` table contains the client & secret.

A convenient (but insecure) way to extract these details to the log:

```
/* extract client, secret & token to the log */
data _null_;
  merge mv_tokenauth clientinfo(drop=error);
  put access_token=;
  put refresh_token=;
  put client_id=;
  put client_secret=;
run;

```

!!! Warning
    Security tokens are like passwords.  The above is provided for convenience, but you should avoid writing tokens to log files unless you are very sure of your environment.



### Calling SAS Viya from SAS 9

When calling SAS Viya from SAS 9, the `oauth_bearer=sas_services` option is not available.  However it is still possible to call the APIs using `proc http` in the [core](https://core.sasjs.io) library by putting the ACCESS_TOKEN in a macro variable and referring to that variable in the `access_token_var=` keyword parameter of each viya macro (starting `mv_`).


!!! Warning
    Saving security tokens in project repositories, especially if they are committed to source control, is a security risk - as anyone with access can use them to make modifications on the Viya platform.  Be sure to use a secure mechanism such as the `%inc` from a secure directory, or another approved mechanism for securing these kinds of variables.  Avoid writing Access Tokens to log files.



<meta name="description" content="The Macro Core library empowers SAS Application Developers with a range of macro functions, procedures, macros for metadata and macros for Viya">