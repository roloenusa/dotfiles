#!/bin/bash
set -euo pipefail
# set -x # uncomment to print all commands as they happen

echo "==========="
echo "= Run Once Before: Setup Environment"
echo "==========="

debug="" # set to y to enable more output
uname=$(uname -s | tr "[:upper:]" "[:lower:]")

###
# Install homebrew
###

brew="brew"
brewinstall="$brew install --quiet --force"
if ! $brew help 1>/dev/null 2>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/roloenusa/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

###
# Install Git and Github
###

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

# Setup projects folder:
mkdir -p $HOME/repos/personal
