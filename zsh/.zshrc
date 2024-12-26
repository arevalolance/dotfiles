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
    zsh-autosuggestions
    vi-mode
    z
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

# Check the operating system
case "$(uname -s)" in
  Darwin)   # macOS
    # Commands for macOS
    eval "$(fzf --zsh)"
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
    eval "$(fzf)"
    # pnpm
    export PNPM_HOME="/home/sylvor/.local/share/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
    # pnpm end
    ;;
esac

unalias gc 2>/dev/null
gc() {
  git branch | fzf-tmux -p --reverse | xargs git checkout
}

unalias gca 2>/dev/null
gca() {
  git branch -a | fzf-tmux -p --reverse | awk '{gsub("remotes/origin/", "", $1); print $1}' | xargs git checkout
}

unalias ghpr 2>/dev/null
ghpr() {
  _branch=$(git branch -a | fzf-tmux -p --reverse | awk '{gsub("remotes/origin/", "", $1); print $1}')
  echo "gh pr create --base $_branch" | pbcopy > /dev/null
  echo "Command has been copued to clipboard"
}

restore () {
	if [[ "$1" == "omni" ]]
	then
		tmux split-window -h -l 50 'docker compose up'
		tmux split-window -v 'cd packages/db && pnpm run db:studio --browser none'
		tmux last-pane
		pnpm run dev "${@:2}"
	elif [[ "$1" == "ecm" ]]
	then
		echo "TODO: ecm"
	else
		echo "Invalid argument. Please provide 'omni' or 'ecm'."
	fi
}

export EDITOR=nvim

# Configurations
bindkey -M viins jj vi-cmd-mode
export VI_MODE_SET_CURSOR=true

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# fnm
FNM_PATH="/home/sylvor/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/sylvor/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# pnpm
export PNPM_HOME="/home/sylvor/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fnm
FNM_PATH="/Users/arevalolance/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/arevalolance/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi

export PATH=$PATH:$PATH/cargo/bin

source $ZSH/oh-my-zsh.sh

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/arevalolance/.cache/lm-studio/bin"

# aider
export PATH="$PATH:/Users/arevalolance/Library/Python/3.9/bin"
export PATH="/Users/arevalolance/.local/bin:$PATH"
