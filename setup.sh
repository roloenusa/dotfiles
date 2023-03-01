#!/bin/bash
set -euo pipefail
# set -x # uncomment to print all commands as they happen

uname=$(uname -s | tr "[:upper:]" "[:lower:]")

if [[ ! $uname == darwin ]]; then
  exit 0;
fi

###
# System Preferences
###

# Show full paths in footer of Finder windows
defaults write com.apple.finder ShowPathbar -bool true

# Turn off natural scrolling
defaults write -g com.apple.swipescrolldirection -bool NO

###
# System Provisioning
###

# Check if $HOME/bin exists
if [[ ! -d $HOME/bin ]]; then
  mkdir $HOME/bin
fi

# Check if the $HOME/bin folder is in the path
if [[ ! ":$PATH:" == *":$HOME/bin"* ]]; then
  echo "PATH not setup correctly"
  export PATH="$PATH:$HOME/bin"
  echo $PATH
fi

# Check if $HOME/local exists
if [[ ! -d $HOME/.local ]]; then
  mkdir $HOME/.local
fi
