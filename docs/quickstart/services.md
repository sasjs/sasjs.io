<!-- do not move or rename - is linked from here:
https://www.sas.com/content/dam/SAS/support/en/sas-global-forum-proceedings/2020/4260-2020.pdf
-->
# Services

All of the quickstart apps use two backend services, both of which query the `sashelp.springs` dataset. The first is used to fetch a list of areas (to populate the dropdown) and the other will fetch a list of springs for a chosen area (to populate the grid).

The process for registering these services will depend on whether you are building on [SAS9](#sas9) or [Viya](#viya).

## SAS9

Open SAS Studio and run the code below. Note - this assumes the existence of a root folder named `Public`, that your SAS account has WM and WMM privileges against. If you wish to deploy to a different location, simply update the `appLoc` macro variable. One option (if just for personal use) is to put the services in your home directory, eg `/User Folders/&sysuserid/My Folder`.

```
filename mc url "https://raw.githubusercontent.com/macropeople/macrocore/master/mc_all.sas";
%inc mc;

%let appLoc=/Public/myapp;

filename ft15f001 temp;
parmcards4;
  proc sql;
  create table areas as select distinct area
    from sashelp.springs;
  %webout(OPEN)
  %webout(OBJ,areas)
  %webout(CLOSE)
;;;;
%mm_createwebservice(path=&appLoc/common, name=appInit, code=ft15f001 ,replace=YES)

filename ft15f001 temp;
parmcards4;
  %webout(FETCH) /* fetch areas table sent from frontend */
  proc sql;
  create table springs as select * from sashelp.springs
    where area in (select area from areas);
  %webout(OPEN)
  %webout(OBJ,springs)
  %webout(CLOSE)
;;;;
%mm_createwebservice(path=&appLoc/common, name=getData, code=ft15f001 ,replace=YES)

```

## Viya

Creating the services in Viya can be done entirely in SAS Studio in three easy steps:

```
/* Load macros and obtain app token. Admin Task. */
filename mc url "https://raw.githubusercontent.com/macropeople/macrocore/master/mc_all.sas";
%inc mc;
%let client=new%sysfunc(ranuni(0),hex16.);
%let secret=MySecret;
%mv_getapptoken(client_id=&client,client_secret=&secret)

/* open the URL from the log, click "open id" and paste the Authorization Code into the macro in step 2 below. */
%mv_getrefreshtoken(client_id=&client,client_secret=&secret,code=wKDZYTEPK6)
%mv_getaccesstoken(client_id=&client,client_secret=&secret)

/* now build the services */
filename ft15f001 temp;
parmcards4;
  proc sql;
  create table areas as select distinct area from sashelp.springs;
  %webout(OPEN)
  %webout(OBJ,areas)
  %webout(CLOSE)
;;;;
%mv_createwebservice(path=/Public/app/common, name=appInit, code=ft15f001 ,replace=YES)
parmcards4;
  %webout(FETCH) /* fetch areas table sent from frontend */
  proc sql;
  create table springs as select * from sashelp.springs where area in (select area from areas);
  %webout(OPEN)
  %webout(OBJ,springs)
  %webout(CLOSE)
;;;;
%mv_createwebservice(path=/Public/app/common, name=getData, code=ft15f001 ,replace=YES)

```
