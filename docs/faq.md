---
layout: article
title: Frequently Asked Questions
description: A collection of frequently asked questions from readers who are interested in building apps with SAS using the SASjs framework
---

Frequently Asked Questions
====================

Do you have examples of SAS apps built with the SASjs framework?
---------------------
We have a list of public SAS apps in github repositories available [here](https://sasjs.io/apps/) - using these you can see examples of the configuration used to build SASjs apps.
There is also a commercial app built with the framework that has been deployed to customers in several countries - it's called [Data Controller for SAS](https://datacontroller.io)

The SASjs framework is also used exclusively for bespoke SAS app development by our sponsors at [Analytium](https://sasapps.io).


What are the Minimum Requirements for building Apps on SAS?
---------------------

To build apps on SAS you need SAS Viya 3.4 and above, or SAS 9.3 and above with Stored Process Server.

**You cannot create web apps on SAS with University Edition.**

To check if you have SAS Viya, open SAS Studio, click your user profile and click "About".

If you are using Enterprise Guide, then simply run:

```sas
data _null_;
  length url $128;
  rc=METADATA_GETURI("Stored Process Web App",url);
  putlog 'Your SAS 9 url is: ' url;
run;
```

Which Browsers Does SASjs Support?
---------------------

With the right polyfills your SASjs app can support a very wide range of browsers, however the question is - do you really want to?  There can be a lot of edge cases to cover and support.

For guidance you might consider following SAS Institute's browser [support policy](https://support.sas.com/en/documentation/third-party-software-reference/9-4/support-for-9-4-web-browsers.html#:~:text=Microsoft%20Internet%20Explorer%20and%20Microsoft%20Edge&text=For%20most%20SAS%209.4%20applications,do%20not%20support%20Microsoft%20Edge).  Note the diminishing support for IE.

I want to help, but I’m not a developer. Are there any ways for non-coders to contribute?
---------------------

1. Shill it to everyone and create awareness
2. Answer questions from new users in the community channels
3. Make tutorial videos
4. Write instruction manuals or commit to the docs

<script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [{
        "@type": "Question",
        "name": "What are the Minimum Requirements for building Apps on SAS?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "<p>To build apps on SAS you need SAS Viya 3.4 and above, or SAS 9.3 and above with Stored Process Server.</p><p><b>You cannot create web apps on SAS with University Edition.</b></p><p>To check if you have SAS Viya, open SAS Studio, click your user profile and click 'About'. </p><p><a href=https://sasjs.io/faq/#minimum-requirements> Click here </a> for more information</p>"
        }
      }, {
        "@type": "Question",
        "name": "Which apps have been built with the SASjs framework?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "<p>A list of public SAS apps in github repositories is available <a href=https://sasjs.io/apps/>here</a></p> - using these you can see examples of the configuration used to build SASjs apps.<p>There is also a commercial app built with the framework that has been deployed to customers in several countries - it's called  <a href=https://datacontroller.io>Data Controller for SAS</a></p><p>The SASjs framework is also used exclusively for bespoke SAS app development by our sponsors at <a href=https://sasapps.io>Analytium</a>.</p>"
        }
      }, {
        "@type": "Question",
        "name": "Which browsers does SASjs support?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "<p>With the right polyfills your SASjs app can support a very wide range of browsers, however the question is - do you really want to?  There can be a lot of edge cases to cover and support.</p><p>For guidance you might consider following SAS Institute's browser <a href=https://support.sas.com/en/documentation/third-party-software-reference/9-4/support-for-9-4-web-browsers.html#:~:text=Microsoft%20Internet%20Explorer%20and%20Microsoft%20Edge&text=For%20most%20SAS%209.4%20applications,do%20not%20support%20Microsoft%20Edge>support policy</a>.  Note the diminishing support for IE. </p>"
        }
      }]
    }
    </script>
