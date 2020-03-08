# Security

Deploying web apps is generally more secure than, say, Python or R, because the Javascript libraries that are included do not have access to the filesystem.  The browser "sandbox" also prevents JS files loaded from a one domain from making calls to another domain (CORS).  That said, there are still a few security considerations to keep in mind when building apps on SAS.

## SAS 9 - Shared Services account
If you are using a Stored Process server to run your SAS 9 apps, it runs under shared OS credentials (`sassrv` per factory settings).  Therefore you should be careful not to introduce any functionality that will allow end users to run arbitrary code (unless that STP context is locked down).  For this reason, URL parameters are a bad idea, much better to send tables using an adapter such as [SASjs](https://sasjs.io).

It is also possible to run STPs under a Workspace Server context (where end user OS credentials match `&sysuserid`).

## Folder Security
The recommended SASjs folder structure is to group services into app subfolders, so that security can be applied at backend.  The app itself can also be secured by setting permission on the parent folder.  There is one more thing to consider - services can be viewed (and executed) by anyone who has the READ permission, either using the `SERVERURL/SASStoredProcess?_action=1063` url or by navigating in `SASJobExecution` on Viya.

Therefore your services should be built in such a way that no damage would be caused if an end user were to accidentally 'click' on one of the services and run it.

## Idempotence
Services should be built in such a way that they can be safely executed more than once.  This is because it's possible that it WILL be run more than once (eg if the user clicks twice in succession).

## Integrity Checking for Javascript files
Whilst CORS provides some protection from cross site AJAX, it does not prevent man-in-the-middle attacks on your supposedly 'trusted' sources.

An integrity hash provides a way for the browser to ensure that javascript file received is the one that was expected. An example of the syntax for including `SASjs` is shown below:

```
<script src="https://cdn.jsdelivr.net/npm/sasjs@1.9.0/index.js"
integrity="sha384-ppDMKTgsjRnY/9ORpxSHFFFo/0yv70I/IYjyWClq1dXOxYkFWaw+lCWU6BSjMKMP"
crossorigin="anonymous"></script>
```
