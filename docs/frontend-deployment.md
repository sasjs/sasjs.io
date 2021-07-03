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

The standard location of the static content area on the SAS9 web server is `!SASCONFIG/LevX/Web/WebServer/htdocs`.  For larger customers, your web server may be on a different server to the application server.

To find the server name, you can run the following code:

```sas
data _null_;
  length url $128;
  rc=METADATA_GETURI("Stored Process Web App",url);
  putlog 'Your SAS 9 url is: ' url;
run;
```

### Viya Deploy

The standard location of the static content area on the Viya web server is `/var/www/html`.

If this isn't right you can take the following advice courtesy of Kurt Bremser in this communities [thread](https://communities.sas.com/t5/Developers/How-do-I-locate-the-static-content-area-of-the-web-server-on/m-p/589385):

```
Check if httpd uses a special config file (display the command line with ps -f).

If not, simply search for httpd.conf. Within that, you find the location of DocumentRoot.
```

## Third Party Server
 With this approach you have a lot of possibilities, as you can use any technology you like for the backend, including a database, and just use SAS when analytics are needed.

This approach typically requires administrator support, as your domain will need to be whitelisted from SAS.

## Streaming Apps

This approach is particularly interesting for regular SAS developers who are NOT administrators, or SAS App Developers who would like to package apps for use / easy installation by other teams or SAS customers.

The idea here is that the frontend is actually saved in the SAS logical folder tree - ie metadata in SAS 9 or SAS Drive in Viya.

The great thing about this is that there is no need for whitelisting, there is no web server to consider, no need for a client/secret, and it's available to anyone with a SAS Login.  You can also secure the frontend by setting SAS folder permissions, which is not so easy to achieve with other methods.

The downsides are:

* Performance.  The app will be much less responsive (ie, slower) than if you deploy to the web server.  This is due to the cost of the first request, however the second / subsequent requests are typically cached by the browser so are much faster.
* Efficiency.  Linked to the above, but storage and throughput wise it's not an efficient way to deploy a web app
* Limited functionality.  The vast majority of apps will work fine, but there are some edge cases that are not yet handled.

### Streaming App Configuration

Another great thing about streaming apps is that they require _no changes_ to your frontend!  It's simply some additional config in the compilation process, specifically the [streamConfig](https://cli.sasjs.io/sasjsconfig.html#streamConfig) attribute.

This can go either at root or target level in your [sasjsconfig.json](https://cli.sasjs.io/sasjsconfig.html) file.  The relevant attributes are:

* `streamWeb` - set to `true` to create the streaming app as part of the `sasjs compile` process.
* `webSourcePath` - the _local_ folder containing the _built_ version of the app.  If you are writing vanilla js, it's just the folder containing your `index.html`.  For React/Angular, it could be your `dist` or `build` folder.
* `streamServiceName` - the name of the service containing the `index.html`.  This is a SAS service named `clickme` by default.
* `streamWebFolder` - the name of the SAS logical folder under which all the web content will be stored.

### Streaming App Compilation

When running `sasjs web` (also executed as part of `sasjs compile`), the SASjs CLI will open up the `index.html` in the `webSourcePath` folder and migrate a copy of every dependency (JS, CSS, images, sounds, etc) into the `sasjsbuild/services/$(streamWebFolder)` folder.

For SAS 9, all content will be converted into Stored Processes.  This is achieved by base64 encoding the content and streaming it back with the appropriate content-type.

For Viya, content is deployed as actual files in SAS Drive.  This is a lot more space efficient.  In addition, to avoid the issue with Viya-streamed files whereby a redirect occurs to a temporary UUID from the files service, we call the index.html with an extra parameter - `_debug=2`.  This wraps the response in an iframe, and by embedding some extra attributes, we surface the child contents so it looks like the main page, however a user-friendly URL is retained.

To clarify - all you need to do to achieve the above is run `sasjs compile`.

### Streaming App Build

The build process takes all the compiled content in the `sasjsbuild` folder and turns it into a build pack.  The build pack comes in two forms:

* JSON file (used exclusively when autodeploying to SAS Viya using the REST APIs)
* SAS file (can be used by both SAS 9 or Viya to deploy all content programmatically)

The build pack is created by running `sasjs build`.  The name of the pack is determined by the [buildOutputFileName](https://cli.sasjs.io/sasjsconfig.html#buildConfig_buildOutputFileName) attribute, and takes the target name by default.

### Streaming App Deployment

One way to deploy a streamed app is to simply run the generated SAS file.  If you can host this somewhere, you can deploy a SAS App to any customer with just two lines of code - here's an [example](https://sasjs.io/apps/#viya-file-uploader).  Using this approach, the link to the final app will be shown in the SAS log.

For automated (CI/CD) development, you will probably want to do this using the command line.  For that you will need to ensure the [deployServicePack](https://cli.sasjs.io/sasjsconfig.html#deployConfig_deployServicePack) attribute is `true`.  With this, you can autodeploy by simply running `sasjs deploy`.  The link to the final app will be shown in the console.

Note - you will first need to have authenticated to your SAS server using [sasjs auth](https://cli.sasjs.io/auth).


## Desktop Apps

Another option for building apps is to actually host them on the desktop.  Using technologies such as Electron, or React Native, you can build apps that are saved on the users desktop or mobile device.

This will again require server whitelisting, the use of a CLIENT/SECRET, or a dedicated (Third party) web server.