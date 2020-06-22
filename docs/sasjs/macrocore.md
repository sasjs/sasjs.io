# MacroCore Library

The MacroCore library provides routines and helpers for use in SAS side application logic and deployments.  It is divided into 5 sections:

* **BASE** - Macro functions (`mf_*`) and macro procedures (`mp_*`) that can be used in all flavours of SAS.  No XCMD is assumed.

* **META** - Macros (`mm_*`) that interface with SAS 9 metadata.  No XCMD assumed.

* **METAX** - Metadata macros that depend on XCMD, eg those interfacing with the Batch tools.

* **VIYA** - Macros that interface with SAS Viya.  No XCMD assumed.

Check out the [source code](https://github.com/macropeople/macrocore) and [documentation](https://core.sasjs.io).

## Installation

The easest way to make these macros available is to just include them in your session as follows:

```
filename mc url "https://raw.githubusercontent.com/macropeople/macrocore/master/mc_all.sas";
%inc mc;
```

If you don't have internet access from your SAS session, you can download the macros directly from [here](https://raw.githubusercontent.com/macropeople/macrocore/master/mc_all.sas) and place them in your autoexec, or initialisation file.

A further option might be to `git clone` the repository, and set up sasautos, eg:

```
options insert=(sasautos="/your/path/macrocore/base"));
options insert=(sasautos="/your/path/macrocore/meta"));
```

The finaly deployment option, if you are building web apps, is Node Package Manager - simply run `npm install macrocore` in your project repository.  Using [sasjs-cli](https://sasjs.io/sasjs/sasjs-cli/) you can compile these macros into your web services at build time, and lock them to a particular release.