---
layout: article
title: Apps
og_title: SAS Apps, seed apps, and other tools built using the SASjs framework
description: A collection of SASjs powered apps and tools that can be deployed on either / both SAS 9 and SAS Viya platforms
og_image: /img/file_upload.png
---

Apps
====================

Below are a collection of Apps and Tools that can be deployed on either / both SAS 9 and SAS Viya platforms.

## Fun and Games

### Sonic the Hedgehog on SAS
A SASjs wrapper for this remake of the sega classic!  Works on SAS 9 only (due to default CSP settings on Viya).

<iframe width="560" height="315"
    src="https://www.youtube.com/embed/2HGbHw459yY"
    frameborder="0"
    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
    allowfullscreen></iframe>

Source: [https://github.com/allanbowe/sonic](https://github.com/allanbowe/sonic)


Deployment:

```sas
filename playme url "https://raw.githubusercontent.com/allanbowe/sonic/master/sonic.sas";
%inc playme;
```

### RockRoller
Dodge trees to see how far you can roll this rock in this infinite game!  Works on both SAS 9 and Viya.

Source: [https://github.com/sasjs/rockroller](https://github.com/sasjs/rockroller)



### SAS Streamed SAS Rap
Run the code below (SAS9 or Viya), and open the link in a browser to hear a SAS streamed [SAS Rap](https://www.youtube.com/watch?v=FtTAoYV9HS8&feature=youtu.be) by [Thiago De Souza](https://www.linkedin.com/in/thiago-de-souza/)

```SAS
filename playme url "https://sasjs.io/rap.sas";
%inc playme;
```

source: [https://github.com/allanbowe/sasrap](https://github.com/allanbowe/sasrap)


## Tools

### Folder Navigator

View & Edit Stored Processes (or Viya Jobs) with this folder navigator

source: [https://github.com/sasjs/folder-navigator](https://github.com/sasjs/folder-navigator)

### Viya Client Token Generator

The following code (Viya only) will create an app for generating a Client ID + Secret with various configuration options.  For this to work, the `sysuserid` must have the admin rights for reading the consul token.


```sas
filename vt url  "https://raw.githubusercontent.com/sasjs/viyatoken/master/runme.sas";
%inc vt;
```

Run the above, then open YOURSERVER/SASJobExecution?_PROGRAM=/Public/app/viyatoken/clickme

Source: [https://github.com/sasjs/viyatoken](https://github.com/sasjs/viyatoken)

<iframe width="560" height="315" src="https://www.youtube.com/embed/L_ZtRSjTs_I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Viya File Uploader

This app will let you choose a local file and upload it to a directory on the Viya server.  It returns a directory listing.

To deploy:

```
filename mc url "https://raw.githubusercontent.com/sasjs/fileuploader/master/runme.sas";
%inc mc;
```

Run the above, then open YOURSERVER/SASJobExecution?_PROGRAM=/Public/app/fileuploader/clickme

source: [https://github.com/sasjs/fileuploader](https://github.com/sasjs/fileuploader)

<iframe width="560" height="315" src="https://www.youtube.com/embed/ERLWmf4vXtk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Viya Log Parser

If you are fetching logs in JSON format, here is a handy tool to convert them to regular log format.  There is an online version [here](https://sasjs.io/log-parser/) or you can build it yourself from the repo below.

![](img/log-parser.png)

Source: [https://github.com/sasjs/viya-log-parser](https://github.com/sasjs/viya-log-parser)

## Seed Apps

The following [template repos](https://github.com/topics/sasjs-seed-app) provide a starting point for building a SAS Web App:

* [https://github.com/sasjs/angular-seed-app](https://github.com/sasjs/angular-seed-app) - Angular
* [https://github.com/sasjs/react-seed-app](https://github.com/sasjs/react-seed-app) - React
* [https://github.com/sasjs/minimal-seed-app](https://github.com/sasjs/minimal-seed-app) - Vanilla JS

There is also a seed app containing Jobs only (no Services) that is useful as a quick start for building SAS Data Engineering and Data Science projects:  [https://github.com/sasjs/template_jobs](https://github.com/sasjs/template_jobs)
