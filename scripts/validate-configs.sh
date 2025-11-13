#!/usr/bin/env bash
set -euo pipefail
for f in chain/*/*.json; do
  echo "Validating $f"
  jq type "$f" >/dev/null
done