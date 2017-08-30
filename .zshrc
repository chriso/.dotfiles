export LANG=en_US.UTF-8
export EDITOR=vim
export PAGER=less
export LESS=-R
export CLICOLOR=1
export PATH=$HOME/.dotfiles/bin:$PATH

[ -f "$HOME"/.profile.local ] && source "$HOME"/.profile.local

autoload -Uz colors && colors
autoload -Uz compinit && compinit
zstyle ':completion::complete:*' use-cache 1

bindkey -e

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zhistory"
setopt inc_append_history hist_expire_dups_first no_nomatch
bindkey '^R' history-incremental-search-backward

unsetopt prompt_cr prompt_sp

alias ll="ls -lh"
alias gs="git status --short --branch"
alias gf="git foreach"

PS1="%{$fg_bold[black]%}%~%{$reset_color%} $ "
