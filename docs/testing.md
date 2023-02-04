Testing
====================

Our favourite tool for testing is Cypress - it's what we use for SASjs and it's user friendly and fully featured.  If you have chrome it will even launch with [CORS](/cors/) disabled for seamless API testing.

For SAS testing (macros, jobs & services) you can also use [sasjs test](https://cli.sasjs.io/test).


## Browsers

Most likely you will only need to test you applications against a very limited set of browsers (the ones your company uses, which typically inludes IE).

For testing a wider set of browsers, the following tools are useful

* Browserstack (paid)
* https://ftp.mozilla.org/pub/firefox/releases/  (previous versions of FF)

## Accessibility

There are several tools you can use to ensure your app can be consumed by users of all abilities (ie, is navigable by both keyboard & mouse and has the necessary labels for screen readers etc):

* Google Lighthouse - just open dev tools in Chrome and run the report on the lighthouse tab
* The [lighthouse CLI](https://www.npmjs.com/package/@lhci/cli) - more info in the project [readme](https://github.com/GoogleChrome/lighthouse-ci#readme).  The specs are in the `lighthouserc.js` file, which shows the pages tested, and the target score (90%).
* The [eslint-plugin-jsx-a11y](https://www.npmjs.com/package/eslint-plugin-jsx-a11y) NPM module - all recommended rules should be applied in the `.eslintrc` file (`"plugin:jsx-a11y/recommended"`).  Full list of rules: https://github.com/jsx-eslint/eslint-plugin-jsx-a11y#supported-rules
* https://www.nvaccess.org -> a free download to check for screen reader compatibility


<meta name="description" content="Tips & tricks for testing SAS Powered Web Apps - such as Browserstack and Cypress">

