#!/usr/bin/env bash
# Setup script for setting up a new macos machine

echo "Starting setup"

# install xcode CLI
#xcode-select --install

sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
brew update
brew upgrade

# Install Mas (command-line interface for Mac App Store)
brew install mas

mas install 497799835 # Install Xcode

sudo xcode-select -r  # Reset the development directory path to put to Xcode /Applications/Xcode.app/Contents/Developer

sudo xcodebuild -license

# Updaate all Apple software and auto agree to any licenses and restart if necessary
sudo softwareupdate --install --agree-to-license -aR

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install diffutils
brew install findutils
brew install gnu-sed
brew install gnu-tar
brew install gnu-indent
brew install gnu-which

# Install taps

echo "Installing taps..."
brew tap koekeishiya/formulae
brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers
brew tap 1password/tap


PACKAGES=(
    bat
    chezmoi
    fd
    fzf
    git
    gh
    grc
    jq
    lsd
    midnight-commander
    neofetch
    pfetch
    skhd
    telnet
    tmux
    tree
    wget
    yabai
    zsh
    java
    alacritty
    kitty
)
echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."

CASKS=(
    1password
    1password-cli
    dropbox
    firefox
    font-hack-nerd-font
    hammerspoon
    iterm2
    karabiner-elements
    macvim
    microsoft-remote-desktop
    slack
    sublime-text
    tunnelblick
    vlc
    zoom
    wireshark
    vnc-viewer
    angry-ip-scanner
    yubico-authenticator
    yubico-yubikey-manager
    yubico-yubikey-personalization-gui
    yubico-yubikey-piv-manager
    authy
    adobe-acrobat-reader
    github
    cyberduck
    skype
    keka
)

echo "Installing cask apps..."
brew install ${CASKS[@]} --cask

# link java
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
sudo ln -s ~/.local/share/chezmoi/com.googlecode.iterm2.plist /Library/Preferences/com.googlecode.iterm2.plist
sudo ln -s ~/.local/share/chezmoi/com.apple.Terminal.plist /Library/Preferences/com.apple.Terminal.plist
 mkdir -p ~/.vimundo

# Will automatically start Yabai when computer starts
brew services start yabai
# Will automatically start skhd when computer starts
brew services start skhd


echo "Installtion complete"

