# Considerations

## SAS 9 vs SAS Viya

When building on SAS you will be interfacing with either SAS 9 or SAS Viya.  The process for building the app will be the same with either instance, however the functionality / performance / security situation will differ as follows:

|SAS 9|SAS VIYA|
|---|---|
|Stored Processes|Job Execution Service|
|WKS / STP Servers|Compute Server only|
|Client / System Identities|Client Identity only|
|Metadata Server|Postgres Database|

Both server types stream content to the automatic _webout fileref and can make use of the _debug parameter.

## Project Folder Structure

It's a good idea to keep all your source code in one repository, then you can build it all together for testing.  The following folder structure is supported by `sasjs`:

```
    MyAmazingApp/
    |-- /src /* web stuff */
    |-- /sas /* all SAS stuff */
      |-- /db
      | |-- /LIBREF1
      |   |__table1.ddl /* SQL only, without proc sql wrapper */
      |   |__table1.sas /* datalines */
      |-- /init
      |  |__ serviceinit.sas /* included in every service */
      |-- /macros
      | |__ macro1.sas
      | |__ macro2.sas
      |-- /services /* services go in subfolders for organisation & security */
        |-- /Admin
        | |__ addUser
        | |__ remUser
        |-- /Approvers
        |  |__ approveStuff
        |-- /Common
          |__ appInit
          |__ getChartData
```

## Code Injection

Code injection can happen when an attacker sends SAS code within a macro variable, which is then resolved.  In Viya, all URL params are automatically quoted - however care is still needed when using them.

To minimise the risk it is best to avoid url params entirely and deal purely with datasets served by a reliable HTML5<->SAS adapter.

## Data Storage

SAS Datasets (.sas7bdat files) are suitable when your data is READONLY, or being used for for single user storage (eg in WORK or SASUSER directories).  Unless you have a SPDE server, or your datasets are created in batch and READONLY, they should not be used as the 'data layer' for your app.  If your app needs to write data, it is best to use a database that supports real-time concurrent access.
