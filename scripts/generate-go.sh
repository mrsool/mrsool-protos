#!/bin/bash
set -e

echo "Generating Go code..."

# Create output directory if it doesn't exist
mkdir -p gen/go

# Generate Go code
buf generate --template buf.gen.yaml --path commons --path mrsool_backend --path laas_backend --path dispatcher

echo "Go code generation completed successfully!"