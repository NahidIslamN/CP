#!/usr/bin/env bash
set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
INPUT="$DIR/input.txt"
OUTPUT="$DIR/output.txt"

if [ $# -lt 1 ]; then
  echo "Usage: $0 <source.cpp> [compiler-args]" >&2
  exit 2
fi

SRC="$1"
shift
BIN="/tmp/run_exec_$(basename "$SRC" .cpp)"

echo "Compiling $SRC..."
g++ -std=c++17 -O2 -pipe -Wall -Wextra -o "$BIN" "$SRC" "$@"

echo "Running with input: $INPUT -> output: $OUTPUT"
if [ -f "$INPUT" ]; then
  "$BIN" < "$INPUT" > "$OUTPUT"
else
  echo "Input file not found: $INPUT" >&2
  "$BIN" "$@" 2>&1 | tee "$OUTPUT"
fi

echo "Done. Output written to $OUTPUT"
