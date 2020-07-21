<!-- do not move or rename - is linked from here:
https://www.sas.com/content/dam/SAS/support/en/sas-global-forum-proceedings/2020/4260-2020.pdf
-->
Services
====================

All of the quickstart apps use two backend services, both of which query the `sashelp.springs` dataset. The first is used to fetch a list of areas (to populate the dropdown) and the other will fetch a list of springs for a chosen area (to populate the grid).

The process for registering these services is almost identical between [SAS9](#sas9) and [Viya](#viya).

Simply open SAS Studio (must be StudioV in Viya) and run the code below.

```
%let appLoc=/Public/app;  /* Configure Metadata or Viya Folder location here */
filename mc url "https://raw.githubusercontent.com/sasjs/core/main/all.sas";
%inc mc; /* compile macros */
filename ft15f001 temp;
parmcards4;
  proc sql;
  create table areas as select distinct area from sashelp.springs;
  %webout(OPEN)
  %webout(OBJ,areas)
  %webout(CLOSE)
;;;;
%mp_createwebservice(path=&appLoc/common,name=appinit)

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
%mp_createwebservice(path=&appLoc/common,name=getdata)

```
