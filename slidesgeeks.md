---
marp: true
theme: default
paginate: true
description: "npx @marp-team/marp-cli slidesgeeks.md -o /tmp/geeks.pptx"

---
<!-- header: ![h:5em](https://analytium.co.uk/wp-content/themes/analytium-app/assets/img/icons/header_logo.svg)-->

# App Dev & Automated Deployments
## Allan Bowe
Head of SAS Apps - Analytium Group

![bg right:20% height:250 ](https://datacontroller.io/wp-content/uploads/2020/10/abow.png)

- Superpower: TELEKINESIS
- With just a few taps in the console, all the code in github can be packaged and flown over to  a remote SAS Server where it is distributed into all the right places

<!-- TRANSCRIPT
My name is Allan Bowe and this is a very short overview of App Development and Deployment on SAS.
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
A typical web app is displayed on a client such as a desktop or laptop.  Assets such as HTML, CSS, Javascript and Images are served from a dedicated web server.  This provides rapid response times and low latency.  Any data driven services are routed through the SAS Application server, being the Job Execution service on Viya or the Stored Process server on SAS 9.
The backend also uses the access engines to connect to any relevant databases.
-->

---
# Deployment Strategies

- Free for all
- Centralised Deployment
- Automated Deployment

<!-- TRANSCRIPT
In terms of deployment, SAS makes it very easy to just open up Environment Manager or SAS Studio and start making changes.

This strategy might work well if there are just one or two users on the box, but it's a risky way of working as you have no real mechanism to roll back changes to to track the changes being made.

A centralised model might involve the developer writing some release notes and preparing a package for an administrator to promote.  This provides some level of control, but creates a bottleneck on administrators.

Automated deployment is really the best strategy, especially in Viya where everything can be performed using REST APIs and commandline tools.  A change might be reviewed as part of a pull request, and autodeployed following a merge to a nominated GIT branch, providing full transparency and the ability to run automated tests with every commit.
-->


---
# Benefits of Automated Deployment

- Stable Operating Environment
- Faster Feature Delivery
- Happier, More Productive Teams

<!-- TRANSCRIPT
Benefits include a more stable environment, especially when deploying frequently as smaller changes are easier to roll back.

Regular deployments also enable faster feature delivery, which
delights business stakeholders, and the development teams also - they get
to spend more time building cool stuff.
-->


---
# Non SAS Tools

- Liquibase
- GIT Pipelines / Actions
- Command Line tools (`rsync` / `mv` / `grep` etc)


<!-- TRANSCRIPT
Third party tools for running release processes include liquibase, for databases, deployment orchestrators such as Jenkins
and Release Manager, and integrated containers such as pipelines (bitbucket, gitlab) and github actions.
-->

---
# SAS Tools

- `sas-admin` CLI - wide range of plugins
- `sas-bootstrap-config` CLI - key value pairs & certificates
- [PyViyaTools](https://github.com/sassoftware/pyviyatools) - Python Based
- [SASjs](https://cli.sasjs.io) CLI - Node JS based


<!-- TRANSCRIPT
The SAS Admin CLi has a range of plugins to handle authorization rules, backups, models, promotions etc.
SAS Bootstrap Config can help you modify and even undo settings even whilst the services are down.

-->


---
<!-- header: ![h:5em](https://sasjs.io/img/js-logo700x389.png)-->

# SASjs CLI

- Project Setup
- Automated Deployments
- `npm install --global @sasjs/cli`

<!-- TRANSCRIPT
The CLI provides an opinionated project setup and a set of easy to use commands for handling common deployment tasks. It needs to be installed globally in order to be available in your preferred shell window.

Prerequisite - Node JS
-->

---
# `sasjs add`

- Define a Target
- Client / Secret
- App Location (`appLoc`)

<!--
sasjs add used to provide the connection details. Provides the defaults for the environment, such as the server, the credentials, and the default app location.
-->

---
# `sasjs folder`

- `sasjs folder create /some/folder -t target`
- `sasjs folder move /some/folder /new/folder`
- `sasjs folder delete /new/folder`

<!--
manage folders in the SAS Drive
-->

---

# `sasjs run`

- `sasjs run code.sas`

![bg right:60% height:430](docs/img/sasjsrun1.png)

---
# `sasjs context`

- `list`
- `export`
- `create`
- `edit`
- `delete`

![bg right:73% height:350](https://i.imgur.com/HSFhOt8.png)


<!--
A context, a compute context, provides the attributes under which a SAS session will start - such as the autoexec, SAS Options, whether it's a pooled server, the system credentials etc.

-->

---
# `sasjs job`

- `execute`


<!--
SAS jobs are the building blocks behind every model and SAS data repository.  A job is essentially some SAS code stored on the server.  The SASjs Job command lets you run any SAS job, right from command line.
-->

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