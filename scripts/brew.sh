formulas=(
	awscli
	direnv
	neovim
	node 
	ripgrep
	stow
	yarn
	zsh-syntax-highlighting
)

install_homebrew() {
	if command -v brew &>/dev/null; then
		echo "Homebrew already installed."
	else
		echo "Homebrew not found - installing..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
}

install_brew_formulas() {
		for formula in "${formulas[@]}"; do
			if brew list "$formula" &>/dev/null; then
				echo "$formula already installed."
			else
				echo "Installing $formula..."
					brew install "$formula"
			fi
		done
}
