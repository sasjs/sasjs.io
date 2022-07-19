---
title: VSCode
description: VS Code is the best place to build SAS projects! This page is full of useful tips, extensions, and other applications to help you get the most of this great IDE.
og_image: img/vscode.png
---

VS Code - for SAS
====================

VS Code is the worlds best IDE!  At least, that's our opinion. It's a great IDE and very usable for both SAS and Web development.  When it comes to the download, we actually recommend VSCodium - which is simply VSCode without the telemetry.  

## Extensions

VS Code has many marketplace extensions - these are our favourites:

### SASjs

Using the SASjs extension in the VS Code marketplace you can:

* submit code to SAS (Viya, EBI or Base SAS) and return the log.  This uses the regular global sasjsconfig file, so the tokens generated can be reused between VS Code and the SASjs [CLI](https://cli.sasjs.io).
* [Lint](https://github.com/sasjs/lint) your SAS code (open view/problems to see the results, or CTRL+M)
* Enjoy syntax highlighting

The extension is available both on the [VS Code market place](https://marketplace.visualstudio.com/items?itemName=SASjs.sasjs-for-vscode) and also [open VSX](https://open-vsx.org/extension/sasjs/sasjs-for-vscode) (suitable for VSCodium and Theia).

![snippet](https://user-images.githubusercontent.com/4420615/111216128-4c9f4780-85d4-11eb-8284-189b7efa12b0.gif)

You can also auto-format your SAS code by right-clicking and selecting 'format':

<iframe width="560" height="315" src="https://www.youtube.com/embed/y_81mOz-bC0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

The SASjs VS Code extension is MIT Open Source and free for commercial use.

### Gremlins Tracker

When sharing code from one environment (eg UTF8) to another (eg WLATIN1) you can end up with code that will not run in EG due to the existence of hidden special characters.

This plugin will highlight all the rows containing such 'gremlins'.  A real time saver / problem avoider!

### Draw IO

This extension lets you build diagrams directly in VS Code!  You can save as PNG or SVG, and changes are stored as text so you can track them in GIT.

[https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio](https://marketplace.visualstudio.com/items?itemName=hediet.vscode-drawio)

![](https://i.imgur.com/uBXho4J.png)

### Journal

This is actually two extensions.  The first lets you use VS Code as a task manager and work diary.  The second adds a calendar icon to the left hand side of your IDE so you can easily browse!

* [Journal](https://marketplace.visualstudio.com/items?itemName=Pajoma.vscode-journal)
* [Viewer](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.vscode-journal-view)

## Tips & Tricks

### Keyboard shortcuts

10x your productivity by committing the following to memory:

Shortcut | Result
---|---
CTRL+ALT + up or down arrow| Multiline select with the cursor
CTRL+SHIFT+P| Bring up the command pane

### Gitpod

Instant workspace in the cloud!  Just add "gitpod.io/#" prior to the url, like this:  "gitpod.io/#github.com/sasjs/core".

A great demo of the SASjs CLI is available here: [https://gitpid.io/#github.com/sasjs/template_jobs](https://gitpid.io/#github.com/sasjs/template_jobs).

### Github Viewer

Are you trying to read code on github, but find it cumbersome to navigate each page?

Just add "1s" in the url between "github" and ".com" - like this: "github1s.com/sasjs/core"

And get instant VS Code in the browser!

![sas vscode](img/vscode.png)


