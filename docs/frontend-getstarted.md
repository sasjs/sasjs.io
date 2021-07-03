---
layout: article
title: Frontend Web
og_title: Get started with a SAS-Powered Frontend
description: To launch a web site, you need access to a server! With SAS there are a number of approaches you can take.
og_image: /img/html_css_js.jpeg
---

Adding a frontend to your analytics project provides limitless potential for creating bespoke user experiences for decision support.

There are many ways to create HTML interfaces with SAS, and we support all of them EXCEPT ONE.

The approach we **don't** support is one that the vast majority of SAS app developers will be familiar with - and that is, to *write SAS code to stream web outputs*.

The two most common techniques for achieving this are:

* Data step put statements (an apostrophe catastrophe)
* Proc stream (&it will test your resolve)

Both of these are BAD options for creating user interfaces.  Whilst you (as the original developer) might find yourself making good progress initially, embedding JS logic with SAS logic, as soon as your app starts to get more complex - you will spend more and more time debugging minor changes.  It will cost more to add new features, and it will be very difficult for anyone else to maintain (even you, after a short break).

Far, far better is to maintain a _complete separation_ of frontend (web) and backend (SAS) code.  This approach also means that you can have your frontend built/maintained by a frontend developer (easy to find) and the backend maintained by a regular SAS dev (easy to find).

We call SAS developers with frontend skills UNICORNS

They don't really exist!  Either a frontend developer has adopted some basic SAS skills, or a SAS developer has learned some javascript.  Very few developers are truly proficient in both.

So do yourself, your project, and your colleagues a favour - enforce *complete seperation* between the frontend and backend.

### Working Locally

It's common for web developers to build & test the frontend _locally_, on a desktop.  This means spinning up a server on your own machine (`localhost`) and using that to connect to SAS. This is convenient, but will typically require bypassing some security settings by enabling [cors](/cors/) in your browser.

If you are using the [SASjs Adapter](https://github.com/sasjs/adapter) with this approach, you will also need to supply the `serverUrl` property - as will not be possible to determine the location of the SAS server from the URL.

Note that this may not be possible if there is whitelisting on the SAS Server - for that you will need to either ask your admin to change the setting, or make use of one of the [deployment](/frontend-deployment) options.




