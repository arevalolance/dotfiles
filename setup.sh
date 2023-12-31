#!/usr/bin/env bash

DEPS=("stow" "ripgrep" "curl" "jq")


OS=$(uname)

case $OS in
  Linux)
    . /etc/os-release
    case $ID in
      ubuntu|debian)
        for dep in "${DEPS[@]}"; do
          if ! [ -x "$(command -v "$dep")" ]; then
            sudo apt-get install "$dep" -y
          fi
        done
      ;;
      *)
        echo "[❌] - Unsupported Linux OS"
        exit 1
      ;;
    esac
  ;;
  Darwin)  # MacOS
    for dep in "${DEPS[@]}"; do

      if ! [ -x "$(command -v "$dep")"; then

        brew install "$dep"
      fi
    done
  ;;
  *)
    echo "[❌] - Unsupported OS"
    exit 1
  ;;
esac

cd $HOME/dotfiles

stow nvim
stow alacritty
stow tmux

rm -rf ~/.zshrc

# install zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions

stow zsh

echo "[✅] - Stowing done."

