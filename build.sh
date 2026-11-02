#!/bin/bash
# Build the site locally the way CI builds it.
#
#   python -m venv .venv && . .venv/bin/activate
#   pip install -r requirements.txt
#   ./build.sh
#
# The output lands in ./site, which is gitignored.
set -euo pipefail
cd "$(dirname "$0")"

mkdocs build --strict
