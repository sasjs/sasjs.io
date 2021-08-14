---
title: AF Modernisation
description: Modernising legacy SAS AF Applications using the SCL transcoding kit and SASjs
author: Allan Bowe
keywords: sas, viya, af, scl, sasjs
url: https://sasjs.io/slides/af.html
image: https://sasjs.io/img/af_desktop.png

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
  height: 70px;
}
</style>

<!-- header: ![](https://sasjs.io/img/sas-apps.png)-->


# Modernising SAS AF<!--fit-->
## Allan Bowe


![bg right:40% height:400](https://sasjs.io/img/af1.png)


---
<!-- header: ![](https://sasjs.io/img/sas-apps.png) Desktop -->

![](https://sasjs.io/img/af_before.png)

---
<!-- header: ![](https://sasjs.io/img/sas-apps.png) Cloud -->

![](https://sasjs.io/img/af_after.png)

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

![bg height:500](https://sasjs.io/img/af_desktop.png)

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
- ✅ Scalability
- ✅ Support

---
<!--
header: ![](https://sasjs.io/img/sas-apps.png) Modernisation Process
-->


<table style="padding:50px; width: 100%;">
<tr style="text-align:center; font-weight:bold">
  <td>R, Python, Java, Node JS, Ruby </td><td>SAS </td>
</tr>
<tr><td><ul>
  <li>Significant migration cost </li>
  <li>Additional Environment</li>
  <li>Additional Language</li>
</ul>
</td><td>
<ul>
  <li>Rapid migration </li>
  <li>Existing SAS Environment</li>
  <li>Existing SAS team</li>
</ul>
</td></tr></table>

---
<!--
header: ![](https://sasjs.io/img/sas-apps.png) Modernisation Process
-->


<table style="padding:50px">
<tr style="text-align:center; font-weight:bold">
  <td>Frontend</td><td>Backend</td>
</tr>
<tr><td><ul><li>Frame Elimination
  <ul><li>Fresh UI based on existing app</li></ul> </li>
<li>Use of Open Source Frameworks
  <ul><li>React </li><li>Angular</li></ul>
</li>
<li> Decoupled from SAS Backend </li>
</ul>
</td><td>
<ul>
  <li>SCL elimination
    <ul><li>SAS Web Services (STP / JES)</li>
    <li>SCL Transcoding</li>
    </ul>
  </li>
  <li>Catalog elimination
    <ul><li>SLISTs -> Database</li>
    <li>Code -> Source Control</li>
    </ul>
  </li>
  <li>Filesystem elimination</li>
  <ul><li>SASjs approach</li><ul>
</ul>
</td></tr></table>

<!-- TRANSCRIPT
Fresh UI - existing frames discarded
Open Source = lower maintenance
SCL elimination -
-->


---
<!-- header: ![](https://sasjs.io/img/sas-apps.png) SASjs Approach -->

# Benefits

- Clean separation of Frontend from Backend
  - ✅ SAS manages data requests only
- Platform Agnostic
  - ✅ Deploy seamlessly to Viya, SAS 9 or Foundation SAS
- Framework-Centric
  - ✅ Opinionated approach to project setup

<img style="position: absolute; right:50px; top:150px; width:22%" src="https://sasjs.io/img/buildapps240x400.png" />

---
<!-- header: ![](https://sasjs.io/img/sas-apps.png) SASjs -->

# What is SASjs?

An open-source DevOps Framework for SAS App Development.  Key components:

- [@sasjs/core](https://github.com/sasjs/core) - Macro library
- [@sasjs/adapter](https://github.com/sasjs/adapter) - SAS Server Connectivity
- [@sasjs/cli](https://github.com/sasjs/cli) - CI/CD and DevOps

Plus a selection of [Seed App projects](https://github.com/topics/sasjs-app) and Integration tooling (such as a [VS Code Extension](https://marketplace.visualstudio.com/items?itemName=SASjs.sasjs-for-vscode)) to enhance and improve the Developer Experience.

---

<div >
 <h1>GIT-Native<h1>
<img src="https://i.imgur.com/gIYp5OG.png"
  style="position: absolute; right:150px;bottom: 100px; width:63%">
</img>
</div>


---
# 20+ CLI Commands

- `sasjs test` -> Execute self contained tests for Web Services & Macros
- `sasjs doc` -> Generate developer documentation from program headers
- `sasjs lint` -> Enforce code quality rules

Online Docs:  https://cli.sasjs.io

---

<!-- header: ![](https://sasjs.io/img/sas-apps.png) SAS Apps Team -->


## Why Partner with the SAS Apps Team

- Extensive experience building & migrating SAS Apps
  - Both Front and Backend
- Maintainers of the SASjs framework
- Project accelerators
  - AF/SCL Transcoding Kit
  - Portfolio of existing SAS Apps

---
# Further Resouces

 - SAS Apps [blog post](https://sasapps.io/modernising-legacy-sas-scl-af-applications)
 - Easy AF [article](https://www.linkedin.com/pulse/easy-af-scl-modernisation-html5-sas-allan-bowe/)
 - UK Forum SCL [presentation](https://drive.google.com/file/d/1RMLxFccaXYh35IGnbcFjISFmZUIdetUO/view)


