#!/bin/bash
set -euo pipefail
# set -x # uncomment to print all commands as they happen

echo "==========="
echo "= Brew Packages"
echo "==========="

brewinstall="brew install --quiet --force"
brew update --quiet
brew upgrade --quiet

###
# Development
###

brew list font-monaspace             >/dev/null || $brewinstall --cask font-monaspace
brew list font-hack-nerd-font        >/dev/null || $brewinstall --cask font-hack-nerd-font
brew list font-roboto-mono-nerd-font >/dev/null || $brewinstall --cask font-roboto-mono-nerd-font

brew list asdf                       >/dev/null || $brewinstall asdf

###
# Utilities
###

brew list fd                         >/dev/null || $brewinstall fd      # Better finder
brew list fzf                        >/dev/null || $brewinstall fzf     # Fuzzy Search FZF: https://www.youtube.com/watch?v=1a5NiMhqAR0
brew list chezmoi                    >/dev/null || $brewinstall chezmoi
brew list dive                       >/dev/null || $brewinstall dive    # Docker image inspector
brew list htop                       >/dev/null || $brewinstall htop
brew list httpie                     >/dev/null || $brewinstall httpie
brew list ripgrep                    >/dev/null || $brewinstall ripgrep
brew list starship                   >/dev/null || $brewinstall starship
brew list tmux                       >/dev/null || $brewinstall tmux
brew list wget                       >/dev/null || $brewinstall wget
brew list youtube-dl                 >/dev/null || $brewinstall youtube-dl

###
# Languages
###

brew list go                         >/dev/null || $brewinstall go

###
# Applications
###

brew list 1password                  >/dev/null || $brewinstall --cask 1password
brew list discord                    >/dev/null || $brewinstall --cask discord
brew list docker                     >/dev/null || $brewinstall --cask docker
brew list firefox                    >/dev/null || $brewinstall --cask firefox
brew list iterm2                     >/dev/null || $brewinstall --cask iterm2
brew list visual-studio-code         >/dev/null || $brewinstall --cask visual-studio-code
brew list ghostty                    >/dev/null || $brewinstall --cask ghostty
# brew list warp                     >/dev/null || $brewinstall --cask warp
