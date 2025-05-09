#!/bin/zsh

# Ensure an input file was provided
if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <input.mlir>"
  exit 1
fi

INPUT_FILE=$1
OUTPUT_FILE="transformed.mlir"

echo "Running transformations on $INPUT_FILE..."

# Run mlir-opt with selected passes
mlir-opt "$INPUT_FILE" \
  --linalg-bufferize \
  --convert-linalg-to-loops \
  --linalg-fuse-elementwise-ops \
  --canonicalize \
  -o "$OUTPUT_FILE"

echo "Transformation complete. Output written to $OUTPUT_FILE"
