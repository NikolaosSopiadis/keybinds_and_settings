

""" Change .viminfo location """
set viminfo+=n{expand('$XDG_CONFIG_HOME')}/vim/.viminfo

""" Change .netrwhist location """
" I just need to specify the file path, the name (.netrwhist) gets appended at
" the end
let g:netrw_home = expand('$XDG_CONFIG_HOME') . '/vim'


"========================================
" General Settings
"========================================
set nocompatible            " Disable Vi compatibility mode
set encoding=utf-8          " Ensure UTF-8 encoding
set fileformats=unix,dos    " Use Unix line endings by default

"========================================
" User Interface Improvements
"========================================
set number                  " Show line numbers
set relativenumber          " Show relative line numbers
" I see that others that use nocursorline and nocursorcolumn
set cursorline              " Highlight the current line
set showcmd                 " Show command in the bottom right
set ruler                   " Show the cursor position
set wildmenu                " Enhanced command-line completion
set wildmode=longest,list   " Tab completion: show list & auto-expand
set showmatch               " Highlight matching brackets
set signcolumn=yes          " Always show the sign column (prevents text shifting)
set laststatus=2            " Always show the status line
set title                   " Show the filename in the window title

"========================================
" Indentation & Tabs
"========================================
set autoindent              " Auto-indent new lines
set smartindent             " Smarter indentation
set expandtab               " Convert tabs to spaces
set shiftwidth=4            " Number of spaces for indentation
set tabstop=4               " Number of spaces per tab
set softtabstop=4           " Spaces per tab when editing
set smarttab                " Smart tab handling

"========================================
" Search Settings
"========================================
set ignorecase              " Ignore case in searches
set smartcase               " Case-sensitive if uppercase present
set incsearch               " Incremental search
set hlsearch                " Highlight search results
nnoremap <silent> <leader>/ :nohlsearch<CR> " Clear search with <Leader>/

"========================================
" Backup, Undo & Swap Files
"========================================
set undofile                " Enable persistent undo
"set undodir=~/.config/vim/undo " Store undo history in a custom directory
set undodir={expand('$XDG_CONFIG_HOME')}/vim/undo
set backup                  " Enable backup files
set backupdir={expand('$XDG_CONFIG_HOME')}/vim/backup " Set backup directory
set swapfile                " Enable swap files
set directory={expand('$XDG_CONFIG_HOME')}/vim/swap " Set swap file directory

" Create necessary directories if they don't exist
if !isdirectory(expand("~/.config/vim/undo"))
    call mkdir(expand("~/.config/vim/undo"), "p")
endif
if !isdirectory(expand("~/.config/vim/backup"))
    call mkdir(expand("~/.config/vim/backup"), "p")
endif
if !isdirectory(expand("~/.config/vim/swap"))
    call mkdir(expand("~/.config/vim/swap"), "p")
endif

"========================================
" Clipboard & Mouse
"========================================
set clipboard=unnamedplus   " Use system clipboard
set mouse=a                 " Enable mouse support

"========================================
" Status Line & Theme
"========================================
set termguicolors           " Enable true colors (if terminal supports it)
colorscheme desert          " Change this to your preferred theme

"========================================
" File Navigation
"========================================
let g:netrw_home = expand('$XDG_CONFIG_HOME') . '/vim' " Move .netrwhist
let g:netrw_banner=0        " Hide banner in netrw
let g:netrw_liststyle=3     " Tree-style file explorer
let g:netrw_winsize=25      " Set netrw window size

"========================================
" Key Mappings
"========================================
let mapleader = " "         " Set <Leader> key to Space

" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Quick quit with Ctrl+Q
nnoremap <C-q> :q<CR>

" Move between splits using Alt + Arrow Keys
nnoremap <M-Left>  :wincmd h<CR>
nnoremap <M-Right> :wincmd l<CR>
nnoremap <M-Up>    :wincmd k<CR>
nnoremap <M-Down>  :wincmd j<CR>

" Toggle relative numbers with <Leader>n
nnoremap <Leader>n :set relativenumber!<CR>

"========================================
" Performance Tweaks
"========================================
set lazyredraw              " Don't redraw while executing macros
set updatetime=300          " Faster updates (good for plugins like Coc)
set ttyfast                 " Faster rendering

