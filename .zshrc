export LANG=en_US.UTF-8
export EDITOR=vim
export PAGER=less
export LESS=-R
export CLICOLOR=1

bindkey -e
autoload -U colors && colors
autoload -U compinit && compinit
zstyle ':completion::complete:*' use-cache 1

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=.zhistory
setopt inc_append_history hist_expire_dups_first no_nomatch
bindkey ^R history-incremental-search-backward

# prompt
PS1="%{$fg_bold[black]%}%~%{$reset_color%} $ "

# aliases
alias ll="ls -lahO"
alias gs="git status --short --branch"

# golang
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

# local overlay
export PATH=$HOME/.bin:$PATH
