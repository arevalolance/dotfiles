#!/bin/bash

# Define the list of files and directories to be deleted
files_to_delete=(
  "$HOME/.tmux.conf"
  "$HOME/.config/nvim"
  "$HOME/.config/alacritty"
  "$HOME/.zshrc"
  "$HOME/.gitconfig"
)

# Function to delete files and directories
delete_files() {
  for file in "${files_to_delete[@]}"; do
    if [ -e "$file" ]; then
      if [ -d "$file" ]; then
        rm -rf "$file"
        echo "Deleted directory: $file"
      else
        rm "$file"
        echo "Deleted file: $file"
      fi
    else
      echo "File not found: $file"
    fi
  done
}

# Call the function to delete files and directories
delete_files

echo "Dotfiles reset complete."

