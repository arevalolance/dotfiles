#!/usr/bin/env bash

DEPS=("stow" "ripgrep" "curl" "jq")

WSL_DEP=("xclip", "win32yank")

CARGO_DEPS=("bob-nvim", "tmux-sessionizer")

OS=$(uname)

case $OS in
  Linux)
    . /etc/os-release
    case $ID in
      ubuntu|debian)
        sudo add-apt-repository ppa:wslutilities/wslu -y
        sudo apt install build-essential -y

        for dep in "${DEPS[@]}"; do
          if ! [ -x "$(command -v "$dep")" ]; then
            sudo apt-get install "$dep" -y
          fi
        done

        for dep in "${WSL_DEP[@]}"; do
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
      if ! [ -x "$(command -v "$dep")"]; then
        brew install "$dep"
      fi
    done
  ;;
  *)
    echo "[❌] - Unsupported OS"
    exit 1
  ;;
esac

for dep in "${CARGO_DEPS[@]}"; do
  if ! [ -x "$(command -v "$dep")" ]; then
    cargo install "$dep"
  fi
done

cd $HOME/dotfiles

stow nvim
stow alacritty
stow tmux
stow git

rm -rf ~/.zshrc

# install zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions

stow zsh

cp -r ~/widgets/todos "~/Library/Application Support/Übersicht/widgets/todos"

echo "[✅] - Stowing done."

