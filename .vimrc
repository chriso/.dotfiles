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

" hard mode: disable arrow keys
function HardMode()
  noremap <Up> <NOP>
  noremap <Down> <NOP>
  noremap <Left> <NOP>
  noremap <Right> <NOP>
  noremap h <NOP>
  noremap j <NOP>
  noremap k <NOP>
  noremap l <NOP>
  echo "Good luck!"
endfunction

" parse .h files as c rather than c++
let g:c_syntax_for_h = 1

filetype plugin indent on
syntax on
color desert
nore ; :

" open a file at the last cursor position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" ruby, html and yaml use 2 spaces for indentation
au FileType ruby,html,yml setl ts=2 sw=2 sts=2 et

" highlight lines >= 80 width when writing python or c/c++
au FileType python,c,cpp match ErrorMsg '\%>79v.\+'
