formulas=(
	awscli
	direnv
	neovim
	node 
	ripgrep
	ruff
	stow
	yarn
	zsh-syntax-highlighting
)

taps=(
	homebrew/cask-fonts
)

casks=(
	font-jetbrains-mono
	obsidian
	spotify
	visual-studio-code
	zed
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

install_brew_taps() {
		for tap in "${taps[@]}"; do
			if brew tap | grep -q "$tap"; then
				echo "$tap already tapped."
			else
				echo "Tapping $tap..."
				brew tap "$tap"
			fi
		done
}

install_brew_casks() {
		for cask in "${casks[@]}"; do
			if brew list --cask "$cask" &>/dev/null; then
				echo "$cask already installed."
			else
				echo "Installing $cask..."
				brew install --cask "$cask"
			fi
		done
}

setup_homebrew() {
	install_homebrew
	install_brew_formulas
	install_brew_taps
	install_brew_casks
}
