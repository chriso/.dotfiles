export LANG=en_US.UTF-8

# Setup the editor
export EDITOR=vim
bindkey -e

# Setup the pager
export PAGER=less
export LESS=-R

# Setup colours
export CLICOLOR=1
autoload -Uz colors && colors

# Setup completion
autoload -Uz compinit && compinit
zstyle ':completion::complete:*' use-cache 1

# Setup history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zhistory"
setopt inc_append_history hist_expire_dups_first no_nomatch
bindkey '^R' history-incremental-search-backward

# Setup aliases
alias ll="ls -lhO"
alias gs="git s"

# Setup the prompt
PS1="%{$fg_bold[black]%}%~%{$reset_color%} $ "

# Setup Go
export GOPATH=$HOME/.go
export GO111MODULE=on
export PATH=$GOPATH/bin:$PATH

# Local overlay
export PATH=$HOME/.bin:$PATH
