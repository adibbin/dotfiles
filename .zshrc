export XDG_CONFIG_HOME="$HOME/.config"
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/.gitconfig"
export EDITOR='nvim'

# Oh My Zsh Configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
	asdf
	git
	you-should-use
	z
)
source $ZSH/oh-my-zsh.sh

# ZSH You Should Use
export YSU_MESSAGE_POSITION="after"

# Aliases
alias dot="cd ~/dotfiles && nvim"
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias reload="source ~/.zshrc"
alias v=nvim
alias yarnit="yarn install && yarn build && yarn test"
alias zshconfig="nvim ~/.zshrc"

# direnv
eval "$(direnv hook zsh)"

# FNM (Node version manager)
eval "$(fnm env --use-on-cd)"

# ZSH syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
