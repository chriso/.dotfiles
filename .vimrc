set nocompatible
set encoding=utf-8
set number
set noswapfile
set shiftwidth=4 softtabstop=4 expandtab
set list listchars=tab:\ \ ,trail:·
set autoindent
set incsearch
set smartcase ignorecase
set laststatus=2
set backspace=indent,eol,start
set nofoldenable
set visualbell t_vb=
set nobackup
set nowritebackup

noremap ; :

" enable syntax highlighting
syntax on
color desert

" enable file type detection and setup indentation
filetype plugin indent on
au FileType cpp,ruby,html,yml,sh,javascript,json setl sw=2 sts=2
au FileType go setl noet ts=4

" open a file at the last cursor position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" cycle buffers with Ctrl+arrows
noremap <C-Left> :bprevious<CR>
noremap <C-Right> :bnext<CR>

" initialize plugins (github.com/junegunn/vim-plug)
call plug#begin()
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
call plug#end()

" use rg (github.com/BurntSushi/ripgrep) for Ctrl-P and :grep
let g:ctrlp_user_command = 'rg %s --files --color=never'
let g:ctrlp_use_caching = 0
set grepprg=rg\ --color=never
