export LANG=en_US.UTF-8
export EDITOR=vim
export PAGER=less
export LESS=-R
export CLICOLOR=1
export PATH=$HOME/.dotfiles/bin:$PATH

[ -f "$HOME"/.profile.local ] && source "$HOME"/.profile.local
