# Security

Deploying web apps is generally more secure than, say, Python or R, because the Javascript libraries that are included do not have access to the filesystem. The browser "sandbox" also prevents JS files loaded from a one domain from making calls to another domain (Cross Origin Resource Sharing / CORS). That said, there are still a few security considerations to keep in mind when building apps on SAS.

## SAS 9 - Shared Services account

If you are using a Stored Process server to run your SAS 9 apps, it runs under shared OS credentials (`sassrv` per factory settings). Therefore you should be careful not to introduce any functionality that will allow end users to run arbitrary code (unless that STP context is locked down). For this reason, URL parameters are a bad idea, much better to send tables using an adapter such as [SASjs](https://sasjs.io).

It is also possible to run STPs under a Workspace Server context (where end user OS credentials match `&sysuserid`). This creates additional considerations in a Unix environment, as any files created will be owned by that user, which can prevent others from modifying or removing them.

## Folder Security

The recommended SASjs folder structure is to group services into app subfolders, so that security can be applied at backend. The app itself can also be secured by setting permission on the parent folder. There is one more thing to consider - services can be viewed (and executed) by anyone who has the READ permission, either using the `SERVERURL/SASStoredProcess?_action=1063` url or by navigating in `SASJobExecution` on Viya. Therefore your services should be built in such a way that no damage would be caused if an end user were to accidentally 'click' on one of the services and run it.

## Idempotence

Services should be built in such a way that they can be safely executed more than once. This is because it's possible that it WILL be run more than once (eg if the user clicks a button twice in succession).

## SubResource Integrity

An integrity hash is a checksum of a file - if just one character inside a file is changed, the checksum is totally different. This makes it a great tool for verifying that a CSS or JS file has not been modified since the checksum was generated. Content served over http (without SSL certificates) are extremely susceptible to Man in the Middle (MitM) [attacks](https://hackernoon.com/a-hacker-intercepted-your-wifi-traffic-stole-your-contacts-passwords-financial-data-heres-how-4fc0df9ff152). For this reason, it is best practice to either bundle all your dependencies inside your app, or apply SubResource Integrity (SRI) checking as per the [w3.org spec](https://www.w3.org/TR/SRI). The syntax looks like this:

```
<script src="https://cdn.jsdelivr.net/npm/sasjs@1.10.8/index.js"
  integrity="sha256-651B1pxDxaKb9yhXQOUSohZ+Nq9Txfc3gXlX/GSw1RQ="
  crossorigin="anonymous"></script>
```

If your CSS or JS files are released via github, then they are automatically available with SRI checks using [JSDelivr](https://www.jsdelivr.com/) - for instance, to get the latest script tag for [SASjs](https://github.com/macropeople/sasjs) you can just click [here](https://www.jsdelivr.com/package/npm/sasjs?tab=collection) and select "SRI".

If your files are elsewhere, or you'd like more control over the build, you can also generate the integrity hash yourself - here is the syntax:

```
cat myfile.js | openssl dgst -sha384 -binary | openssl enc -base64
```
