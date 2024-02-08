#! /bin/zsh

install_xcode_cli_tools() {
    if xcode-select -p &>/dev/null; then
				echo "Xcode Command Line Tools already installed."
    else
				echo "Xcode Command Line Tools not found - installing..."
        xcode-select --install
				sudo xcodebuild -license accept
    fi
}

install_homebrew() {
    if command -v brew &>/dev/null; then
        echo "Homebrew already installed."
    else
				echo "Homebrew not found - installing..."
				/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

main() {
    install_xcode_cli_tools
    install_homebrew
}

# Execute main function
main
