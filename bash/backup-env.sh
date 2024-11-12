#!/bin/bash

# Source directory to search (modify this to point to your projects directory)
SOURCE_DIR="$HOME/Projects"

# Destination directory where the .env files will be copied
DEST_DIR="$HOME/backup-env-files"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Find and copy each .env file
find "$SOURCE_DIR" -type f -name ".env" | while read -r env_file; do
  # Get the parent directory name
  parent_dir=$(basename "$(dirname "$env_file")")

  # Define the new file path in the destination directory
  new_file_path="$DEST_DIR/$parent_dir.env"

  # Copy the .env file to the destination with the new name
  cp "$env_file" "$new_file_path"

  echo "Copied $env_file to $new_file_path"
done

echo "All .env files have been copied."