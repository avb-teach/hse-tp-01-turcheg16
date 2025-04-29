#!/usr/bin/env bash
set -euo pipefail
if [[ "$#" -lt 2 ]]; then
  echo "Usage: $0 INPUT_DIR OUTPUT_DIR" >&2
  exit 1
fi
if ! command -v g++ >/dev/null 2>&1; then
  apt-get update -qq
  apt-get install -y --no-install-recommends g++
fi
DIR="$(dirname "$0")"
SRC="$DIR/collect_files.cpp"
BIN="$DIR/cf"
g++ -std=c++17 -O2 "$SRC" -o "$BIN"
"$BIN" "$@"
