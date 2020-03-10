# Frontend Web

## Hosting
To launch a web site, you need access to a server!  Your options are:

1 - localhost (launch on your own PC)

2 - SAS Server

3 - third party server

### Working Locally

Working locally (`localhost`) means that you will be starting up a server on your own machine, and using that to connect to SAS.  The server itself can be started any number of ways, however the main things to consider with this way of working are:

1 - CORS (how to enable it)

2 - SAS Config (we need to let our code know where the SAS server is located)

#### CORS

Cross Origin Resource Sharing is a feature that is disabled by default in most browsers to present cross site scripting attacks.  In our case, as we are working locally, we need to enable it (disable the security policy that prevents it) in order to connect to SAS on a different domain.


| OS    | Browser | Launch Command|
|:---:|:---:|:--:|
| Mac   | Chrome  | `open -n -a Google\ Chrome --args --disable-web-security --user-data-dir=/tmp/chrome` |
| Linux | Chrome  | `google-chrome --disable-web-security --user-data-dir="/tmp/chrome"`|
|Windows|Chrome|`"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --disable-web-security --disable-gpu --user-data-dir=D:\chromeTemp`|

It does not seem to be possible to enable CORS in modern Firefox browsers.

You will know if you are successful if you see a `You are using an unsupported command-line flag: --disable-web-security. Stability and security will suffer.` message.

#### SAS Config


### Hosting on SAS 9

### Hosting on SAS Viya

http://www.re.be/webdav_sync/index.xhtml


## Third Party Server

By setting up a dedicated server and whitelisting it within SAS, you can isolate your frontend activities and enable frontend developers (and easier testing) without touching your SAS Web Server.

Web devs can work locally and push to that server, or work on the server directly.  A great option to enable remote (cloud) development is the open-source server edition of vscode: [https://github.com/cdr/code-server](https://github.com/cdr/code-server).


To whitelist the server in Viya, open `Environment Manager -> Configuration -> View -> Definitions` and select  `sas.commons.web.security`.  Make sure your domain (or `*`) is entered under `allowedHeaders`, `allowedMethods` and `AllowedOrigin`.