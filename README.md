# dotfiles

This repository fully bootstraps a new machine to be configured how I like it.
It sets up dotfiles, installs programs and development tools I use, and does
several miscellaneous things I've automated out of my new machine setup process.

It will work for anyone, but it is very opinionated and custom built for my own
needs.

## Installation

This repository does not need to be cloned and you do not need to set up an SSH
key first. Just run:

```sh
sh -c "$(curl -fsLS https://raw.githubusercontent.com/roloenusa/dotfiles/main/setup.sh)"
```

### Troubleshooting

If the first run fails for some reason and later runs refuse to clone, try `rm
~/.gitconfig`, as it forces git@github.com over https://github.com, which will
fail if the installation didn't yet set up SSH keys for you.

### Updates

To make updates to dotfiles, use `chezmoi edit --apply $FILE`.

Updates will be automatically applied, but still need to be committed and pushed.

For example: 

```sh
chezmoi edit --apply $HOME/.gitconfig
```

This will update the `dot_gitconfig` and apply the change to the local version as well.

## Caveats

This project aims to be compatible with macOS.
