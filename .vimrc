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

" cycle buffers with Ctrl + arrows
noremap <C-Left> :bprevious<CR>
noremap <C-Right> :bnext<CR>

" parse .h files as c rather than c++
let g:c_syntax_for_h = 1

" Ctrl+P search should be relative to the dir containing .git
let g:ctrlp_working_path_mode = 'r'

execute pathogen#infect()

filetype plugin indent on
syntax on
color desert
noremap ; :

" open a file at the last cursor position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" ruby, html and yaml use 2 spaces for indentation
au FileType ruby,html,yml setl ts=2 sw=2 sts=2 et

" highlight lines >= 80 width when writing python or c/c++
au FileType python,c,cpp match ErrorMsg '\%>79v.\+'

" setup golang
let g:go_fmt_command = "goimports"
au FileType go setl ts=4 sw=4 noet
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>v <Plug>(go-vet)
au FileType go nmap <Leader>l :GoLint<CR>

" setup Python
au FileType python nmap <Leader>l :! tox -e lint<CR>
au FileType python nmap <Leader>t :! tox -e py27 --<CR>
au FileType python nmap <Leader>k :! tox -e py27 -- -s -k %<CR>
au FileType python nmap <Leader>c :! tox -e py27 -- --cov-report=html<CR>
