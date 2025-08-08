#!/bin/bash
set -e

echo "Running breaking change detection..."

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Warning: Not in a git repository. Skipping breaking change detection."
    exit 0
fi

# Check if main branch exists
if git rev-parse --verify main > /dev/null 2>&1; then
    buf breaking --against '.git#branch=main'
else
    echo "Warning: main branch not found. Skipping breaking change detection."
    exit 0
fi