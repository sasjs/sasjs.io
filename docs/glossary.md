Glossary
====================


If you'd like to see a new item added, feel free to raise an [issue](https://github.com/sasjs/sasjs.io/issues/new) or [PR](https://github.com/sasjs/sasjs.io/pulls)!

## appLoc

_Relevant to: Adapter, CLI, VSCE_

The "appLoc" represents the "app location" in terms of where the backend web services are stored in the logical folder tree (eg SAS Drive on Viya, or metadata in SAS 9).

It does **not** represent a physical path, such as a linux directory or windows folder.  It's more analagous to WebDav (collection of parent/child relationships).

The appLoc will be deployed with the following structure (folders will only be created if relevant artefacts are compiled):

* $(appLoc)/services/(subfolder)
* $(appLoc)/jobs/(subfolder)
* $(appLoc)/tests/macros
* $(appLoc/tests/jobs
* $(appLoc/tests/services

### Adapter Specific guidance
By defining the appLoc in the SASjs config, the `sasjs.request()` method can use a relative path (without leading slash), meaning that the app can be easily moved (or deployed elsewhere).

If the `request()` method is used _with_ a leading slash, the `appLoc` is ignored.  If `request()` is used _without_ a leading slash, the `appLoc` **must** be provided in the sasjs config object.

### Includes

_Relevant to: CLI, VSCE_

SAS Includes (coming from the `programFolders` array) can be inserted into any Primary Artefact (Job or Service or Test).  They are essentially 'arbitrary code blocks'.  More information available [here](https://cli.sasjs.io/artefacts/#sas-includes)

### Macros

_Relevant to: CLI, VSCE_

SAS Macros should be in a file with the same name as the macro itself.  Each macro file should contain just one macro.  Macros can be compiled into multiple artefacts.  More information [here](https://cli.sasjs.io/artefacts/#sas-macros).

### Programs

See [includes](https://sasjs.io/glossary/#includes).

## Job

_Relevant to: CLI, VSCE_

A "Job" in SASjs relates to a batch program, which has one or more Data Inputs and (ideally) one Data Output.  It is one of the three Primary Artefacts.  Additional programs and macros may be compiled as precode.

Jobs may take a long time to execute.  Lineage can be generated for jobs using the `sasjs doc` command (so long as the correct headers are set).

## Service

_Relevant to: Adapter, CLI, VSCE_

A "Service" in SASjs relates to an 'on demand' process with zero or more Service Inputs and one or more Service Outputs.  Those inputs/outputs can be anything, but are typically JSON. Services should be designed to run as fast as possible, and never longer than 5 minutes (a common timeout threshold)

When services are compiled, additional precode is added to enable the `%webout()` macro.  This macro converts adapter inputs to WORK tables, and allows further WORK tables to be sent back in a specific JSON format.  Depending on the `serverType`, the underlying webout macro is either:

* mm_webout.sas (used for SAS9 EBI)
* ms_webout.sas (used for SASjs Server)
* mv_webout.sas (used for Viya)


## Target

_Relevant to: CLI, VSCE_

A Target in SASjs represents a configuration against which the app will be deployed. Example items for a configuration include:

* serverType (eg SAS9, SASJS, SASVIYA)
* serverUrl (the url of the server)
* appLoc (the logical folder to which the SAS web services will be deployed)


## Test

_Relevant to: CLI_

Tests can be written for Jobs, Services, or Macros.  They are compiled as Services to enable the `webout()` macro for sending the test results.  More information on tests is available [here](https://cli.sasjs.io/test)

<meta name="description" content="A glossary of terminology used in the SASjs development framework">
