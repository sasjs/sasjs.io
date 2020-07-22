<!-- this has to be in the root folder as it is linked from an sgf2020 paper -->
Windows
====================

The reality for many SAS developers is that they are working in locked down windows machines without admin rights.  This causes problems when trying to install basic tooling such as GIT or NPM.

The correct approach in such circumstances is to simply make a request for these apps to be installed, so that you can be enabled to create amazing, supportable, maintainable web applications for your end users.

The alternative is to use portable versions that do not require admin privileges to execute.

VSCode
---------------------

VSCode is a powerful editor that includes a commandline that will run both CMD and POWERSHELL.  The portable version is here:  [https://github.com/garethflowers/vscode-portable](https://github.com/garethflowers/vscode-portable)

NPM
---------------------
Node Package Manager is an essential piece of kit, as it allows the dependencies of your project to be installed in a reproduceable manner.  A guide to installing NPM without admin rights is available here:  [https://theshravan.net/blog/how-to-use-node-and-npm-without-installation-or-admin-rights/](https://theshravan.net/blog/how-to-use-node-and-npm-without-installation-or-admin-rights/)

GIT
---------------------

A portable version of GIT can be installed directly from github here: [https://github.com/git-for-windows/git/releases](https://github.com/git-for-windows/git/releases).

Download the portable `.exe` file from the releases page and unzip it to a location in your filesystem.

Inside the unzipped folder will be a folder called `cmd`. This contains the `git.exe` file.  There is also a `usr/bin` folder - which contains `ssh-keygen.exe`.

Add both of these locations to the PATH environment variable for your windows account, as per below.

![adding path in windows](/img/windowspath.png)

Be sure to hit OK twice for the change to be saved!  You can now open a **new** shell window and create your SSH key using the `ssh-keygen` command.


CMDer
---------------------

This comes prebundled with GIT, allows a number of unix commands, and enables a remote (cloud) config, worth checking out:  https://cmder.net/

<meta name="description" content="Windows specific tips when setting up an environment for building Web Apps on SAS">