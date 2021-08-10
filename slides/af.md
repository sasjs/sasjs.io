---
marp: true
paginate: true
backgroundColor: white
theme: default

---
<style >
section {
  padding: 50px;
}
header{
  position: absolute;
  right: 50px;
  font-size: 60px;
  text-align: right;
  font-weight: bold;
  color: navy
}
header img{
  position: absolute;
  padding-top: 10px;
  left: 0px;
  height: 80px;
}
</style>

<!-- header: ![](https://sasjs.io/img/sas-apps.png)-->


# Modernising SAS AF<!--fit-->
## Allan Bowe


![bg right:40% height:400](https://sasjs.io/img/af1.png)

---
<!-- header: ![](https://sasjs.io/img/sas-apps.png)-->


# AF/SCL - Benefits

![bg right:50% height:550](https://sasjs.io/img/af2.png)

- Fast
- Flexible
- Robust

<!-- TRANSCRIPT
Fast to build as point & click
Flexible due to filesystem access
Robust vendor support, has lasted decades
-->

---
<!-- header: ![](https://sasjs.io/img/sas-apps.png) AF/SCL Architecture -->

- ❌ Security
- ❌ Scalability
- ❌ Support

![bg height:530](https://sasjs.io/img/af_desktop.png)

<!-- TRANSCRIPT
Everything under end user credentials
Desktop deployments
software itself going out of support, hard to find devs
-->

---
<!--
header: ![](https://sasjs.io/img/sas-apps.png) Web Architecture
-->

<img src="https://sasjs.io/img/af_cloud_trans.png"
  style="position: absolute;right:0px;top:200px;width:70%">
</img>

- ✅ Security
  - SASLogon
- ✅ Scalability
  - Zero deployment
  footprint
- ✅ Support
  - Modern development
  approach



---
<!-- header: ![](https://sasjs.io/img/sas-apps.png) Frontend vs Backend -->

![bg height:500](https://sasjs.io/img/af_split.png)




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

## &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SASjs - a GIT-Native Workflow <!--fit-->
![height:520 ](https://i.imgur.com/gIYp5OG.png)

---

## Additional Technical Benefits

- `sasjs test` -> Execute self contained tests for Web Services & Macros
- `sasjs doc` -> Generate developer documentation from program headers
- `sasjs lint` -> Enforce code quality rules

Online Docs:  https://cli.sasjs.io

---

## Why Partner with the SAS Apps Team

- Extensive experience building & migrating SAS Apps
  - Both Front and Backend
- Maintainers of the SASjs framework
  - We can make official adaptations to fit client needs
- Project accelerators
  - AF/SCL Transcoding Kit
  - Portfolio of existing SAS Apps

---
# Further Resouces

- https://sasapps.io
- https://sasjs.io/resources
- https://slides.com/allanbowe/sasaf

