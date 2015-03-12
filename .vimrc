set nocompatible
set encoding=utf-8
set number
set noswapfile
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set list listchars=tab:\ \ ,trail:·
set autoindent
set incsearch
set smartcase ignorecase
set laststatus=0
set backspace=indent,eol,start
set nofoldenable
set visualbell t_vb=

" parse .h files as C rather than C++
let g:c_syntax_for_h = 1

filetype plugin indent on
syntax on
color desert
nore ; :

" open a file at the last cursor position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" ruby and html use 2 spaces for indentation
au FileType ruby,html setl ts=2 sw=2 sts=2 et

" highlight lines >= 80 width when writing python or C/C++
au FileType python,c,cpp match ErrorMsg '\%>79v.\+'
