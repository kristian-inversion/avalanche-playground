#!/usr/bin/env bash
set -euo pipefail
NAME=${1:-fischchain}
KEY=${KEY:-myfuji}
avalanche blockchain deploy "$NAME" --fuji --key "$KEY"