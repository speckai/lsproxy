#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Build the application using the build Dockerfile
docker build -t lsp-box-builder -f dockerfiles/build lsproxy

# Run the builder container to create the binary
if ! docker run --rm -v "$(pwd)/lsproxy":/usr/src/app lsp-box-builder; then
    echo "Build failed. Exiting."
    exit 1
fi
