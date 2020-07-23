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

    markdown "$MYPROJECT/README.md" > "$BUILDLOC/deploy/README.html"

### MkDocs

Suitable for medium / large projects, this is a great tool for generating a static HTML site where each page can be written in MarkDown.

The Data Controller for SAS® [documentation](https://docs.datacontroller.io) ([source](https://github.com/macropeople/dcdocs.github.io)) is built in this way .


### DoxyGen


[DoxyGen](https://www.doxygen.nl/) is a commandline tool that can generate a number of output formats, similar to Sphinx.  More suitable for documenting code, than generating standalone docs (although it can do that also).

The [Macro Core](https://core.sasjs.io) library is documented this way.

#### Details
This section is for explaining the code, with examples.  Indent by 4 spaces to format content as code.  The following comment style will allow code to be copy pasted without ending the header comment:

```
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

<meta name="description" content="It's said that quality of software is measured by the quality of it's documentation!">