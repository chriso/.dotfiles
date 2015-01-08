set nocompatible
set encoding=utf-8
set number ruler modeline
set noswapfile
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set list listchars=tab:\ \ ,trail:·
set autoindent
set hlsearch incsearch
set smartcase ignorecase
set laststatus=0
set backspace=indent,eol,start

filetype plugin indent on
syntax on
color desert
nore ; :

" disable folding
au BufEnter * set nofen

" ruby and html use 2 spaces for indentation
au FileType ruby setl ts=2 sw=2 sts=2 et
au FileType html setl ts=2 sw=2 sts=2 et

" golang uses tabs
au FileType go setl noet

" highlight lines >= 80 width
match ErrorMsg '\%>79v.\+'

" open a file at the last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif
