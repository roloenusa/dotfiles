#!/bin/bash
set -euo pipefail
# set -x # uncomment to print all commands as they happen

export PATH=$HOME/bin:$PATH
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply roloenusa
