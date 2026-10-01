#!/usr/bin/env bash

# My scripts
export PATH="$PATH:$HOME/myFiles/.scripts"

[[ :$PATH: != *":$HOME/.local/bin:"* ]] && export PATH="$HOME/.local/bin:$PATH"
