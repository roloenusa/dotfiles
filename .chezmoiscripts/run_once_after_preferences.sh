#!/bin/bash
set -euo pipefail
# set -x # uncomment to print all commands as they happen

echo "==========="
echo "= Run Once After: Preferences"
echo "==========="

# Display the path on the finder
defaults write com.apple.finder ShowPathbar -bool true

# Enable tap-click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Disable natural scrolling
defaults write -g com.apple.swipescrolldirection -bool NO

# Setup the preferences for vscode
cp $(chezmoi source-path)/preferences/vscode_settings.json $HOME/Library/Application\ Support/Code/User/settings.json

# Setup projects folder:
mkdir -p $HOME/projects/personal

echo "Mac configurations may require a system restart"
