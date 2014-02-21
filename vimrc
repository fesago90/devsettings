set nocompatible

" no backup files
set nobackup
set noswapfile

" Sets the <Leader> key
let mapleader=","

" Allow buffer switching without saving
set hidden

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Always show current position
set ruler

" Highlight current line
set cursorline

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Show line number
set number
" Show relative line numbers
set rnu

" Makes search act like search in modern browsers (incremental search)
set incsearch
" Case insensitive search
set ignorecase
" Case sensitive if uppercase is typed
set smartcase

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=3

" Enable syntax highlighting
syntax on

if has("gui_running")
    set guioptions=cm
    colorscheme solarized
    "colorscheme zenburn
    set encoding=utf-8
    "set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h8
    "set guifont=Inconsolata\ for\ Powerline:h12
    set guifont=Consolas:h10

    " Show eyecandy
    "let g:airline_powerline_fonts=1
    " Don't show trailing space warning
    let g:airline#extensions#whitespace#enabled=0
else
    colorscheme=wombat256
    set guifont=Consolas:h12
endif

" VimClojure highlighting features
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

" Start pathogen
execute pathogen#infect()

" Persist settings; e.g. window size, gvim menu settings
" set to 0 to disable
let g:setting_restore=0
" Don't ignore vimrc settings
" set 1 to ignore vimrc
let g:setting_ignores_vimrc=0

" Always show status line
set laststatus=2
" Hide the default mode text (e.g. -- INSERT -- below the status line)
set noshowmode
" Filename
set statusline=%<%f\
" Options
set statusline+=%w%h%m%r
" Git Hotness
set statusline+=%{fugitive#statusline()}
" Filetype
set statusline+=\ [%{&ff}/%Y]
" Directory
set statusline+=\ [%{getcwd()}]
" File info
set statusline+=%=%-14.(%l,%c%V%)\ %p%%

