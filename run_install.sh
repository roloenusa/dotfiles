#!/bin/bash
set -euo pipefail
# set -x # uncomment to print all commands as they happen

echo "==========="
echo "= Run: Install Packages"
echo "==========="

debug="" # set to y to enable more output
uname=$(uname -s | tr "[:upper:]" "[:lower:]")

brewinstall="brew install --quiet --force"

###
# Development
###

# Node via NVM
mkdir -p ~/.nvm # Create directory only if it exists
brew install nvm

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # this loads nvm bash_completion

nvm install --lts
nvm use --lts

# Better finder
$brewinstall fd

# Fuzzy Search FZF
# Installation source: https://www.youtube.com/watch?v=1a5NiMhqAR0
$brewinstall fzf

###
# Applications
###

brew list 1password            >/dev/null || $brewinstall --cask 1password
brew list discord              >/dev/null || $brewinstall --cask discord
brew list docker               >/dev/null || $brewinstall --cask docker
brew list firefox              >/dev/null || $brewinstall --cask firefox
brew list visual-studio-code   >/dev/null || $brewinstall --cask visual-studio-code
brew list iterm2               >/dev/null || $brewinstall --cask iterm2
