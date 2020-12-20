---
marp: true
theme: default
paginate: true

<!--
npx @marp-team/marp-cli slides6min.md -o ./theme/slides/appdev.html
-->

---
<!-- header: ![h:6em](https://sasjs.io/img/js-logo700x389.png)-->

# SAS App Development & Automated Deployments
## Allan Bowe

![bg right:33% height:250 ](https://datacontroller.io/wp-content/uploads/2020/10/abow.png)

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
Why SAS? Firstly it's completely self contained.  Everything
you need is preconfigured, such as
 - SAS Web Server
 - Application Server
 - Load Balancing
and of course, dozens of access engines connecting to all kinds of
databases such as snowflake, redshift and Google BigQuery.
Beyond superfast in-memory cas, and machine learning viya actions, there's
also formidable integration with Enterprise IT.  SAS provides LDAP
integration, Single Signon, data encryption, SSL, full audit tracing,
you name it..
Beyond the scalability of SAS itself, web apps are inherently scalable.
They can be deployed to any device with a browser, where they'll run
safely inside that browser sandbox.  There also very easy to un-deploy -
compared to say a VBA, R or Python based desktop app.
-->

---
# Problems with Desktop Apps

* Security
* Scalability
* Governance

![bg right:50% vertical height:200](https://i.imgur.com/n3BKKPb.gif)
![bg right:50% height:200](https://media2.giphy.com/media/KAq5w47R9rmTuvWOWa/giphy.gif)
![bg right:50% height:200](https://www.r-project.org/Rlogo.png)



<!--
Of course, both Python and R can run on a server, and VBA apps can deprecate themselves and force you to download the latest instance.  But given the fact that desktop apps, or End User Computing, is still so prominent - and this includes legacy SAS AF, SCL driven apps - it's worth reviewing the reasons to avoid this particular paradigm.

Security is a big one, and this can be problems with embedded passwords, the amount of filesystem access the app has, or the fact that anyone on the filesystem can access, and potentially modify, the app.

Scalability, as just mentioned, rolling out a desktop app to 1000 users is non-trivial and typically requires the engagement of a different team.

Governance is probably the biggest reasons to avoid desktop apps as it can be really difficult to know who's using what, and which version.

-->

---


# HTML5 App Architecture

![bg right:65% height:370 ](https://sasjs.io/img/architecture.png)

---
# Deployment Strategies

- Free for all
- Centralised Deployment
- Automated Deployment

<!-- TRANSCRIPT
In terms of deployment strategies, certainly the fastest way you can get your app into SAS is just write it there directly and make changes directly on the server.

As soon as things get complex, and especially once you start adding more users and basing business critical reporting on the platform this approach breaks down very quickly.  You need to know what is changing in the environment, so you can troubleshoot and roll back should incidents occur.

A centralised model might involve a spreadsheet and nominated individuals doing the promote.  This does introduce a bottleneck and reliance on key individuals, and doesn't necessarily make things any more transparent.

Automated deployment is the only real strategy, especially in Viya where it's so easy to do.  A change might be reviewed as part of a pull request, and autodeployed following a merge to a nominated GIT branch, providing full transparency and the ability to run automated tests with every commit.
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

- Jenkins / MS Release Manager
- Bitbucket / Gitlab Pipelines
- Github Actions

<!-- TRANSCRIPT
Tools for running release processes include traditional ones such as Jenkins
and Release Manager, however for mid-sized deployments you could
also consider Pipelines (actions in github) which means you'd never
have to leave your GIT repository.
-->

---
# Making it Happen

- DIY with [REST API](https://developer.sas.com/guides/restapis/viya-rest.html)
- [PyViyaTools](https://github.com/sassoftware/pyviyatools)
- [SASjs CLI](cli.sasjs.io)

<!-- TRANSCRIPT
Whichever tool you use, in order to connect to SAS there are three major
options:
* doing it yourself with your preferred language - most flexible, can also
take the most time
* If you like python, then the pyviya tools has a bunch of utilities
* And because we're web developers, we built a CLI within SASjs
-->
---
# SASjs Framework

- @sasjs/core - Macro library
- @sasjs/adapter - Connectivity
- @sasjs/cli - CI/CD and Automated Deployment

<!--
* Macros in SAS
* Adapter in Typescript
* CLI in Javascript (Node runtime)
-->


---
# Sonic the Hedgehog

https://github.com/allanbowe/sonic

![bg right:50%](https://j.gifs.com/q7vkm2.gif)

---
# Rock Roller

http://bit.ly/sasrockroller

![bg right:50%](https://j.gifs.com/1W8vNj.gif)

---
# Viya Token Generator

https://github.com/sasjs/viyatoken

![bg right:50%](https://j.gifs.com/p80jDr.gif)


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