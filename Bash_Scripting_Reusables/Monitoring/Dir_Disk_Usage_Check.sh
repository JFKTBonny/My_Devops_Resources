#!/bin/bash
# This script checks and reports the disk usage of the specified directory.
DIRECTORY="$1"

if [ -z "$DIRECTORY" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

du -sh "$DIRECTORY"