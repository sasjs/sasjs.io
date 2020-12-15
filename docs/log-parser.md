Log parser
====================

You can use this tool to parse the SAS log that is in JSON format. Result is plain text.

<link rel="stylesheet" href="https://unpkg.com/@clr/ui/clr-ui.min.css" />

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

    let logResult = document.querySelector('#log_result').innerHTML = logLines
  }
</script>