#!/usr/bin/env bash

# My scripts
export PATH="$PATH:$HOME/myFiles/myScripts"

[[ :$PATH: != *":$HOME/.local/bin:"* ]] && export PATH="$HOME/.local/bin:$PATH"

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
