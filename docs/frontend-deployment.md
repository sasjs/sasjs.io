---
layout: article
title: Frontend Deployment
og_title: Options for deploying a web frontend to SAS
description: Deployment is the process of taking the app you have built, and putting it somewhere that others can use it!
og_image: /img/html_css_js.jpeg
---

Deployment is the process of taking the app you have built, and putting it somewhere that others can access it! There are many ways to deploy a SAS web app - we will describe the following:

* SAS Web Server
* Third party Server
* Streaming Apps
* Desktop Apps

Another option, not described here, is to deploy your frontend as content on a [webdav](https://www.re.be/webdav_sync/index.xhtml) server.


## SAS Web Server

For Single Page Web Apps you are highly recommended to upload them to the static content area of the SAS web server.  This avoids the need to configure `serverUrl` and for administrators to whitelist any additional servers.

### SAS9 Deploy

The standard location of the static content area on the SAS9 web server is `!SASCONFIG/LevX/Web/WebServer/htdocs`.

### Viya Deploy

The standard location of the static content area on the Viya web server is `/var/www/html`.

If this isn't right you can take the following advice courtesy of Kurt Bremser in this communities [thread](https://communities.sas.com/t5/Developers/How-do-I-locate-the-static-content-area-of-the-web-server-on/m-p/589385):

```
Check if httpd uses a special config file (display the command line with ps -f).

If not, simply search for httpd.conf. Within that, you find the location of DocumentRoot.
```

## Third Party Server
To work on a third party server, if on a different domain, it will normally need to be whitelisted from SAS.


