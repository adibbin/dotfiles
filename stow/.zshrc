export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(asdf git z)

export EDITOR='nvim'

source $ZSH/oh-my-zsh.sh

# Aliases
alias dot="cd ~/dotfiles && nvim"
alias reload="source ~/.zshrc"
alias zshconfig="nvim ~/.zshrc"

# ZSH syntax highlighting 
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# FNM (Node version manager)
eval "$(fnm env --use-on-cd)"

# direnv
eval "$(direnv hook zsh)"
