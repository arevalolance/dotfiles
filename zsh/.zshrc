# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    tmux
    git
    zsh-autosuggestions
)

OS=$(uname)
case $OS in
	Darwin)
		eval "$(/opt/homebrew/bin/brew shellenv)"
		;;
esac

# Aliases
alias python="python3"
alias pip="pip3"
alias vim="nvim"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env)"

# bob export
export PATH=$PATH:"$HOME/.local/share/bob/nvim-bin"

source $ZSH/oh-my-zsh.sh

# Check the operating system
case "$(uname -s)" in
  Darwin)   # macOS
    # Commands for macOS
    # pnpm
    export PNPM_HOME="/Users/lance.arevalo/Library/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
    # pnpm end
    ;;
  MINGW*)   # Windows
    # Commands for Windows
    # pnpm
    export PNPM_HOME="/home/sylvor/.local/share/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
    # pnpm end
    ;;
esac
