#!/usr/bin/env bash
set -euo pipefail
NAME=${1:-fischchain}
KEY=${KEY:-localkey}
avalanche network start || true
avalanche blockchain deploy "$NAME" --local --key "$KEY"