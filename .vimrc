set runtimepath+=$GOROOT/misc/vim

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

filetype plugin indent on
syntax on

au FileType ruby setl ts=2 sw=2 sts=2 et
au FileType html setl ts=2 sw=2 sts=2 et
au FileType go setl noet

au BufEnter * set nofen

color desert
nore ; :

call pathogen#infect()

" highlight lines > 80 width
match ErrorMsg '\%>80v.\+'

" open a file at the last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" fix git gutter highlighting
highlight clear SignColumn
