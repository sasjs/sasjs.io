Viya
====================

SAS Viya is the new kid on the block and the future for the SAS platform. It has a blazingly fast in-memory, scalable architecture and is built with developers in mind.

Here are some relevant tips & tricks to help from an app-development perspective.

## Server Restart

This is necessary after configuring settings such as whitelisting.
Log onto the box as an admin and execute the following commands:

```
sudo /etc/init.d/sas-viya-all-services stop
sudo /etc/init.d/sas-viya-all-services start
```

## Shared Account and Server re-use

Server pooling and the use of a shared OS account are both possible from Viya 3.5 - the documentation is [here](https://go.documentation.sas.com/?cdcId=calcdc&cdcVersion=3.5&docsetId=calcontexts&docsetTarget=n1hjn8eobk5pyhn1wg3ja0drdl6h.htm&locale=en) (and a communities article are availabel [here](https://communities.sas.com/t5/SAS-Communities-Library/SAS-Viya-3-5-Compute-Server-Service-Accounts/ta-p/620992) and [here](https://communities.sas.com/t5/SAS-Communities-Library/SAS-Viya-3-5-SAS-Studio-and-SAS-Compute-Server-non-functional/ta-p/616617))

### Compute setup

Log onto the box and navigate to `/opt/sas/viya/home/bin`.  To create your profile (if you haven't done this already) run `./sas-admin profile init`.

Then, `./sas-admin auth login` to authenticate.  Next, `./sas-admin compute credentials create` and use the credentials you would like the new compute context to use (the equivalent of the SAS 9 `sassrv` account).

Next up, log onto SASEnvironment Manager (as admin user), Contexts, View Compute Contexts.  You can either create a new profile, or modify the existing "SAS Job Execution compute context".

Scroll down and add the following attribute / value pairs:

|Status|Attribute|Value|
|--|---|---|
|Mandatory|`runServerAs`|the user id we used in the `./sas-admin compute credentials create`  step above|
|Mandatory|`reuseServerProcesses`|`true`|
|Optional|`serverInactiveTimeout`|Time in seconds before the server times out.  Will otherwise time out when there are no active sessions.  Default is `600` (10 mins).  We recommend `1800` or longer.|
|Optional|`allowXCMD`|`true` or `false`|
|Optional|`unsafeJobCharacters`|Contains the characters that the compute session should remove from any variable that is provided to a job for execution. By default, the following characters are removed: & (ampersand), ” (double quotation mark), ; (semicolon), ’ (single quotation mark), and % (percent sign). If set to "" the feature is disabled.|

With this feature enabled, your end user ID will be `SYS_COMPUTE_SESSION_OWNER` instead of `SYSUSERID`.

Note - a server restart is not required.


## Cookies
As described in this [usage note](http://support.sas.com/kb/65/548.html), since the Google Chrome 80 update in February 2020, you may notice the following error in your log:

^ The request is invalid. This may indicate that the request was not originated by you, or the request time limit was reached. Please retry your action.
