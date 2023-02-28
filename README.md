# dotfiles

This repository fully bootstraps a new machine to be configured how I like it.
It sets up dotfiles, installs programs and development tools I use, and does
several miscellaneous things I've automated out of my new machine setup process.

It will work for anyone, but it is very opinionated and custom built for my own
needs.

## Installation

New mac system don't include the `$HOME/bin` or the `$HOME/.local` setup from previous
versions. It's better to provision it before running the script:

```sh
mkdir $HOME/.local
chmod -R 777 $HOME/.local

mkdir $HOME/bin
export PATH=$PATH:$HOME/bin
```

This repository does not need to be cloned and you do not need to set up an SSH
key first. Just run:

```sh
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply roloenusa && $(chezmoi source-path)/install.sh
```

### Troubleshooting

If the first run fails for some reason and later runs refuse to clone, try `rm
~/.gitconfig`, as it forces git@github.com over https://github.com, which will
fail if the installation didn't yet set up SSH keys for you.

### Updates

To make updates to dotfiles, use `chezmoi edit --apply $FILE`. Updates will be
automatically committed and pushed.

## Caveats

This project aims to be compatible with macOS.
