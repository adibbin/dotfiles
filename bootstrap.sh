#! /bin/zsh

. scripts/brew.sh
. scripts/macOS.sh

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
	setup_homebrew
	setup_macOS
}

# Execute main function
main
