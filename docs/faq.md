Frequently Asked Questions
====================

Do you have examples of SAS apps built with the SASjs framework?
---------------------
We have a list of public SAS apps in github repositories available [here](https://sasjs.io/apps/) - using these you can see examples of the configuration used to build SASjs apps.
There is also a commercial app built with the framework that has been deployed to customers in several countries - it's called [Data Controller for SAS](https://datacontroller.io)

The SASjs framework is also used exclusively for bespoke SAS app development by our sponsors at [Analytium](https://sasapps.io).


What are the Minimum Requirements for building Apps on SAS?
---------------------

To build apps on SAS you need SAS Viya, or SAS 9 with Stored Process Server.  

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

<meta property="og:title" content="Frequently Asked Questions on the SASjs Framework.">
<meta property="og:description" content="A collection of frequently asked questions from readers who are interested in building apps with SAS using the SASjs framework">
<meta name="description" content="A collection of frequently asked questions from readers who are interested in building apps with SAS using the SASjs framework">

<script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [{
        "@type": "Question",
        "name": "What are the Minimum Requirements for building Apps on SAS?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "<p>To build apps on SAS you need SAS Viya, or SAS 9 with Stored Process Server.</p><p><b>You cannot create web apps on SAS with University Edition.</b></p><p>To check if you have SAS Viya, open SAS Studio, click your user profile and click 'About'. </p><p><a href=https://sasjs.io/faq/#minimum-requirements> Click here </a> for more information</p>"
        }
      }, {
        "@type": "Question",
        "name": "Which apps have been built with the SASjs framework?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "<p>A list of public SAS apps in github repositories is available <a href=https://sasjs.io/apps/>here</a></p> - using these you can see examples of the configuration used to build SASjs apps.<p>There is also a commercial app built with the framework that has been deployed to customers in several countries - it's called  <a href=https://datacontroller.io>Data Controller for SAS</a></p><p>The SASjs framework is also used exclusively for bespoke SAS app development by our sponsors at <a href=https://sasapps.io>Analytium</a>.</p>"
        }
      }]
    }
    </script>