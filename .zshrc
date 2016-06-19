# colours and completion
autoload -Uz colors && colors
autoload -Uz compinit && compinit
zstyle ':completion::complete:*' use-cache 1

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zhistory"
setopt inc_append_history hist_expire_dups_first no_nomatch
bindkey '^R' history-incremental-search-backward

# aliases
alias ll="ls -lh"
alias gs="git s"
alias gf="git foreach"

# lazy init
source /usr/local/bin/virtualenvwrapper_lazy.sh
cd() {
  builtin cd "$@"
  [[ -f "$PWD"/.zrun ]] && source "$PWD"/.zrun
}

# git prompt
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '%F{1}%b%F{3}|%F{1}%a%f '
zstyle ':vcs_info:*' formats '%F{3}%b%f '
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' disable bzr cdv cvs darcs fossil hg mtn p4 svk svn tla
vcs_info_wrapper() {
  vcs_info && [ -n "$vcs_info_msg_0_" ] && echo "$vcs_info_msg_0_"
}

PS1="%{$fg_bold[black]%}%~%{$reset_color%} \$(vcs_info_wrapper)$ "
