# main zsh settngs. env in ~/.zprofle
# read second

### Source aliases ###
[ -f "$HOME/.zsh_aliases" ] && source "$HOME/.zsh_aliases"

### Load modules ###
autoload -U compinit && compinit # zsh auto-complete
autoload -U colors && colors
#autoload -U tetriscurses && tetriscurses

#zstyle :compinstall filename '/home/nick/.zshrc'

### Auto completion ###
# main opts
setopt auto_menu menu_complete # autocmp first menu match
setopt auto_list
setopt list_ambiguous
setopt auto_param_slash # when a dir is completed, add a / instead of a traliing space
setopt autocd # type a dir to cd

setopt extendedglob # match ~ # ^
setopt no_case_glob no_case_match # cmp ignores case
setopt globdots # include dotfiles
setopt interactive_comments # allow comments in shell
setopt prompt_sp

stty stop undef # disable ctrl+s (freeze screen)

# history opts
setopt hist_ignore_dups
setopt append_history inc_append_history share_history
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

# cmp opts

# menu navgation
zstyle ':completion:*' menu select=2 # tab opens cmp menu (when at least two matches exist)

# colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# case insensitive and smart matching
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # cmp ignores case
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={{A-Za-z}' # enable fuzzy matching (ff -> frefox)
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={{A-Za-z}' # enable partial-word completion (gc -> git commit)

# expand hidden dirs and hidden files
zstyle ':completion:*' special-dirs true # force . and .. to appear in cmp menu
#zstyle ':completion:*' fle-patterns '%p:globbed-files' '*:all-fles' # show dotfiles noly when explicitly typed
#zstyle ':completion:*' file-patterns '*' # always show dotfiles

# sorting and ordering
zstyle ':completion:*' sort yes # sort comp alphabetically
zstyle ':completion:*' group-order directories files # lsit directoriies before files
zstyle ':completion:*' group-name '' # group results by type (e.g. directories, execuables, etc)

# command specific completion enhancements
zstyle ':completion:*' verbose yes
#zstyle ':completion:*:*:git:*' group-order aliases functions commands #Show only relevant options when completing commands like git
#zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories # enable cd to only complete directories

# file list
#zstyle ':completion:*' file-list true # more detailed file list

bindkey -v # use vim style navigation

### fzf setup ###


### keybinds ###


### prompt ###
PROMPT="%F{cyan}$(date +%_I:%M%P) %F{green}%n@%m%f:%F{blue}%~ %# "
neofetch

### autosuggestions ###
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

### syntax highlighting ###
# should be last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

