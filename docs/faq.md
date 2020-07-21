Frequently Asked Questions
====================


Minimum Requirements
---------------------

To build apps on SAS you need SAS Viya, or SAS 9 with Stored Process Server.  

**You cannot create web apps on SAS with University Edition.**

To check if you have SAS Viya, open SAS Studio, click your user profile and click "About".

If you are using Enterprise Guide, then simply run:

```
data _null_;
  length url $128;
  rc=METADATA_GETURI("Stored Process Web App",url);
  putlog 'Your SAS 9 url is: ' url;
run;
```
