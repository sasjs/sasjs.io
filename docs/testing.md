# Testing

Our favourite tool for testing is Cypress - it's what we use for SASjs and it's user friendly and fully featured.  If you have chrome it will even launch with [CORS](/frontend/cors) disabled for seamless API testing.

To see it in action, clone the SASjs site, add your SAS details in the [cypress.json(https://github.com/macropeople/sasjs/blob/development/cypress.json) file, `npm install` and `npm run cypress`.


## Browsers


Most likely you will only need to test you applications against a very limited set of browsers (the ones your company uses, which typically inludes IE).

For testing a wider set of browsers, the following tools are useful

* Browserstack (paid)
* https://ftp.mozilla.org/pub/firefox/releases/  (previous versions of FF)