# Services

All of the quickstart apps use two backend services, both of which query the `sashelp.springs` dataset.  The first is used to fetch a list of areas (to populate the dropdown) and the other will fetch a list of springs for a chosen area (to populate the grid).

The process for registering these services will depend on whether you are building on [SAS9](#SAS9) or [Viya](#Viya).

## SAS9

Open SAS Studio and run the code below.  Note - this assumes the existence of a root folder named `Public`, that your SAS account has WM and WMM privileges against.  If you wish to deploy to a different location, simply update the `appLoc` macro variable.  One option (if just for personal use) is to put the services in your home directory, eg `%let appLoc=/User Folders/&sysuserid/My Folder;`.

```
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
  proc sql;
  create table springs as select * from sashelp.springs
    where area in (select area from areas);
  %webout(OPEN)
  %webout(OBJ,springs)
  %webout(CLOSE)
;;;;
%mm_createwebservice(path=&appLoc/common, name=getData, code=ft15f001 ,replace=YES)

```