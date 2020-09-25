Glossary
====================


If you'd like to see a new item added, feel free to raise an [issue](https://github.com/sasjs/sasjs.io/issues/new) or [PR](https://github.com/sasjs/sasjs.io/pulls)!

## appLoc
The "appLoc" represents the "app location" in terms of where the backend web services are stored in the logica folder tree (eg SAS Drive on Viya, or metadata in SAS 9)

By defining the appLoc in the SASjs config, the `sasjs.request()` method can use a relative path (without leading slash), meaning that the app can be easily moved (or deployed elsewhere).


## Target

A Target in SASjs represents a configuration against which the app will be deployed. Example items for a configuration include:

* serverType (eg SAS9 or SASVIYA)
* serverUrl (the url of the server)
* appLoc (the logical folder to which the SAS web services will be deployed)




<meta name="description" content="A glossary of terminology used in the SASjs development framework">