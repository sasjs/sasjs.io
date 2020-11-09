---
marp: true
theme: default
paginate: true
description: "npx @marp-team/marp-cli slidesgeeks.md -o ./theme/slides/geeks.html"

---
<!-- header: ![h:5em](https://upload.wikimedia.org/wikipedia/commons/9/97/%E0%A6%B8%E0%A7%8D%E0%A6%AF%E0%A6%BE%E0%A6%B8_%E0%A6%B2%E0%A7%8B%E0%A6%97%E0%A7%8B.png)-->

# App Development & Automated Deployments
## Allan Bowe

![bg right:33% height:250 ](https://datacontroller.io/wp-content/uploads/2020/10/abow.png)

- Superpower: TELEKINESIS
- With just a few taps in the console, all the code in github can be packaged and flown over to  a remote SAS Server where it is distributed into all the right places

<!-- TRANSCRIPT
My name is Allan Bowe and this is a very short overview of building and deploying HTML5 apps on SAS.
-->

---
# Why Build Web Apps on SAS?

- Self-Contained Environment
- Data Management & Analytics
- Enterprise Security & Scalability
![bg right:50% height:700](https://algorithmia.com/blog/wp-content/uploads/2019/10/Jira_workflow_animation.gif)


<!-- TRANSCRIPT
Why SAS? Firstly it's completely self contained. Everything you need is already provisioned as part of the standard platform, such as:
 - SAS Web Server
 - Application Server
 - Load Balancing
and of course, dozens of access engines for data management inside pretty much any cloud database you can imagine, plus of course, the analytics.
SAS also providesformidable integration with Enterprise IT, such as LDAP
integration, SAML, Single Signon, data encryption, SSL, etc.

Beyond the scalability of SAS itself, web apps are inherently scalable.
They can be deployed to any device with a browser, where they'll run
safely inside that browser sandbox.
-->


---


# HTML5 App Architecture

![bg right:65% height:370 ](https://sasjs.io/img/architecture.png)

<!--
here I discuss the different parts to be deployed
-->

---
# Deployment Strategies

- Free for all
- Centralised Deployment
- Automated Deployment

<!-- TRANSCRIPT
In terms of deployment SAS does make it very easy to just open up a web application such as Environment Manager or SAS Studio and start writing code and making changes.

This strategy might work well if there are just one or two users on the box, but it's a risky way of working as you have no real mechanism to roll back changes to to track the changes being made.

A centralised model might involve the developer writing some release notes and preparing a package for an administrator to promote.  This provides some level of control, but does create a bottleneck on the administrators.

Automated deployment is really the best strategy, especially in Viya where everything can now performed using REST APIs and commandline tools.  A change might be reviewed as part of a pull request, and autodeployed following a merge to a nominated GIT branch, providing full transparency and the ability to run automated tests with every commit.
-->


---
# Benefits of Automated Deployment

- Stable Operating Environment
- Faster Feature Delivery
- Happier, More Productive Teams

<!-- TRANSCRIPT
Benefits include a more stable environment, especially when deploying frequently as smaller changes are easier to roll back.

Regular deployments also make for faster feature delivery, which not only
delights business stakeholders but the development teams also - they get
to spend more time building cool stuff and less time attending Release
Meetings and filling out paperwork.
-->


---
# Release Management

- Liquibase
- Jenkins / MS Release Manager
- GIT Pipelines / Actions


<!-- TRANSCRIPT
Tools for running release processes include liquibase, for databases, deployment orchestrators such as Jenkins
and Release Manager, and integrated containers such as pipelines (bitbucket, gitlab) and github actions.
-->

---
# Configuration Management

- `sas-admin` - wide range of plugins
- `sas-bootstrap-config` - key value pairs & certificates
- Unix tools (`rsync` / `mv` / `grep` etc)


<!-- TRANSCRIPT
The SAS Admin CLi has a range of plugins to handle authorization rules, backups, models, promotions etc.
SAS Bootstrap Config can help you modify and even undo settings even whilst the services are down.


-->

---
# Content Management

- DIY with [REST API](https://developer.sas.com/guides/restapis/viya-rest.html)
- [PyViyaTools](https://github.com/sassoftware/pyviyatools)
- [SASjs](https://cli.sasjs.io)

<!-- TRANSCRIPT
Whichever tool you use, in order to connect to SAS there are three major
options:
* doing it yourself with your preferred language - most flexible, can also
take the most time
* If you like python, then the pyviya tools has a bunch of utilities
* And because we're web developers, we built a deployment framework using Node, which we call SASjs
-->
---
# SASjs Framework

- [@sasjs/core](https://github.com/sasjs/core) - Macro Core library
- [@sasjs/adapter](https://github.com/sasjs/adapter) - SAS Server Connectivity
- [@sasjs/cli](https://github.com/sasjs/cli) - CI/CD and Automated Deployment

<!--
Now I've given you a flavour of what can be done with SASjs, lets break down what it actually is.  It's a framework of parts.  Each part can be used individually, but when used together they provide a serious accelerator for SAS app development & deployment.
The key components are:
* Macro Core library, written in SAS
* The Adapter which provide the connectivity to SAS, written in Typescript
* CLI, written in Javascript, which uses the adapter under the hood.
-->



---
# Build a Viya App in One Minute

https://youtu.be/WwGptgvSqSw?t=15

<!-- TRANSCRIPT
Here I will walk through the video and explain the process as we go
-->

---
# SASjs Core

- Make Services, Folders, Groups & more
- Base SAS, Metadata, Viya
- `npm install @sasjs/core`

<!-- TRANSCRIPT
Over 100 utility macros to accelerate app development at the backend, whether that's standalone SAS, SAS 9 or Viya.
It can be installed locally in a GIT project and version locked with NPM, included directly from the git repo in a SAS session, or deployed in a more traditional way using SASAUTOs.
-->

---
# SASjs Adapter

- Authentication
- Bidirectional communication with SAS
- `npm install @sasjs/adapter`

<!-- TRANSCRIPT
The adapter handles SAS Logon authentication and all the back and forth between the frontend app and the backend SAS server.  It can be installed locally in an NPM project, or directly in any web app with a script tag.
-->

---
# SASjs CLI

- Project Setup
- Automated Deployments
- `npm install --global @sasjs/cli`

<!-- TRANSCRIPT
The CLI provides an opinionated project setup and a set of easy to use commands for handling common deployment tasks. It needs to be installed globally in order to be available in your preferred shell window.
-->

---
# `sasjs add`

- Define a Target
- Client / Secret
- App Location (`appLoc`)

---
# `sasjs folder`

- `sasjs folder create /some/folder -t target`
- `sasjs folder move /some/folder /new/folder`
- `sasjs folder delete /new/folder`


---

# `sasjs run`

- `sasjs run code.sas`

![bg right:60% height:450](docs/img/sasjsrun1.png)

---
<!-- header: ![h:3em](https://sasjs.io/img/js-logo700x389.png)-->


| Command |Description|
|:-------:|:----:|
|   [add](https://cli.sasjs.io/add)   | Provides a series of prompts used to define a SAS  [target](https://sasjs.io/glossary#target ) along with the relevant connection details (if SAS Viya) |
|[build](https://cli.sasjs.io/build)  |takes all of the input jobs and services and creates a build pack|
|[compile](https://cli.sasjs.io/compile)|Extracts all the dependencies and input programs for each service / job and includes them in a single file ready for deployment|
|[context](https://cli.sasjs.io/context)|List, export, create, edit, and delete SAS Compute contexts|
|[create](https://cli.sasjs.io/create)| Initialise a SASjs repository, either in plain form or using a range of templates|
|[deploy](https://cli.sasjs.io/deploy)|Perform the actual deployment of a SASjs project into SAS 9 or Viya|
|[folder](https://cli.sasjs.io/folder)|Management of logical Viya folders|
|[job](https://cli.sasjs.io/job)|Manage & Execute SAS Jobs|
|[run](https://cli.sasjs.io/run)|Run arbitrary SAS code in a Viya Compute Session, directly from the terminal (or commandline session)|
|[servicepack](/servicepack)|The SASjs Service Pack is a collection of services and folder objects.  The servicepack command lets you deploy them easily|

<!-- TRANSCRIPT
We have a growing number of additional actions, and if there's any you'd like to see, just head over to the repo and raise an issue.
-->

---
<!-- header: ![h:6em](https://sasjs.io/img/js-logo700x389.png)-->

# Allan Bowe, Head of SAS Apps

- allan.bowe@analytium.co.uk
- https://www.linkedin.com/in/allanbowe/
- https://github.com/sasjs

<!-- TRANSCRIPT
The github link is right there, feel free to reach out if you'd like to know more, we'd be happy to arrange workshop or training session for you and your team.
-->