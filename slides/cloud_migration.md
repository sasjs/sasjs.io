---
title: Cloud Migration
description: Migrating data from a desktop environment to SAS cloud
author: Allan Bowe
keywords: sas, viya, sasjs
url: https://sasjs.io/slides/cloud_migration.html
image: https://sasjs.io/img/sas-apps.png

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


# Cloud Migration<!--fit-->
## Allan Bowe


![bg right:40% height:400](https://mysasteam.co.uk/wp-content/uploads/2021/04/SAS-Cloud-Migration-1.jpg)


---
<!-- header: ![](https://sasjs.io/img/sas-apps.png) -->

# Cloud Considerations

- Encoding
- Data Management
- IDEs
![bg right:40% height:400](https://mysasteam.co.uk/wp-content/uploads/2021/05/Pitfalls-of-Cloudification_mysasteam_1200.jpg)

---
<!-- header: ![](https://sasjs.io/img/sas-apps.png) Encoding -->

# WLATIN1 to UTF-8

- Datasets
- Program encoding
- Code Compatibility

<!-- TRANSCRIPT
wlatin1 default in sas9
code files - avoid invisibles
functions - x commands k equivalents
-->
---
<!-- header: ![](https://sasjs.io/img/sas-apps.png) Encoding -->
<style scoped>
table {
  padding: 10px;
  margin-left: 250px;
  margin-top: 60px;
  font-size: 110%;
}
th{
  font-size: 120%;
}
td {
  padding:10px;
  text-align: center;
}
</style>

|Regular Function | K Function|
|---|---|
| length | <b>k</b>length |
| substr | <b>k</b>substr |
| compress | <b>k</b>compress |
| reverse | <b>k</b>reverse |
| translate | <b>k</b>translate |
| truncate | <b>k</b>truncate |
| left | <b>k</b>left |

---
<!-- header: ![](https://sasjs.io/img/sas-apps.png)  Data -->


# Data Storage

- Storage Options
- Data Latency
- Central data

<!-- TRANSCRIPT
Storage - parquet / BLOB storage
SSD / different speeds
RBAC - role based access controls
-->

---
<!-- header: ![](https://sasjs.io/img/sas-apps.png)  IDE -->

<style scoped>
table {
  padding: 30px;
  margin-left: 160px;
  font-size: 120%;
}
th{
  font-size: 140%;
}
td {
  padding:20px;
  text-align: center;
}
</style>
# Integrated Development Environment

|Desktop | Cloud|
|---|---|
| Base SAS | Visual Studio Code |
| Enterprise Guide | SAS Studio |

<!-- TRANSCRIPT
2 sentences to differentiate VS Code vs SAS STudio
switch to a live example!
demonstrate things like - differences in filepaths

finish with benefits of browser based / cloud solutions
whilst there is effort in migration, you end up with a better situation

* maintainability
* deployments
* governance
* future proofing
* language of choice

-->

---
<!-- header: ![](https://sasjs.io/img/sas-apps.png) Wrapup -->
# Further Resouces

 - [Accelerate your SAS migration](https://mysasteam.co.uk/accelerating-your-sas-migration/)
 - [Pitfalls of Cloudification](https://mysasteam.co.uk/pitfalls-of-cloudification-and-what-they-dont-tell-you-about-sas-cloud-migration/)
 - [Demystifying SAS Cloud Migration](https://mysasteam.co.uk/demystifying-sas-cloud-migration/)


