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

## Shared Account and Server re-use

Server pooling and the use of a shared OS account are both possible from Viya 3.5 - the documentation is [here](https://go.documentation.sas.com/?cdcId=calcdc&cdcVersion=3.5&docsetId=calcontexts&docsetTarget=n1hjn8eobk5pyhn1wg3ja0drdl6h.htm&locale=en) (and a communities article is [here](https://communities.sas.com/t5/SAS-Communities-Library/SAS-Viya-3-5-SAS-Studio-and-SAS-Compute-Server-non-functional/ta-p/616617))

## Cookies
As described in this [usage note](http://support.sas.com/kb/65/548.html), since the Google Chrome 80 update in February 2020, you may notice the following error in your log:

^ The request is invalid. This may indicate that the request was not originated by you, or the request time limit was reached. Please retry your action.
