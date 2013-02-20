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
set laststatus=2

syntax on
au FileType make set noexpandtab
au BufRead,BufNewFile *.md set ft=markdown
color desert
nore ; :

call pathogen#infect()

" Open a file at the last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Ignore node_modules in CtrlP
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'

