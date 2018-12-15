export LANG=en_US.UTF-8

# Setup the editor
export EDITOR=vim
bindkey -v

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
alias ll="ls -lh"
alias gs="git status --short --branch"
alias gf="git foreach"
alias gfp="git foreach pending"
alias gfs="git foreach status --short --branch"

# Setup the prompt
PS1="%{$fg_bold[black]%}%~%{$reset_color%} $ "

# Local overlay
[ -f "$HOME"/.profile.local ] && source "$HOME"/.profile.local
