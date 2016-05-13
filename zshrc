#!/bin/zsh

# Annoying hack to Start X server because SystemD is a giant pain
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx

# Env Vars
export EDITOR=/bin/vim
export PATH="/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl"

# Handy Shortcuts
alias c='git commit -S -m'
alias p='ps aux | grep'

# Oh My Zsh stuff 
export ZSH=/home/emily/.oh-my-zsh
ZSH_THEME="agnoster"
CASE_SENSITIVE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

