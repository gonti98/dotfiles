# shellcheck shell=bash

# My scripts
export PATH="$PATH:$HOME/myFiles/scripts"

[[ :$PATH: != *":$HOME/.local/bin:"* ]] && export PATH="$HOME/.local/bin:$PATH"

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
