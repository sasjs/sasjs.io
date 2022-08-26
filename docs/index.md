DevOps for SAS Solutions
====================

## SASjs Powers

If you're looking for the following capabilities, then SASjs is for you:

* Build locally, using standard GIT workflows, in your preferred IDE
* Create SAS projects that are agnostic to the "flavour" of SAS 
* Cover your code with isolated TESTs and measure test coverage
* Quality check (lint) your SAS before hitting your GIT repo
* Create apps that deploy in seconds to any SAS environment
* Generate HTML documentation from your SAS program headers
* Eliminate dependency on the server filesystem (SASAUTOS) 
* Make use of PIPELINES to auto-deploy your SAS projects 
* Build apps with SAS, Python, or JS at the backend

## SASjs Components

SASjs is "batteries included" when it comes to building, linting, deploying, testing, and documenting SAS Solutions.

Our tools can be used individually, for specific needs, or together as part of an opinionated framework.

The SASjs framework improves the scalability, velocity, and quality of SAS projects.  

It consists of the following main components:

1. [Macro library](https://github.com/sasjs/core).  A collection of macro based tools for SAS application development.  See [documentation](https://core.sasjs.io).

2. [CLI tool](https://github.com/sasjs/cli).  A command line utility for automating the compilation, build and deployment of your SAS Project.  See [documentation](https://cli.sasjs.io).

3. [VS Code Extension](https://github.com/sasjs/vscode-extension). Linting, Syntax Highlighting and Code Execution on Viya, SAS 9 BI, or SASjs Server

4. [Lint](https://github.com/sasjs/lint). A SAS Code Quality Checking tool.  Rules are configurable.  

5. [Server](https://github.com/sasjs/server).  An open source Web Server on Foundation SAS.

6. [Adapter](https://github.com/sasjs/adapter). Connects client JS to server SAS.  See [documentation](https://adapter.sasjs.io).


Beyond regular Data Science projects, SASjs is also (naturally) a rocket boost for the development of Web Applications on SAS.  Did you know you can deploy a HTML5 App on SAS 9 in just 2 lines of code:

```sas
filename playme url "https://sasjs.io/game";
%inc playme;
```

Below is a demo of building and deploying a HTML5 App on SAS Viya in just one minute:

<iframe width="560" height="315" src="https://www.youtube.com/embed/WwGptgvSqSw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>



<meta name="description" content="SASjs provides DevOps for SAS Solutions across Viya, SAS EBI, and Desktop SAS">
