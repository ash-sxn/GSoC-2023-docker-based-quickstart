#!/bin/bash

# Specify the directory of the cloned repository
REPO_DIR="$1"

# Find directories containing a Dockerfile
directories=$(find "$REPO_DIR" -type f -name Dockerfile -exec dirname {} \; | sort -u)

# Loop through the directories and generate the GitHub action block
for dir in $directories; do
  echo "- package-ecosystem: docker"
  echo "  directory: \"$dir\""
  echo "  schedule:"
  echo "    interval: weekly"
  echo "  open-pull-requests-limit: 10"
done