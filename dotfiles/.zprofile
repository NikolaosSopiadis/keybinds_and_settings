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

# bootstrap .zshrc to ~/.config/zsh/.zshrc, any other config files can also reside here
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

