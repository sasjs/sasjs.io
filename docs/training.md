# Training

Are you looking to build the capability to deploy fresh and inspiring new interfaces into the SAS Platform? Get yourself off on the right foot with a live training package, review the best practices, pitfalls to avoid, and learn all the tips, tooling & techniques for rapid delivery and continuous deployment of SASjs Web Apps.

## Session Types

Training is available either remotely or on-site in the following durations:

- 1 hour - overview of the tooling, available resources, best practices, etc. Configure and deploy a working seed app.

- Half day - Build, deploy and release a functional app, including dependent macros, use of a database, and release notes

- Full day - Design, build, deploy & release a complex multi-user app

## Pre-requisites

- Your own SAS Environment (SAS 9 or Viya).

- A location in the SAS 9 Folder tree or the SAS Viya folders service in which to create services (Stored Processes or Job Execution Services)

- A laptop with a browser, GIT, NPM and VSCodium text editor (or equivalent)

- If the session is a half or a full day, then a library with WRITE access for data storage

- If you are part of a remote workshop, a dual monitor setup is highly recommended

## System Checks

To save time on the day it will help to ensure that you have the above prerequisites. Checks can be made as follows:

### SAS Access

You will need an instance of SAS in order to build the backend! If you are planning to use Viya, you will also need **Admin** rights in order to get the API key. You also need the ability to create services (either Stored Processes on SAS 9 or Job Execution Services on SAS Viya) somewhere in the folder tree. You can check this using SAS Management Console, DI Studio, /SASDrive, or /SASJobExecution.

### GIT

Install git from here: [https://git-scm.com/](https://git-scm.com/). If you do not have admin rights, try this [guide](/guides/windows#git).

### NPM

Node Package Manager (NPM) is a JavaScript framework for managing project dependencies. It also handles installations and a lot of other functionality. It can be downloaded here: [https://nodejs.org/en/download](https://nodejs.org/en/download). If you do not have admin rights, try this [guide](/guides/windows#npm).

### VSCode

You don't necessarily need VSCode but it's a great editor and includes an integrated terminal for running commands. It can be downloaded (without telemetry) from here: [https://vscodium.com/](https://vscodium.com/), and a portable version can be obtained from this [guide](/guides/windows#vscode).

### Final checks

Open VScode, select Terminal -> New Terminal, and submit the following commands:

```
git --version
npm -v
node -v
```

If you get a version number for each of the above, and the version for `node` is above 10.3, you're good to go!
