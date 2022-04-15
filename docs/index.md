DevOps for SAS Solutions
====================

SASjs is "batteries included" when it comes to building, linting, deploying, testing, and documenting SAS Solutions.

Our tools can be used individually, for specific needs, or together as part of an opinionated framework.

The SASjs framework aims to improve the scalability and velocity of SAS projects.  

It consists of the following main components:

1. [Macro library](https://github.com/sasjs/core).  A collection of macro based tools for SAS application development.  See [documentation](https://core.sasjs.io).

2. [CLI tool](https://github.com/sasjs/cli).  A command line utility for automating the compilation, build and deployment of your SAS Project.  See [documentation](https://cli.sasjs.io).

3. [VS Code Extension](https://github.com/sasjs/vscode-extension). Linting, Syntax Highlighting and Code Execution on Viya, SAS 9 BI, or SASjs Server

4. [Lint](https://github.com/sasjs/lint). A SAS Code Quality Checking tool.  Rules are configurable.  

5. [SASjs Server](https://github.com/sasjs/server).  An open source Web Server on Foundation SAS.

6. Data [Adapter](https://github.com/sasjs/adapter). A JavaScript library to handle the communication between your HTML5 or client application and the SAS 9 or Viya backend.  See [documentation](https://adapter.sasjs.io).


Beyond regular Data Science projects, SASjs is also (naturally) a rocket boost for the development of Web Applications on SAS.  Did you know you can deploy a HTML5 App on SAS 9 in just 2 lines of code:

```sas
filename playme url "https://sasjs.io/game";
%inc playme;
```

Below is a demo of building and deploying a HTML5 App on SAS Viya in just one minute:

<iframe width="560" height="315" src="https://www.youtube.com/embed/WwGptgvSqSw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>



<meta name="description" content="SASjs provides DevOps for SAS Solutions across Viya, SAS EBI, and Desktop SAS">
