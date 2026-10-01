#!/usr/bin/env bash

_HISTDIR="${XDG_STATE_HOME:-$HOME/.local/state}/bash"
mkdir -p "$_HISTDIR"

export HISTFILE="$_HISTDIR/history"
export HISTSIZE=100000
export HISTFILESIZE=200000
export HISTCONTROL="ignoreboth"
export HISTIGNORE="[ ]*:bg:fg:exit:clear:history"
export HISTTIMEFORMAT="%F %T "

shopt -s histappend
shopt -s cmdhist
shopt -s lithist

PROMPT_COMMAND='history -a'

unset _HISTDIR
