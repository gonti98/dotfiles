#!/usr/bin/env bash

alias cl='clear'

# File and directory listing
alias ls='eza --all --long --header --icons --git --group-directories-first --time-style=relative'
alias ..='cd .. && ls'
alias ...='cd ../.. && ls'
alias ....='cd ../../.. && ls'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpr='git pull --rebase'
alias gl='git log --graph --oneline --all'
alias gco='git checkout'
alias gd='git diff'
alias gb='git branch'

# Btop
alias btop='sudo btop'

# Chezmoi
alias ch='chezmoi'

# Kubernetes
alias k='kubectl'

# OpenCode
alias op='opencode'
