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

" github.com/junegunn/vim-plug
call plug#begin()
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
" Plug 'fatih/vim-go'
" Plug 'derekwyatt/vim-scala'
call plug#end()

" setup c/c++ syntastic options
let g:c_syntax_for_h = 1
let g:syntastic_cpp_compiler_options = '-std=c++14'
au FileType cc setl ts=2 sw=2 sts=2 et

filetype plugin indent on
syntax on
color desert
noremap ; :

" cycle buffers with ctrl + arrows
noremap <C-Left> :bprevious<CR>
noremap <C-Right> :bnext<CR>

" setup Ctrl+P
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" open a file at the last cursor position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" ruby, html, yaml, bash use 2 spaces for indentation
au FileType ruby,html,yml,sh setl ts=2 sw=2 sts=2 et

" highlight lines > 80 width in certain languages
au FileType python,c,cpp,php match ErrorMsg '\%>80v.\+'

" run make check
au FileType c,cpp nmap <Leader>c :! make check<CR>

" golang
" let g:go_fmt_command = "goimports"
: au FileType go setl ts=4 sw=4 sts=4 noet
" au FileType go nmap <Leader>r <Plug>(go-run)
