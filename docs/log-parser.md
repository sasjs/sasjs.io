---
layout: article
title: Log parser
description: You can use this tool to parse SAS Viya logs from JSON to plain text format.
og_image: https://sasjs.io/img/log-parser.png?_=1
---

Log parser
====================

You can use this tool to parse SAS Viya logs from JSON to plain text format.

<style>
  button {
    background: #eeeeee;
    padding: 10px;
    cursor: pointer;
    border-radius: 4px;
  }

  button:hover {
    background: #e6e6e6;
  }

  button:focus {
    outline: none
  }

  textarea {
    padding: 5px;
  }

  pre {
    padding: 5px;
    border: 1px solid #b2b2b2;
    border-radius: 3px;

    overflow: auto;
    max-height: 80vh;
  }

  .md-sidebar--secondary {
    display: none;
  }

  .md-content {
    width: 80% !important;
    max-width: 80% !important;
  }
</style>

<textarea id="log_text" style="width: 100%; height: 200px;" placeholder="Paste log in json format to parse plain text"></textarea>

<button onclick="parseLogLines()" type="button" class="btn btn-primary">Parse log</button>

<div id="result">
  <h2>Plain text log</h2>
  <pre id="log_result" style="padding: 5px;">No log parsed yet.</pre>
</div>

<script>
  const parseLogLines = () => {
    let logText = document.querySelector('#log_text').value
    let logJson = JSON.parse(logText)
    
    let logLines = ''

    for (let item of logJson.items) {
      logLines += `${item.line}\n`
    }

    document.querySelector('#log_result').innerHTML = logLines
    document.querySelector('#log_text').value = ''
  }
</script>