#!/usr/bin/env bash

# Enable Vi mode
# set -o vi

export EDITOR="/usr/bin/nvim"
export SUDO_EDITOR=/usr/bin/nvim

# tree
tree() {
  local level="${1:-2}"
  eza --tree --level="$level" --icons --git-ignore --all
}

# kubectl autocompletion
complete -o default -F __start_kubectl k

# Git alias completion
if [ -f /usr/share/bash-completion/completions/git ]; then
  source /usr/share/bash-completion/completions/git
fi
__git_complete gs _git_status
__git_complete ga _git_add
__git_complete gc _git_commit
__git_complete gp _git_push
__git_complete gpr _git_pull
__git_complete gl _git_log
__git_complete gco _git_checkout
__git_complete gd _git_diff
__git_complete gb _git_branch

# fzf init
eval "$(fzf --bash)"

# zoxide init
eval "$(zoxide init bash)"

# starship init
eval "$(starship init bash)"
