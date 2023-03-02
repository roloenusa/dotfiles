#!/bin/bash

echo "==========="
echo "= Run Once After: Cleanup"
echo "==========="

CURDIR=$(pwd)

# Update the chezmoi repo to use SSH
cd $HOME/.local/share/chezmoi
git remote set-url origin git@github.com:roloenusa/dotfiles.git

cd $CURDIR