#! /bin/zsh

. scripts/brew.sh

install_xcode_cli_tools() {
    if xcode-select -p &>/dev/null; then
				echo "Xcode Command Line Tools already installed."
    else
				echo "Xcode Command Line Tools not found - installing..."
        xcode-select --install
				sudo xcodebuild -license accept
    fi
}

main() {
    install_xcode_cli_tools
    install_homebrew
		install_brew_formulas
}

# Execute main function
main
