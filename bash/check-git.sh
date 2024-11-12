#!/bin/bash

# Directory to search (modify this to point to your projects directory)
PROJECTS_DIR="$HOME/Projects"

# Go through each subdirectory and check for uncommitted changes
find "$PROJECTS_DIR" -type d -name ".git" | while read -r git_dir; do
  repo_dir=$(dirname "$git_dir")
  cd "$repo_dir" || continue

  # Check for uncommitted changes
  if [[ -n $(git status --porcelain) ]]; then
    echo "Uncommitted changes in: $repo_dir"
  fi
done