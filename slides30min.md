---
marp: true
theme: default
paginate: true
<!--
npx @marp-team/marp-cli slides.md ./theme/slides.html
-->

---
<!-- header: ![h:5em](https://sasjs.io/img/js-logo700x389.png)-->

# Rapid SAS App Deployments with the SASjs CLI
## Allan Bowe

![bg right:33% height:250 ](https://datacontroller.io/wp-content/uploads/2020/10/abow.png)

<!-- TRANSCRIPT
Hello, my name's Allan Bowe, I've been a SAS App developer for.. a number of years, and in this session we're going to do a bit of a deep dive into automated deployments using the SASjs CLI.
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
safely inside that browser sandbox.  They're also very easy to un-deploy -
compared to say a VBA, R or Python based desktop app.
-->


---


# HTML5 App Architecture

![bg right:65% height:370 ](https://sasjs.io/img/architecture.png)

---
# Deployment Strategies

- Free for all
- Centralised Deployment
- Automated Deployment

<!--
In terms of deployment strategies, certainly the fastest way you can get your app into SAS is just write it there directly and make changes directly on the production server.

As soon as things get complex though, and especially once you start adding more users and basing business critical reporting on the platform this approach breaks down very quickly.  You need to know what is changing in the environment, so you can troubleshoot and roll back should incidents occur.

A centralised model might involve a spreadsheet and nominated individuals doing the promote.  This does introduce a bottleneck and reliance on key individuals, and doesn't necessarily make things any more transparent.  It tends to improve stability at the expense of speed.

Automated deployment is the only real strategy, especially in Viya where it's so easy to do.  A change might be reviewed as part of a pull request, and autodeployed following a merge to a nominated GIT branch, providing full transparency and the ability to run automated tests with every commit.
-->


---
# Benefits of Automated Deployment

- Stable Operating Environment
- Faster Feature Delivery
- Happier, More Productive Teams

<!--
Benefits include a more stable environment, especially when deploying frequently as smaller changes tend to be much easier to troubleshoot and roll back.

Regular deployments also make for faster feature delivery, which not only
delights business stakeholders but development teams too - they get
to spend more time building cool stuff and less time attending Release
Meetings and filling out paperwork.
-->


---
# Release Management

- Jenkins
- MS Release Manager
- Bitbucket / Gitlab Pipelines, Github Actions

<!--
Traditional tools for managing releases include Jenkins and MS Release Manager.  Major source control vendors such as gitlab, bitbucket and github offer deployment pipelines, or actions in github, which has the benefit of keeping everything in one repository.
-->

---
# Making it Happen

- DIY with [REST API](https://developer.sas.com/guides/restapis/viya-rest.html)
- [PyViyaTools](https://github.com/sassoftware/pyviyatools)
- [SASjs CLI](cli.sasjs.io)

![bg right:50% height:550px](https://i.imgur.com/Asc4DqC.png)


<!--
Whichever tool you use, in order to connect to SAS there are three major
options:
* you can do it yourself using the REST APIs- which is the most flexible, but can also take a lot of time
* If you like python, you can base yourself off the pyviya tools in the sassoftware repository
* And because we're web developers, we actually built a _nodeJS_ based CLI for this called SASjs
-->


---
# Sonic the Hedgehog

https://github.com/allanbowe/sonic

![bg right:50%](https://j.gifs.com/q7vkm2.gif)
<!--
To demonstrate the kind of apps you can build with SASjs, here's a Sonic game - this is really a very simple iframe streamed through a SAS 9 Stored Process, as you can see there in the URL.
The interesting thing is that you can deploy this app with just 2 lines of code, as you will see if you go to github.com/allanbowe/sonic.

-->

---
# Rock Roller

http://bit.ly/sasrockroller

![bg right:50%](https://j.gifs.com/1W8vNj.gif)

<!--
The Rock Roller game is deployed on Viya, you can see it here being streamed from the files service.  You can create it yourself using the SASjs CLI as described in the github repo behind bit.ly/sasrockroller.

-->


---
# Viya Token Generator

https://github.com/sasjs/viyatoken

![bg right:50%](https://j.gifs.com/p80jDr.gif)

<!--
The Viya Token generator is a bit more practical.  In order to consume the Viya REST APIs outside of SAS you need to register a client ID and a secret.  This is used by client applications, such as the CLI, to obtain an access token, that allows the app to make requests on behalf of the user.

The client ID can be spawned with different properties, that determine the level of access to be granted to your application.

-->

---
# Data Controller - Excel Capture

https://datacontroller.io

![bg right:50%](https://j.gifs.com/ROxExV.gif)

<!--
Data Controller is a SAS App that provides a zero code way to load data safely into SAS, it has 40 backend services, a database, and is completely built and deployed using SASjs.

This demo shows how we use javascript to import an excel workbook, where the relevant data is found and extracted and sent to SAS for approval, along with a copy of the original workbook.

-->

---
# Data Controller - Data Lineage

https://datacontroller.io

![bg right:50%](https://datacontroller.io/wp-content/uploads/2020/10/SAS_Data_Lineage_-_Column_Level.gif)

<!--
Here's one more video showing SAS 9 data lineage, extracted at column level, including business logic, and displayed using a javascript library that lets you export the linage in PNG, SVG and CSV format

-->

---
# Build a Viya App in One Minute

https://youtu.be/WwGptgvSqSw?t=15



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
# SASjs Core

- Make Services, Folders, Groups & more
- Base SAS, Metadata, Viya
- `npm install @sasjs/core`

![bg right:50% height:700](https://i.imgur.com/K43rKHb.png)

<!--

The macro core library contains over 100 utility macros to accelerate app development at the backend, whether that's standalone SAS, SAS 9 with metadata, or Viya.
It can be installed locally in a GIT project and version locked with NPM, included directly from the git repo in a SAS session, or deployed in a more traditional way using SASAUTOs.
-->

---
# SASjs Adapter

- Authentication
- Bidirectional communication with SAS
- `npm install @sasjs/adapter`

<!-- TRANSCRIPT
The adapter handles SAS Logon authentication and all the back and forth between the frontend app and the backend SAS server.  It can be installed locally in an NPM project, or directly in any web app using a script tag.
-->

---
# SASjs CLI

- Project Setup
- Automated Deployments
- `npm install --global @sasjs/cli`
- https://sasjs.io/windows/#npm -> portable install of NPM

<!--
The CLI provides an opinionated project setup and a set of easy to use commands for handling common deployment tasks. It needs to be installed globally in order to be available in your preferred shell window.

It's also worth noting that whilst you can use both the SAS Macro library, and the SAsjs adapter without installing nodeJs - that's not the case here.  Just like SAS needs a SAS session, and Python needs a Python runtime, the SASjs CLI needs a nodeJS instance in which to execute.

It is possible to install NodeJs on a locked down windows machine without admin rights, and I've provided an instructional link right there.

-->

---
# `sasjs add`

- Define a Target
- Client / Secret
- App Location (`appLoc`)

![bg right:68% width:870 ](https://i.imgur.com/SaNVk0N.png)

<!--
To use the CLI the first thing we need to do is add a target.  A target is a configuration object that describes the SAS instance we are connecting to.  Running sasjs add gives a series of prompts - the first is whether the scope should be local or global.  A local scope makes sense when working in a GIT project.  A Global scope is saved to the users home directory, and allows the commands to be used anywhere.

Whenever calling the CLI, for a particular target, the local environment will be scanned first, and then the global.

Next up is Server Type, SAS 9 or Viya.  The choice here determines the questions and defaults provided later.

Target Name is the alias you will give for this particular configuration.

App Location is the default Root location when deploying artefacts to SAS.  If you provide a SAS folder location to any of the SASjs commands without a leading slash, they are assumed to be relative to the appLoc of the target.  If you do provide a leading slash, the appLoc is ignored.

target server URL is the server on which SAS is deployed.  This should include the protocol, the https part, and the port if it is not on the standard port.

For Viya we also need to provide the client ID and the secret, which should be provided by an administrator, with the relevant attributes you have specified.  In order to make requests using this client id, the CLI needs to authenticate to get an authorisation code - to do that just click the link, and copy paste here.  The CLI can then obtain an ACCESS_TOKEN, which will be stored either in the home directory, or in a local .env file.  That file is .git ignored by default in a SASjs project, if you're using it in a different setup make sure your access token is protected.

Finally, and this part is off-screen, you can choose the default compute context in which to run any SAS code you need to run.

-->

---

# `sasjs run`

- `sasjs run code.sas`

![bg right:60% height:450](docs/img/sasjsrun1.png)

<!--
On the topic of running SAS code then, here's how you can do that - just type sasjs run and the path to the sas program you'd like to run.  The log is returned and written to the current directory.

I didn't provide a target in this command, and you can see that it defaulted to the first target instead.

-->

---
# `sasjs folder`

- `sasjs folder create /some/folder -t target`
- `sasjs folder move /some/folder /new/folder`
- `sasjs folder delete /new/folder`

<!--
The sasjs folder command manages folders, currently we have create, move and delete.
The FIRST command here, is explicitly setting the target, as mentioned before, this is optional as otherwise by default the first target will be chosen.
For CREATE, you can also add a force flag if you wish to create AND replace.

-->

---
# `sasjs context`

- `list`
- `export`
- `create`
- `edit`
- `delete`

![bg right:73% height:350](https://i.imgur.com/HSFhOt8.png)


<!--
A context, a compute context, provides the attributes under which a SAS session will start - such as the autoexec, SAS Options, whether it's a pooled server, the system credentials etc.  The screenshot here is taken from a video, which you can find in the documentation.  On the first line we are exporting an _existing_ context to a JSON file.  This is convenient, as it provides the structure for creating a new one.  We do this here by modifying the old one, and running the create command.

After that we edit the context we just created, in this case to rename it.  After that we run the delete command to delete the context.
The list, export and delete actions are standalone, without any input json.

-->

---
# `sasjs create`

- Prepare a SAS project with an opinionated structure
- Structure is documented within `sasjsconfig.json`
- Templates:
    - `sasjs create myapp -t sasonly`
    - `sasjs create myapp -t minimal`
    - `sasjs create myapp -t react`
    - `sasjs create myapp -t angular`


<!--
The commands we have discussed so far are helpful for any SAS Viya project.
The ones we are about to discuss are specifically relevant for apps, and SAS Solutions.
What I have found troublesome about apps I've worked with in the past is that they were all structured in  different ways.  For instance, where the macros are stored, how they are included into Services, where the services go, how they are organised, where the DDL and datalines go, etc etc.

SASjs create provides a template setup, which you can modify, but those modifications are provided via the sasjsconfig JSON file.  That way every developer knows exactly where to go in order to see what is or is not included within a build.

When you create a new project, you provide a name, and an optional template. The SASonly template is just SAS, whereas minimal / react / angular provide templates for the frontend also.
-->

---
# Project Structure

![bg right:71% height:700](https://i.imgur.com/kpRTA1E.png)

<!--
Here we see the project structure for a sasonly template, and there are a few things to note.
The Package JSON files provide details of the third party dependencies, which are physically downloaded and stored in the node_modules folder.  This is standard for NPM web apps.
The SASJS folder contains the sasjsconfig file and folders for build scripts, database files, macros, and web services.  Everything SAS related sits in here, which means it fits nicely within the root of pretty much any standard web project.
It's worth noting again that this is configurable - sasjsconfig works on relative paths, so you can store the SASjs subdirectories elsewhere if needed.  You just need to run the compile, build & deploy steps, which we'll cover next, from either the sasjs folder or it's immediate parent in order for the configuration to be picked up.
-->

---
# `sasjs compile`

- One file per web service
- Service Init + Term
- Relevant macros included

![bg right:50% height:650px](https://cli.sasjs.io/img/sasjscompile.png?_=1)


<!--
After we've added some backend SAS services to our app, we run sasjs compile - this will create a temporary folder called sasjsbuild and create one file for each service to be deployed.  This contains all the relevant precode, including macros and any initialisation and termination code.

At this point you're probably wondering how the CLI knows which macros need to be included.  For that, we take a look at the program headers.
-->

---
# Doxygen Docs

![bg right:72% ](https://i.imgur.com/mIlgZqh.png)

<!--
The headers are primarily used to generate HTML documentation using doxygen.  It's also used within the core library, as you see here, and it's also used within SAS for some risk products.

-->


---
# Doxygen Headers

![bg right:72% ](https://i.imgur.com/8ZYFtLl.png)

<!--
The source code looks like this.  You can provide brief and detailed descriptions, and use markdown for code formatting.  Each macro parameter can also be documented.

The CLI scans the headers, and finds the macros listed underneath the dependencies tag.

The source code is then extracted from the directories specified within the sasjsconfig file.
-->

---
# sasjsbuild directory

![bg right:40% height:700px](https://i.imgur.com/r73fl9W.png)

<!--
To summarise then, the compile step creates one file per service, each of which contains all the dependent macros.  And the big benefit of this approach is that every service is self contained.  There's no filesystem dependency, and each service can be tested fully in isolation.

For apps with dependencies on freeform SAS programs, such as those with datalines, or LUA programs, we've got you covered and will be releasing this feature in the coming weeks.

There's still the problem of deployment though.  An app can have many services, how do we get these into SAS?
-->

---
# `sasjs build`

- Many files to 1 (or 2)
    - SAS program (SAS 9 + Viya)
        - Generated by default
    - JSON file (Viya only)
        - if `deployServicePack:true`

![bg right:40% height:700px](https://cli.sasjs.io/img/sasjsbuild.png)


<!--
first we need a build pack, and that's what sasjs build gives us. There are two possible outputs - the first is a SAS program, that can run in either SAS 9 or Viya, that creates all of the SAS folders and web services.
It also contains any build initialisation logic, such as database or environment setup, and termination logic, such as exporting an SPK or running test scripts.

The second possibility is a JSON file, that can be used to create the services directly using the Viya REST API.

-->

---
# `sasjs deploy`

- Loads JSON if `deployServicePack:true` and `serverType:"SASVIYA`
- Executes `tgtDeployScripts`:
    - SAS Programs remotely
    - Everything else, locally
- Compile, build & deploy in one step:  `sasjs cbd`

![bg right:50% height:700px](https://i.imgur.com/uZ8avwk.png)


<!--
Deploy then, will first deploy the folders and services using the REST APIs if the target is Viya and `deployServicePack` is true.
 After that it executes everything within the `tgtDeployScripts` array- on the server if it's a SAS file, or locally if anything else.  This is where you can add logic for building & deploying your frontend, such as npm run build, and rsync.

On the right is an example of a target configuration which shows how you can set this up.

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
As you've seen there are quite a few commands, and we're still in the process of documenting them all.
If there are any more commands that you know would be helpful, that you'd like to see, just head over to the repo and raise an issue.  If there's community support, we'd be happy to build it in.
-->

---
<!-- header: ![h:6em](https://sasjs.io/img/js-logo700x389.png)-->

# Allan Bowe, Head of SAS Apps


- https://www.linkedin.com/in/allanbowe/
- allan.bowe@analytium.co.uk
- https://github.com/sasjs

<!--
My contact details and the github link are right here, feel free to reach out if you'd like to know more, we'd be happy to arrange a 1 hour workshop or a longer training session for you and your team.

Do widzenia!
-->

