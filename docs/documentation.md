Documentation
====================

It's said that quality of software is measured by the quality of it's documentation!

## Guides

As a minimum, the following guides should be produced for each app:

* User Guide
* Configuration Guide
* Deployment Guide
* Developer Guide

## Building Documentation

Whilst the concept of "word documents on sharepoint sites" is still etched into the skulls of many, there are alternatives available if your firewalls allow.  Whilst proprietary office formats and rich text editors are user friendly, they don't fit easily and transparently into source control and continuous integration workflows.

The primary Text Based markup options are MarkDown (md) and reStructuredText (rst).  Markdown is easier to learn, whilst RST format is more flexible (can generate PDFs and also provide documentation within code files).

### README

Suitable for small projects, all four guides could be added to a single README file in the root of your repo.  Using a tool such as [markdown-to-html](https://www.npmjs.com/package/markdown-to-html) you can even convert your README into a nicely formatted HTML page as part of your build process.

```Bash
    markdown "$MYPROJECT/README.md" > "$BUILDLOC/deploy/README.html"
```

### MkDocs

This is a great tool for generating a static HTML site where each page can be easily written using MarkDown.  This page you are reading was built with MkDocs, as well as the documentation site for [Data Controller](https://docs.datacontroller.io). 

If you want to format your SAS code inside MkDocs, make sure you are using the most recent version (1+) and add the following to your mkdocs.yml file:

```yaml
theme:
  name: canBeAnything-UseExistingOneIfThere
  highlightjs: true
  hljs_languages:
      - SAS
```


Then when you are writing code, just put `sas` on the first line of the code block, eg:
```
  ```sas
  data some sas;
    set formatted nicely;
  run;
  ```
```
You can display in any one of [189 different languages](https://highlightjs.org/static/demo/) this way.

!!! note "Contributions Welcome"
    With an MkDoks site like this, you can click on any section in the mkdocs site and make edits directly in github.  If you find any broken links or typos, or would like to add more sections this site - go right ahead!  Your change will be submitted as a PR.

!!! tip "Doc Tip"
    You can even make tips like this!  Read on

To create a "tip" like you see above, or the "note" above it, you first need to enable the extension in your `mkdocs.yml` like so:

```yaml
markdown_extensions:
  - admonition
```

Then you can write syntax like follows:

```plaintext
!!! note "note title"
   This is a note
!!! warning "warning title"
   This is a warning
!!! error "error title"
   This is an error
!!! tip "tip title"
   This is a tip
```


### DoxyGen


[DoxyGen](https://www.doxygen.nl/) is a commandline tool that can generate a number of output formats, similar to Sphinx.  More suitable for documenting code, than generating standalone docs (although it can do that also).

The [Macro Core](https://core.sasjs.io) library is documented this way.  The following is an example from the [mv_webout()](https://core.sasjs.io/mv__webout_8sas.html) macro:

```sas
 /**
   @file mv_webout.sas
   @brief Send data to/from the SAS Viya Job Execution Service
   @details This macro should be added to the start of each Job Execution
   Service, **immediately** followed by a call to:
 
         %mv_webout(FETCH)
 
     This will read all the input data and create same-named SAS datasets in the
     WORK library.  You can then insert your code, and send data back using the
     following syntax:
 
         data some datasets; * make some data ;
         retain some columns;
         run;
 
         %mv_webout(OPEN)
         %mv_webout(ARR,some)  * Array format, fast, suitable for large tables ;
         %mv_webout(OBJ,datasets) * Object format, easier to work with ;
         %mv_webout(CLOSE)
 
 
   @param action Either OPEN, ARR, OBJ or CLOSE
   @param ds The dataset to send back to the frontend
   @param _webout= fileref for returning the json
   @param fref= temp fref
   @param dslabel= value to use instead of the real name for sending to JSON
   @param fmt= change to N to strip formats from output
 
   <h4> Dependencies </h4>
   @li mp_jsonout.sas
   @li mf_getuser.sas
 
   @version Viya 3.3
   @author Allan Bowe
 
 **/
```

 Notice the following:
 
  * file - filename
  * brief - a title for the file
  * details - a long description, HTML can be embedded.  Indent by 4 spaces to format content as code.  
  * param - a description of each parameter.  Keyword parameters have an `=` suffix.
  * dependencies - not part of the doxygen spec but used by the [sasjs-cli](/sasjs-cli) to compile macro calls so that each service contains all relevant macros (and no extra macros)
  * version - used in the [macrocore](/sasjs-core) library to denote the earliest known version in which the code will run


```sas
/**
  @details this is my detailed explanation.
  This part is indented 2 spaces.

      %* this is a SAS comment, note the style - avoids the header being closed;
      %* it is indented 6 spaces (4 spaces from previous non code line);
**/
```

### Sphinx

Primarily used for writing in `rst` format, [sphinx](https://www.sphinx-doc.org/en/master/index.html) is a very powerful documentation builder, built in python and used for all the official python documentation.  The founder of this language went on to launch [readthedocs.org](https://readthedocs.org) a hosting platform for Sphinx-built sites.


Some useful resources:

* Getting started [video](https://docs.readthedocs.io/en/stable/intro/getting-started-with-sphinx.html)
* Online RST renderer: [https://rst.ninjs.org](https://rst.ninjs.org/)
* RST Table [generator](https://www.tablesgenerator.com/text_tables)
* Cheatsheet: [https://thomas-cokelaer.info/tutorials/sphinx/rest_syntax.html](https://thomas-cokelaer.info/tutorials/sphinx/rest_syntax.html)


### TypeDoc

The good thing about using typescript to build your frontend is that it can auto-generate a lot of documentation as types etc can be inferred from the syntax.  The SASjs library is documented this way - [adapter.sasjs.io](https://adapter.sasjs.io).

More info available [here](https://typedoc.org/).

<meta name="description" content="Be like SAS - write great documentation to keep users, administrators, and future SAS developers happy!">