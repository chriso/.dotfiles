[ -z "$PS1" ] && return

# Enable colour
autoload -U colors && colors

# Enable completion
autoload -U compinit && compinit
zstyle ':completion::complete:*' use-cache 1

# Enable history
HISTSIZE=20000
SAVEHIST=20000
HISTFILE=~/.zhistory
setopt inc_append_history
bindkey '^R' history-incremental-search-backward

# Setup my work dir
export REPOS=/Volumes/Repositories

alias ls="ls -G"
alias ll="ls -lh"
alias sed="LC_ALL=C sed"
alias grep="LC_ALL=C grep"
alias gs="git status --short --branch"

# Mac-specific
alias hidefile="SetFile -a V $1"
alias zcat="gzcat"
alias valgrind='valgrind --suppressions="$HOME/.zsh/valgrind-yosemite.supp"'
alias scan-build="scan-build --use-analyzer=/usr/local/bin/clang"
alias pylint="pylint --rcfile=tox.ini --report=n --unsafe-load-any-extension=y"
alias csshx='csshx -c ~/.csshx_config'

# Setup compiler options
export CFLAGS="-O3 -pipe -march=native"
export CXXFLAGS="$CFLAGS"
export CXX=c++

# Setup Golang paths
export GOPATH="$REPOS/personal/go"
export PATH="$PATH:$GOPATH/bin"

# Setup Ruby via RVM
source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin"

# Add git info to the prompt
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '%F{1}%b%F{3}|%F{1}%a%f '
zstyle ':vcs_info:*' formats '%F{3}%b%f '
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' disable bzr cdv cvs darcs fossil hg mtn p4 svk svn tla
vcs_info_wrapper() {
    vcs_info && [ -n "$vcs_info_msg_0_" ] && echo "$vcs_info_msg_0_"
}

PS1="%{$fg[green]%}%~ (air)%{$reset_color%} \$(vcs_info_wrapper)$ "

# Use z for directory completion
source ~/.zsh/z.sh

# Contextual tmux window titles
[ -n "$TMUX" ] && precmd () { tmux rename-window ${PWD//*\//}; }

# Mount repositories and then add SSH keys to the keychain
on() {
    hdiutil attach ~/Documents/Repositories.dmg && \
        ssh-add ~/.ssh/*.key
}
off() {
    ssh-add -l &>/dev/null && \
        ssh-add -l | awk '{ print $3 }' | xargs -n1 ssh-add -d
    hdiutil eject -force "$REPOS"
}
