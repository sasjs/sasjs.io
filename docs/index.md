# Building Web Applications using SAS®


Whilst SAS gives you the Power to Know, HTML5 gives you the Power to Show!  It's a powerful combination for automating workflows, surfacing analytics, and building breathtaking user experiences.

It's fast, it's easy, and it's fun!

You can build an app on SAS9 in just 2 lines of code:

```
filename playme url "https://sasjs.io/game";
%inc playme;
```

Below is a demo of building and deploying a React App on SAS Viya, with two services in just 5 minutes:

<iframe width="560" height="315" src="https://www.youtube.com/embed/vSNBea_M8yU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


# Minimum Requirements

To build apps on SAS you need SAS Viya, or SAS 9 with Stored Process Server.  

**You cannot create web apps on SAS with University Edition.**

To check if you have SAS Viya, open SAS Studio, click your user profile and click "About".

If you are using Enterprise Guide, then simply run:

```
data _null_;
  length url $128;
  rc=METADATA_GETURI("Stored Process Web App",url);
  putlog 'Your SAS 9 url is: ' url;
run;
```
