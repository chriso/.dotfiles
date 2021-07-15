export LANG=en_US.UTF-8
export EDITOR=vim
export PAGER=less
export LESS=-R
export CLICOLOR=1

bindkey -e
autoload -U colors && colors
autoload -U compinit && compinit
zstyle ':completion::complete:*' use-cache 1

ulimit -n 8192

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zhistory
setopt inc_append_history hist_expire_dups_first no_nomatch
bindkey ^R history-incremental-search-backward

# prompt
PS1="%{$fg_bold[black]%}%~%{$reset_color%} $ "

# aliases
alias ll="ls -lah"
alias gs="git status --short --branch"
alias gf="git foreach"

# jump command
goto() { cd ~/Documents/$1 &> /dev/null || (cd ~/Documents && git clone git@github.com:segmentio/$1.git && cd ~/Documents/$1) || echo "repo @ $1 does not exist" }
_goto() { compadd $(find ~/Documents -maxdepth 1 -mindepth 1 | sed "s|$HOME/Documents/||") }
compdef _goto goto

# golang
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

# local overlay
export PATH=$HOME/.bin:$PATH
