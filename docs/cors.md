---
layout: article
title: CORS
og_title: Cross Origin Resource Sharing 
description: CORS / Same Origin Policy is a security setting enabled in all modern browsers to present cross site scripting attacks.
---
Cross Origin Resource Sharing (CORS) - also referred to as the Same Origin Policy - is a security setting enabled in all modern browsers that prevents a javascript loaded from Server A interfacing with Server B.  This exists to prevent a script from, say, www.somedodgysite.com, interfering with a www.myimportantbank.com session.

You'll know you are affected if you see a message such as the following in your browser console:

```
XMLHttpRequest cannot load http://SASMIDTIER:8080/SASStoredProcess/do.
No 'Access-Control-Allow-Origin' header is present on the requested resource.
Origin 'http://localhost:54048' is therefore not allowed access.
```

As this is a browser setting, for development purposes the issue can be side-stepped by launching your browser with the setting disabled.  Sample commands for this are listed below:


| OS    | Browser | Launch Command|
|:---:|:---:|:--:|
| Mac   | Chrome  | `open -n -a Google\ Chrome --args --disable-web-security --user-data-dir=/tmp/chrome` |
| Mac   | Brave   | `open -n -a /Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser -n --args --incognito --disable-web-security  --user-data-dir="/tmp/brave"` |
| Linux | Chrome  | `google-chrome --disable-web-security --user-data-dir="/tmp/chrome"`|
|Windows|Chrome|`"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --disable-web-security --disable-gpu --user-data-dir=C:\Temp`|

It does not seem to be possible to enable CORS in modern Firefox browsers.

You will know if you are successful if you see a `You are using an unsupported command-line flag: --disable-web-security. Stability and security will suffer.` message.

Note - even with CORS enabled you still may be unable to connect to SAS (9 or Viya) if whitelisting is enabled. Also, if you are pushing your web app to a server outside of SAS, you will still have the CORS issue. 

To resolve this you will need to ask your administrator, and perhaps offer them the guidance below.

## SAS 9 EBI

To fix the issue on SAS EBI, open SAS Management Console and navigate through Application Management -> Configuration Manager -> SAS Application Infrastructure.

Right click / properties and add your target url to the following property: `sas.web.csrf.referers.knownHosts`

Some points to note about this list of urls:

* They are comma separated
* The domain should include the trailing slash/ 
* The domain can include a partial path for further security, eg https://mydomain.com/usethispart/
* After modifying the property, the SAS Web Application Server must be restarted.

For more information, see the [SAS Middle Tier Admin Guide](https://documentation.sas.com/doc/en/bicdc/9.4/bimtag/p1xtsni38p58t3n1ljd2fy4c3joz.htm).

## SAS Viya

A comprehensive article on CORS and CSRF management on SAS Viya is available [here](https://communities.sas.com/t5/SAS-Communities-Library/All-about-CORS-and-CSRF-for-developing-web-applications-with-the/ta-p/791124).

