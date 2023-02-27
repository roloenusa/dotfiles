#!/bin/bash
set -euo pipefail
# set -x # uncomment to print all commands as they happen

debug="" # set to y to enable more output
uname=$(uname -s | tr "[:upper:]" "[:lower:]")

brew="brew"
brewinstall="$brew install --quiet --force"

npm="npm --silent"

# Homebrew
if ! $brew help 1>/dev/null 2>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/roloenusa/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
brew update --quiet
brew upgrade --quiet

########################################## Start bootstrap
# TODO: See if this section can be removed now that we use chezmoi
sshkey="$HOME/.ssh/id_rsa"
answer="n"

if ! gh auth status 1>/dev/null 2>/dev/null; then
  if [[ -f $HOME/.ssh/id_rsa ]]; then
    echo "Looks like you've already generated an SSH key."
    read -p "Is it in GitHub yet [y/N]? " answer
    answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
  else
    ssh-keygen -f $sshkey -N ""
  fi

  # Install Github
  if [[ $answer != "y" ]]; then
    $brewinstall gh
    gh auth login --git-protocol ssh --hostname github.com --web
  fi
fi

cd "$(dirname "$0")"
git submodule init
git submodule update
########################################## End bootstrap

###
# Development
###

# Node via NVM
mkdir ~/.nvm
brew install nvm
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


###
# System Configurations
###

# Install oh-my-zsh
rm -rf $HOME/.oh-my-zsh
git clone --quiet https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

if [[ $uname == darwin ]]; then
  # Show full paths in footer of Finder windows
  defaults write com.apple.finder ShowPathbar -bool true
fi
