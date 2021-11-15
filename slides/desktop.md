---
marp: true
theme: default
paginate: true

<!--
npx @marp-team/marp-cli desktop.md -o ./theme/slides/dektop.html
-->

---
<!-- header: ![h:6em](https://sasjs.io/img/js-logo700x389.png)-->

# SASjs - DevOps & AppDev on Desktop SAS
## Allan Bowe

![bg right:33% height:250 ](https://datacontroller.io/wp-content/uploads/2020/10/abow.png)

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
# Why SASjs

 - Fully Open Source (MIT)
 - Backed by Analytium
 - Build on one platform, deploy to three

---
# The SAS in SASjs
 - SAS Viya (Job Execution Service)
 - SAS 9 EBI (Stored Process Server)
 - Base SAS (SASjs Server)

---
# The JS in SASjs

 - TypeScript
 - NodeJS
 - NPM (Node Package Manager)

---

# HTML5 App Architecture

![bg right:65% height:370 ](https://sasjs.io/img/architecture.png)


---
# SASjs Framework - Main Components

- @sasjs/core - Macro library
- @sasjs/adapter - Connectivity
- @sasjs/cli - CI/CD and Automated Deployment

---

# SASjs [Core](https://core.sasjs.io)

- Make Services, Folders, Groups & more
- Base SAS, Metadata, Viya
- `npm install @sasjs/core`

---
# SASjs [Adapter](https://adapter.sasjs.io)

- Authentication
- Bidirectional communication with SAS
- `npm install @sasjs/adapter`

---
# SASjs [CLI](https://cli.sasjs.io)

- Project Setup
- Automated Deployments
- `npm install --global @sasjs/cli`

<!--
* create project
* compile project
* documentation

* deploy/tests/jobs/flows/ lint

-->

---
# SASjs Framework - Extra Stuff

- @sasjs/lint - code quality
- @sasjs/vscode - Extension for Visual Studio Code (IDE)
- @sasjs/server - API interface to Desktop SAS

---
# SASjs [lint](https://github.com/sasjs/lint)

- Code Quality
- GIT Hooks / CI CD
- Packaged with both CLI and VS Code extension

---
# SASjs [vscode](https://marketplace.visualstudio.com/items?itemName=SASjs.sasjs-for-vscode)

- Syntax Highlighting
- Error Checking
- To install: search 'SASjs' in Extensions

---
# SASjs [server](https://github.com/sasjs/server)

- API for Base SAS
- Available in "Desktop" and "Server" mode
- Compatible with sasjs/adapter, sasjs/core and sasjs/cli

---
<!-- header: ![h:6em](https://sasjs.io/img/js-logo700x389.png)-->

# Allan Bowe, Head of SAS Apps

- allan.bowe@analytium.co.uk
- https://www.linkedin.com/in/allanbowe/
- https://github.com/sasjs

