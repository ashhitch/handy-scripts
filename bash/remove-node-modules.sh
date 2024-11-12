#!/bin/bash

# Directory to search (modify this to point to your projects directory)
PROJECTS_DIR="$HOME/Projects"

# Find and remove all node_modules folders
find "$PROJECTS_DIR" -type d -name "node_modules" | while read -r dir; do
  echo "Removing: $dir"
  rm -rf "$dir"
done

echo "All node_modules folders have been removed."