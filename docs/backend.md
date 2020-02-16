# Backend SAS

## Considerations

### SAS 9 vs SAS Viya

When building on SAS you will be interfacing with either SAS 9 or SAS Viya.  The process for building the app will be the same with either instance, however the functionality / performance / security situation will differ as follows:

|SAS 9|SAS VIYA|
|---|---|
|Stored Processes|Job Execution Service|
|WKS / STP Servers|Compute Server only|
|Client / System Identities|Client Identity only|
|Metadata Server|Postgres Database|

### Folder Structure
In order to easily configure the security (authorisation) of your app, it is recommended to put each app into a seperate folder.  Further subfolders should be used to group services by functionality - meaning that you could secure, say, the admin / configuration services whist keeping the public / common services visible.

```
    MyAmazingApp/
    |-- Admin
    | |__ addUser
    | |__ remUser
    |-- Common
    |  |__ appInit
    |  |__ getChartData
    |-- Approvers
       |__ approveStuff
```

### Code Injection


Code injection can happen when an attacker sends SAS code within a macro variable, which is then resolved.  In Viya, all URL params are automatically quoted - however care is still needed when using them.

To minimise the risk it is best to avoid url params entirely and deal purely with datasets served by a reliable HTML5<->SAS adapter.

### Data Storage

SAS Datasets (.sas7bdat files) are suitable when your data is READONLY, or being used for for single user storage (eg in WORK or SASUSER directories).  Unless you have a SPDE server, or your datasets are created in batch and READONLY, they should not be used as the 'data layer' for your app.  If your app needs to write data, it is best to use a database that supports real-time concurrent access.


## SAS Viya

To create services on Viya you are firstly going to need to be an **Administator** (or have access to one) in order to register your consul token.  You also need write access to a location in the files service (eg `/public/somewhere`).

### Open SAS Studio and Compile Macros

Simply run the following
```
filename mc url "https://raw.githubusercontent.com/macropeople/macrocore/master/mc_all.sas";
%inc mc;
```

If you are unable to run the above code, you may not have internet access on your server.  In this case, simply click this [link](https://raw.githubusercontent.com/macropeople/macrocore/master/mc_all.sas) and copy paste the content into your SAS session, and run it.

### Get App Token (Admin Task)
The following step can only be executed by a SAS Admin.  Here is where you set the client and secret and an access token is returned::

```
    %let client=MyClient;
    %let secret=MySecret;
    %mv_getapptoken(client_id=&client,client_secret=&secret)
```

After running the above, take a look in the log - it will contain a link which you can follow to get the access code.  Be sure to select 'openid' from the list of authorisations.

### Get Refresh Token
With the returned code, add it to the first macro below and execute both lines to get the refresh token.

```
    %mv_getrefreshtoken(client_id=&client,client_secret=&secret
      ,code=PUT_THE_ACCESS_CODE_HERE
    )
    %mv_getaccesstoken(client_id=&client,client_secret=&secret)
```

We are now ready to create our first service!

### Create SAS Service
We will create our service using the `%mv_createwebservice()` macro, which expects pointers to SAS code to be provided as one or more filerefs.  This will create the service and provide the necessary precode to retrieve any data that has been sent - and automatically create that data as tables in WORK.

To speed up this demo we are going to use a little known fileref with the alias `ft15f001` - when combined with `parmcards` this allows us to write file content directly in open code, in a similar fashion to `datalines` and table data.

```
  filename ft15f001 temp;
  parmcards4;
    * do some sas. All inputs are ALREADY tables in WORK;
    data example1 example2;
      set sashelp.class;
    run;
    * send data back;
    %webout(ARR,example1) * Array format, fast, good for large tables;
    %webout(OBJ,example2) * Object format, easier to work with in JS;
    %webout(CLOSE)
  ;;;;
  %mv_createwebservice(path=/Public/myapp/common/appInit,name=testJob,code=ft15f001)
```

You should now see a URL in the log with a link to your service.

.. Note::  You can modify your Job Execution service by navigating to `YOURVIYASERVER/SASJobExecution` and finding it in the folder tree.



## SAS 9

Building services on SAS 9 is more straightforward, as there is no app token to consider!  The below approach will work from 9.3 and upwards.

```
    * compile macros ;
    filename mc url "https://raw.githubusercontent.com/macropeople/macrocore/master/mc_all.sas";
    %inc mc;
    * if the above fails, download and compile manually;

    * parmcards lets us write to a text file from open code ;
    filename ft15f001 temp;
    parmcards4;
        * do some sas, any inputs are now already WORK tables;
        data example1 example2;
          set sashelp.class;
        run;
        * send data back;
        %webout(ARR,example1) * Array format, fast, suitable for large tables ;
        %webout(OBJ,example2) * Object format, easier to work with ;
        %webout(CLOSE)
    ;;;;
    %mm_createwebservice(path=/metapath/myapp, name=testJob, code=ft15f001)
```