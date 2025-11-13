#!/usr/bin/env bash
set -euo pipefail
NAME=${1:-fischchain}
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/chain/$NAME"
DEST="$HOME/.avalanche-cli/subnets/$NAME"
mkdir -p "$DEST"
cp -v "$SRC"/*.json "$DEST"/
echo "Configs copied to $DEST"