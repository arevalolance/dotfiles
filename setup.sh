#!/bin/bash

# Specify the path to your dotfiles folder
dotfiles_path="$HOME/dotfiles"

# Create symbolic links for nvim and alacritty in ~/.config
ln -s "$dotfiles_path/nvim" "$HOME/.config/nvim"
ln -s "$dotfiles_path/alacritty" "$HOME/.config/alacritty"

ln -s "$dotfiles_path/.zshrc" "$HOME/.zshrc"

echo "Symbolic links created successfully!"

