---
marp: true
theme: default
paginate: true
<!--
npx @marp-team/marp-cli slides.md ./theme/slides.html
-->

---
<!-- header: ![h:5em](https://sasjs.io/img/js-logo700x389.png)-->

# DevOps with SASjs
## Allan Bowe

![bg right:33% height:250 ](https://datacontroller.io/wp-content/uploads/2020/10/abow.png)

<!-- TRANSCRIPT
Hello, my name's Allan Bowe, I've been a SAS App developer for.. a number of years, and in this session we're going to do a bit of a deep dive into automated deployments using the SASjs CLI.
-->


---

# Why Choose SASjs?

- Open Source (MIT)
- Cross Platform (Base SAS, SAS 9, Viya)
- Active Development & Support

---

# Why Use SASjs?

- Git-Native SAS Projects
  - compile & build _locally_
  - deploy & execute _remotely_
- Self-Documenting
- Test Driven Development


---
# Where to use SASjs?

- VS Code / local IDE
- Jenkins / scheduling systems
- Bitbucket / Gitlab Pipelines, Github Actions
- GIT Hooks
- Web Apps
- Data Engineering / Data Science projects

---
# SASjs Framework

- [@sasjs/core](https://github.com/sasjs/core) - Macro library
- [@sasjs/adapter](https://github.com/sasjs/adapter) - SAS Server Connectivity
- [@sasjs/cli](https://github.com/sasjs/cli) - CI/CD and Automated Deployment


---
# SASjs Core

- ~150 macros geared towards Application Development
- Functions, Procedures, Metadata, Viya
- `npm install @sasjs/core`

![bg right:50% height:700](https://i.imgur.com/K43rKHb.png)

---
# SASjs Adapter

- Authentication
- Bidirectional communication with SAS
- `npm install @sasjs/adapter`

---
# SASjs CLI

- Opinionated Project Setup
- DevOps
- `npm install --global @sasjs/cli`

---
# `sasjs add`

- Define a Target
- Client / Secret
- App Location (`appLoc`)

![bg right:68% width:870 ](https://i.imgur.com/SaNVk0N.png)


---

# `sasjs run`

- `sasjs run code.sas`

![bg right:60% height:450](https://sasjs.io/img/sasjsrun1.png)


---
# `sasjs context`

- `list`
- `export`
- `create`
- `edit`
- `delete`

![bg right:73% height:350](https://i.imgur.com/HSFhOt8.png)



---
# `sasjs create`

- Prepare a SAS project with an opinionated structure
- Structure is documented within `sasjsconfig.json`
- Templates:
    - `sasjs create myapp -t jobs`
    - `sasjs create myapp -t minimal`
    - `sasjs create myapp -t react`
    - `sasjs create myapp -t angular`

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

visit github, sasjs.io, cli.sasjs.io, core.sasjs.io, adapter.sasjs.io
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

