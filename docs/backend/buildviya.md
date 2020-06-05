# SAS Viya Build

## Services

To create services on Viya you are firstly going to need to be an **Administator** in order to access the consul token.  You also need write access to a location in the files service (eg `/public/somewhere`).

### Open SAS Studio and Compile Macros

Simply run the following
```
filename mc url "https://raw.githubusercontent.com/macropeople/macrocore/master/mc_all.sas";
%inc mc;
```

If you are unable to run the above code, you may not have internet access on your server.  In this case, simply click this [link](https://raw.githubusercontent.com/macropeople/macrocore/master/mc_all.sas) and copy paste the content into your SAS session, and run it.

### Register Client (Admin Task)
The following step can only be executed by a SAS Admin.  Here is where you set the client and secret and output to a dataset:

```
    %mv_registerclient(outds=client)
```

After running the above, take a look in the log - it will contain a link which you can follow to get the access code.  Be sure to select 'openid' from the list of authorisations.

### Access & Refresh Tokens
With the returned code, add it to the first macro below and execute both lines to get the refresh token.

```
    %mv_tokenauth(inds=client,code=PUT_THE_ACCESS_CODE_HERE)

    /* if your access token expires, add refresh_token to INDS and resubmit */
    %mv_tokenrefresh(inds=client)
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
    %webout(OPEN)
    %webout(ARR,example1) * Array format, fast, good for large tables;
    %webout(OBJ,example2) * Object format, easier to work with in JS;
    %webout(CLOSE)
  ;;;;
  %mv_createwebservice(path=/Public/myapp/common/appInit,name=testJob,code=ft15f001)
```

You should now see a URL in the log with a link to your service.

!!! tip
    You can modify your Job Execution service by navigating to `YOURVIYASERVER/SASJobExecution` and finding it in the folder tree.
