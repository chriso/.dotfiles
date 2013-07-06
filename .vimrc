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
au FileType make setl noexpandtab
au BufRead,BufNewFile *.html setl sw=2 sts=2 et
au BufRead,BufNewFile *.md setl ft=markdown
color desert
nore ; :

call pathogen#infect()

" Hide the status bar
:set laststatus=0

" Open a file at the last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Fix git gutter highlighting
highlight clear SignColumn

" Ignore node_modules in CtrlP
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'


