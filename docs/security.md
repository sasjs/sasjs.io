Security
====================

Deploying web apps is generally more secure than, say, Python or R, because the Javascript libraries that are included do not have access to the filesystem. The browser "sandbox" also prevents JS files loaded from a one domain from making calls to another domain (Cross Origin Resource Sharing / [CORS](/cors/)). That said, there are still a few security considerations to keep in mind when building apps on SAS.

Shared Services account
---------------------

A shared system account for running web services is preferred as it can enable functionality for users that they cannot (or should not) perform themselves, eg database modifications (and for that, you should seriously consider [Data Controlller for SAS®](https://datacontroller.io)).  It can also avoids unix permissions issues, as created files are owned by default under the end user identity.

However - as it is a shared account, the ability to run code under this identity should be appropriately governed.  In particular, code injection must be protected against - for this reason, URL parameters are a bad idea, much better to send tables using an adapter such as [SASjs](https://github.com/sasjs/adapter). 

It is also recommended to ensure you have a secure release process, which includes code review and automated testing, to ensure the safety of your production environment.

### SAS 9
By default your services will run on a Stored Process server under the shared credentials stored in the `SAS General Servers group` group (`sassrv` per factory settings). 

It is also possible to run STPs under a Workspace Server context (where end user OS credentials match `&sysuserid`). 

### SAS Viya
By default, services will run on the SAS Compute server under the client identity.  Since Viya 3.5 it is also possible to run under a shared identity, and to pool the session - see [documentation](https://go.documentation.sas.com/?cdcId=calcdc&cdcVersion=3.5&docsetId=calcontexts&docsetTarget=n1hjn8eobk5pyhn1wg3ja0drdl6h.htm&locale=en).


Folder Security
---------------------

The recommended SASjs folder structure is to group services into app subfolders, so that security can be applied at backend. The app itself can also be secured by setting permission on the parent folder. There is one more thing to consider - services can be viewed (and executed) by anyone who has the READ permission, either using the `SERVERURL/SASStoredProcess?_action=1063` url or by navigating in `SASJobExecution` on Viya. Therefore your services should be built in such a way that no damage would be caused if an end user were to accidentally 'click' on one of the services and run it.

This folder structure is enforced when using the [sasjs-cli](https://github.com/sasjs/cli) tool.

Idempotence
---------------------

Services should be built in such a way that they can be safely executed more than once. This is because it's possible that it WILL be run more than once (eg if the user clicks a button twice in succession).

URL Parameters
---------------------
The use of URL parameters (which are automatically converted to macro variables in a SAS session) should be avoided.  Apart from the risk of code injection, there are also a number of reserved variables that may cause unintentional naming conflicts.

Note that Viya automatically escapes certain characters (eg `;`) to reduce this risk.

SubResource Integrity
---------------------

An integrity hash is a checksum of a file - if just one character inside a file is changed, the checksum is totally different. This makes it a great tool for verifying that a CSS or JS file has not been modified since the checksum was generated. Content served over http (without SSL certificates) are extremely susceptible to Man in the Middle (MitM) [attacks](https://hackernoon.com/a-hacker-intercepted-your-wifi-traffic-stole-your-contacts-passwords-financial-data-heres-how-4fc0df9ff152). For this reason, it is best practice to either bundle all your dependencies inside your app, or apply SubResource Integrity (SRI) checking as per the [w3.org spec](https://www.w3.org/TR/SRI). The syntax looks like this:

```JavaScript
<script src="https://cdn.jsdelivr.net/npm/sasjs@1.10.8/index.js"
  integrity="sha256-651B1pxDxaKb9yhXQOUSohZ+Nq9Txfc3gXlX/GSw1RQ="
  crossorigin="anonymous"></script>
```

If your CSS or JS files are released via github, then they are automatically available with SRI checks using [JSDelivr](https://www.jsdelivr.com/) - for instance, to get the latest script tag for [SASjs](https://github.com/sasjs/adapter) you can just click [here](https://www.jsdelivr.com/package/npm/sasjs?tab=collection) and select "SRI".

If your files are elsewhere, or you'd like more control over the build, you can also generate the integrity hash yourself - here is the syntax:

```Bash
cat myfile.js | openssl dgst -sha384 -binary | openssl enc -base64
```

Third Party Server
---------------------

By setting up a dedicated web server and whitelisting it within SAS, you can isolate your frontend activities and enable frontend developers to deploy without having to enable access to the SAS Web Server directly.

Web devs can then work locally and push to that server, or work on the server directly.  One option for enabling remote (cloud) development is the open-source server edition of vscode: [https://github.com/cdr/code-server](https://github.com/cdr/code-server) (note - this won't work with vscodium due to non open-source components.


To whitelist the server in Viya, open `Environment Manager -> Configuration -> View -> Definitions` and select  `sas.commons.web.security`.  Make sure your domain (or `*`) is entered under `allowedHeaders`, `allowedMethods` and `AllowedOrigin`.

target=blank is unsafe
---------------------
Commonly used to open new tabs, be very careful opening external sites using a naked `_target=blank` attribute - this opens a [vulnerability](https://medium.com/@jitbit/target-blank-the-most-underestimated-vulnerability-ever-96e328301f4c#.oh7ggu8gn) for hijacking.

To avoid this, simply add a `rel="noopener noreferrer"` attribute to the anchor tag.


Content Security Policy
---------------------
This is a server setting that restricts the types of content that pages served from your domain can fetch. This might be to specific urls, or types of content (such as inline styles, base64 images, or external JS files).  If you are being restricted by CSP policy you will see a message like the one below in your console window:

`Content Security Policy: The page's settings blocked the loading of a resource at https://cdn.jsdelivr.net/combine/npm/chart.js@2.9.3,npm/jquery@3.5.1,npm/@sasjs/adapter@1.0.6 ("default-src").`

On SAS 9 the CSP configuration can be found in the following file location:  `!SASCONFIG/Lev1/Web/WebServer/conf/sas.conf`

The line to be modified will look something like this:
```
Header set Content-Security-Policy "default-src 'self' ; script-src 'unsafe-inline'  https://cdn.jsdelivr.net https://stackpath.bootstrapcdn.com; font-src 'self' data: fonts.gstatic.com;style-src 'self' fonts.googleapis.com"
```

After modifying the CSP the mid tier will need to be restarted (`./sas.servers.mid restart`)

Whilst it is often impossible to implement maximally secure settings, the configuration goal should be to enable as few of the 'insecure' ones as possible.  More information is available [here](https://content-security-policy.com/).

Note that the "default-src" provides a fallback where particular urls (eg font-src) are not specified.

It's also possible to go a step further and set the CSP policy in the HTML (rather than the headers from the web server).  You may consider this for sensitive applications.  An example:

```
<meta http-equiv="Content-Security-Policy" content="default-src https://cdn.example.net; child-src 'none'; object-src 'none'">
```

<meta name="description" content="Security Considerations when building HTML5 Web Apps on SAS 9 or SAS Viya">