# Windows

The reality for many SAS developers is that they are working in locked down windows machines without admin rights.  This causes problems when trying to install basic tooling such as GIT or NPM.

The correct approach in such circumstances is to simply make a request for GIT and NPM so that you can be enabled to create amazing, supportable, maintainable web applications for your end users.

The workaround is to use portable versions that do not require admin privileges to execute.


# GIT

A portable version of GIT can be installed directly from github [here](https://github.com/git-for-windows/git/releases).

Download the portable `.exe` file from the releases page and unzip it to a location in your filesystem.

Inside the unzipped folder will be a folder called `cmd`. This contains the `git.exe` file.  There is also a `usr/bin` folder - which contains `ssh-keygen.exe`.

Add both of these locations to the PATH environment variable for your windows account, as per below.

![adding path in windows](/img/windowspath.png)

Be sure to hit OK twice for the change to be saved!  You can now open a **new** shell window and create your SSH key using the `ssh-keygen` command.
