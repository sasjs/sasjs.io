# Viya

SAS Viya is the new kid on the block and the future for the SAS platform. It has a blazingly fast in-memory, scalable architecture and is built with developers in mind.

Here are some relevant tips & tricks to help from an app-development perspective.

## Server Restart

This is necessary after configuring settings such as whitelisting.
Log onto the box as an admin and execute the following commands:

```
sudo /etc/init.d/sas-viya-all-services stop
sudo /etc/init.d/sas-viya-all-services start
```
