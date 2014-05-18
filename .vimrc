set nocompatible
set number
set ruler
set modeline
set noswapfile
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set list listchars=tab:\ \ ,trail:·
set autoindent
set hlsearch
set incsearch
set ignorecase
set smartcase
set laststatus=0
set backspace=indent,eol,start

syntax on
filetype plugin indent on

au FileType ruby setl ts=2 sw=2 sts=2 et
au FileType html setl ts=2 sw=2 sts=2 et

au BufEnter * set nofen

color desert
nore ; :

call pathogen#infect()

" open a file at the last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" add additional ignores to CtrlP
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules|vendor)$'

" fix git gutter highlighting
highlight clear SignColumn
