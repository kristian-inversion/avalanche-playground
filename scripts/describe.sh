#!/usr/bin/env bash
set -euo pipefail
NAME=${1:-fischchain}
avalanche blockchain describe "$NAME" --fuji || avalanche blockchain describe "$NAME"