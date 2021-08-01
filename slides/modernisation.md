---
marp: true
paginate: true
backgroundColor: white
theme: default

---
<!-- header: ![h:6em align:right](https://sasjs.io/img/js-logo700x389.png) -->


# Modernising SAS Apps
## Allan Bowe


![bg right:33% height:100  ](https://imgur.com/mA2yrD4.png)
![bg right:33% height:100](/img/sas-apps.png)

---
<!-- header: ![h:4em](https://sasjs.io/img/js-logo700x389.png)-->


# Traditional SAS Apps

- AF / SCL
- SAS/IntrNet
- SAS Stored Process Web Apps

---

# Traditional Approach

- Write SAS code to generate JS/HTML
  - ❌ (Very) high cost of maintenance
- Tied to a specific "flavour" of SAS
  - ❌ Difficult to migrate
- Coding Style inherited from original developer
  - ❌ On-boarding costs

---

# SASjs Approach

- Clean separation of Frontend from Backend
  - ✅ SAS manages data requests only
- Platform Agnostic
  - ✅ Can be deployed seamlessly to Viya, SAS 9 or Foundation SAS
- Framework-Centric
  - ✅ Industry-standard approach to project setup


---

## What is SASjs?
An open-source DevOps Framework for SAS App Development.  Key components:

- [@sasjs/core](https://github.com/sasjs/core) - Macro library
- [@sasjs/adapter](https://github.com/sasjs/adapter) - SAS Server Connectivity
- [@sasjs/cli](https://github.com/sasjs/cli) - CI/CD and DevOps

Plus a selection of [Seed App projects](https://github.com/topics/sasjs-app) and Integration tooling (such as a [VS Code Extension](https://marketplace.visualstudio.com/items?itemName=SASjs.sasjs-for-vscode)) to enhance and improve the Developer Experience.

---

## &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SASjs - a GIT-Native Workflow
![height:550 ](https://i.imgur.com/gIYp5OG.png)

---

## Additional Technical Benefits

- `sasjs test` -> Execute self contained tests for Web Services & Macros
- `sasjs doc` -> Generate developer documentation from program headers
- `sasjs lint` -> Enforce code quality rules

Online Docs:  https://cli.sasjs.io

---

## Overall Business Benefits

- De-risk

---


# demo <!-- fit -->

