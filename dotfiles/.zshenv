# env vars and default programs

### Default programs ###
export EDITOR="vim"
export TERMINAL="kitty"
#export MUSPLAYER=
export BROWSER="librewolf"
#export DISPLAY=:0 # useful for some scripts

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
export PATH="$HOME/scripts:$PATH"

### fzf ###
export FZF_DEFAULT_OPTS="--style minimal --color 16 --layout=reverse --height 30% --preview='bat -p --color=always {}'"
export FZF_CTRL_R_OPTS="--style minimal --color 16 --info inline --no-sort --no-preview" # separate opts for history widget

### less ###
# colored less + termcap vars
export LESS='-R -M -i'   # -R: allow ANSI colors, -M: verbose prompt, 
                            # -i: make search case-insensitive (unless uppercase)
export LESS_TERMCAP_mb=$'\e[1;31m'  # begin blink -> bold red (rarely used)
export LESS_TERMCAP_md=$'\e[1;36m'  # begin bold -> cyan
export LESS_TERMCAP_me=$'\e[0m'     # reset bold/blink
export LESS_TERMCAP_so=$'\e[01;44;33m' # standout -> yellow on blue
export LESS_TERMCAP_se=$'\e[0m'     # reset standout
export LESS_TERMCAP_us=$'\e[1;32m'  # underline -> green
export LESS_TERMCAP_ue=$'\e[0m'     # reset underline

### man pages ###
# colored man pages
export MANPAGER='less -R'
export PAGER='less -R'
export GROFF_NO_SGR=1

