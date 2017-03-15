export LANG=en_US.UTF-8
export EDITOR=vim
export PAGER=less
export LESS=-R
export CLICOLOR=1
export PATH=$HOME/.dotfiles/bin:$PATH
export MAKEFLAGS=-j4

[ -f "$HOME"/.profile.local ] && source "$HOME"/.profile.local
