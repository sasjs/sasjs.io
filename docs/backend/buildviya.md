# SAS Viya Build

## Services

There are three main ways to create services in Viya:

1) Manually through the `/SASJobExecution` interface
2) As part of a build process using [sasjs-cli](https://sasjs.io/sasjs/sasjs-cli/)
3) Using code in SAS Studio.  


## SAS Studio
To follow the below, you'll need to compile the MacroCore library into your session.  To do this, simply run the following
```
filename mc url "https://raw.githubusercontent.com/macropeople/macrocore/master/mc_all.sas";
%inc mc;
```

If you are unable to run the above code, you may not have internet access on your server.  In this case, simply click this [link](https://raw.githubusercontent.com/macropeople/macrocore/master/mc_all.sas) and copy paste the content into your SAS session, and run it.


We will create our service using the `%mv_createwebservice()` macro, which expects SAS code to be passed in as filerefs.  This will create the service and provide the necessary precode to retrieve any data that has been sent - and automatically create that data as tables in WORK.

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
