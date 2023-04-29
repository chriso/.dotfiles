set nocompatible
set encoding=utf-8
set shiftwidth=4 softtabstop=4 expandtab
set list listchars=tab:\ \ ,trail:·
set autoindent
set incsearch
set smartcase ignorecase
set backspace=indent,eol,start
set nofoldenable
set visualbell t_vb=
set nobackup
set nowritebackup
set noswapfile
set noshowmode
set noruler
set noshowcmd
set nonumber
set viminfo+=n/tmp/viminfo
set fillchars=eob:\ 
set laststatus=0

noremap ; :

syntax on

color habamax " slate

filetype plugin indent on

au FileType go setl noet ts=4
au FileType go nmap <Leader>r :! clear && go run "%"<CR>
au FileType go nmap <Leader>t :! clear && go test ./...<CR>
