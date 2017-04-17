autoload -Uz colors && colors
autoload -Uz compinit && compinit
zstyle ':completion::complete:*' use-cache 1

bindkey -e

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zhistory"
setopt inc_append_history hist_expire_dups_first no_nomatch
bindkey '^R' history-incremental-search-backward

alias ll="ls -lh"
alias gs="git status --short --branch"
alias gf="git foreach"

PS1="%{$fg_bold[black]%}%~%{$reset_color%} $ "
