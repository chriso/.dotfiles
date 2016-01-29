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

" setup Ctrl+P searching
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

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
au FileType python,c,cpp,php match ErrorMsg '\%>79v.\+'

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

" golang /vendor/ dir support in v1.6 (or v1.5 with GO15VENDOREXPERIMENT=1)
" see https://gist.github.com/termie/34326bd29e89565c95fa
let g:go_fmt_options = "-f " . expand("%:p")


" setup Python
au FileType python nmap <Leader>l :! tox -e lint<CR>
au FileType python nmap <Leader>t :! tox -e py27<CR>
au FileType python nmap <Leader>k :! tox -e py27 -- -v -s -k $(basename "%")<CR>
au FileType python nmap <Leader>c :! tox -e py27 -- --cov-report=html<CR>
