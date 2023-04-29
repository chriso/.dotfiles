clear

autoload -U colors && colors
autoload -U compinit && compinit -d /tmp/zcompdump

PS1="%{$fg_bold[yellow]%}%~%{$reset_color%} $ "

export EDITOR=vim
export PAGER=less
export LESS=-R
export CLICOLOR=1

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history
setopt inc_append_history hist_expire_dups_first no_nomatch
bindkey ^R history-incremental-search-backward

# Aliases
alias ll="ls -lah"
alias gs="git status --short --branch"

# Homebrew
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_AUTOREMOVE=1
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# Go
export GOPATH=$HOME/.go
export PATH="$PATH:$GOPATH/bin"

# Docker
export PATH="$PATH:$HOME/.docker/bin"

