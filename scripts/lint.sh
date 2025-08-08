#!/bin/bash
set -e

echo "Running buf lint..."
buf lint
