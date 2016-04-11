LC_ALL=C
EDITOR=vim
PAGER=less
LESS=-R
CLICOLOR=1
PS1="\[\e[33m\]\h \[\e[1m\]\[\e[30m\]\w \[\e[37m\]\\$ \[\e[0m\]"
GOPATH=$HOME/go
PATH=$HOME/.dotfiles/bin:$PATH:$GOPATH/bin

export LC_ALL EDITOR PAGER LESS CLICOLOR PS1 GOPATH PATH
