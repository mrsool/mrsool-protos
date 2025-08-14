#!/bin/bash
export PATH="$HOME/.rbenv/shims:$PATH"
set -e

echo "Generating Ruby code..."

# Create output directory if it doesn't exist
mkdir -p gen/ruby

# Generate Ruby code
buf generate --template buf.gen.yaml --path commons --path mrsool_backend --path laas --path dispatcher

echo "Ruby code generation completed successfully!"