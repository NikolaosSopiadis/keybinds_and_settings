#!/bin/sh
# env vars to set on login, zsh settings in ~/.zshrc
# read first

# based on BreadOnPenguins setup https://github.com/BreadOnPenguins/dots/blob/master/.zprofile

### Default programs ###
export EDITOR="vim"
export TERM="kitty"
export TERMINAL="kitty"
#export MUSPLAYER=
export BROWSER="librewolf"
#export DIISPLAY=:0 # useful for some scripts

### XDG ### 
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

### bootstrap .zshrc to ~/.config/zsh/.zshrc ###
# any other config files can also reside here
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

### vim ###
export MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
#export VIMINIT="source $XDG_CONFIG_HOME/vim/.vimrc" # doesn't work

### history files ###
export LESSHISTFILE="$XDG_CACHE_HOME/less_history"
export PYTHON_HISTORY="$XDG_CACHE_HOME/python/history"

### add scripts ###
#export PATH="$XDG_CONFIG_HOME/scripts:$PATH"

### fzf ###
export FZF_DEFAULT_OPTS="--style minimal --color 16 --layout=reverse --height 30% --preview='bat -p --color=always {}'"
export FZF_CTRL_R_OPTS="--style minimal --color 16 --info inline --no-sort --no-preview" # separate opts for history widget

### man pages ###
# colored man pages
export MANPAGER="less -R --use-color -Dd+r -Du+b" 

### less ###
# colored less + termcap vars
export LESS="R --use-color -Dd+r -Du+b"
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
