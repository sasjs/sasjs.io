#!/usr/bin/env bash
#
# Renders every deck in slides/ to HTML, and keeps the URLs that older name
# changes published working.
#
#   ./scripts/build-slides.sh [output-dir]     # default: site
#
# Called by both workflows, so a pull request finds a broken deck before the push
# to master does. `npm ci` must have run first: marp-cli is pinned in
# package.json and package-lock.json carries the integrity hashes of what it
# installs.
set -euo pipefail

cd "$(dirname "$0")/.."
out="${1:-site}/slides"
mkdir -p "$out"

shopt -s nullglob
for deck in slides/*.md; do
  name="$(basename "$deck" .md)"
  echo "rendering $deck -> $out/$name.html"
  npx --no-install marp "$deck" -o "$out/$name.html" --no-sandbox
done

# Two decks have been published under more than one name. A redirect page keeps
# an old link working rather than 404ing somebody's slide reference.
alias_deck() {
  local from="$1" to="$2"
  cat > "$out/$from" <<HTML
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Redirecting</title>
<link rel="canonical" href="$to">
<meta http-equiv="refresh" content="0; url=$to">
</head>
<body>
<p>This deck moved to <a href="$to">$to</a>.</p>
</body>
</html>
HTML
  echo "alias $out/$from -> $to"
}

alias_deck appdev.html slides6min.html
alias_deck geeks.html slidesgeeks.html
alias_deck rapidapps.html slides30min.html
