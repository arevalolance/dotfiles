
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

source $ZSH/oh-my-zsh.sh


case 'uname' in
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
