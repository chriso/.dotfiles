[ -z "$PS1" ] && return

# Enable colours and completion
autoload -U colors && colors
autoload -U compinit && compinit
zstyle ':completion::complete:*' use-cache 1

# Enable history
HISTSIZE=20000
SAVEHIST=20000
HISTFILE="$HOME/.zhistory"
setopt inc_append_history
bindkey '^R' history-incremental-search-backward
setopt no_nomatch

# Setup aliases
alias ls="ls -G"
alias ll="ls -lh"
alias sed="LC_ALL=C sed"
alias grep="LC_ALL=C grep"
alias sort="LC_ALL=C sort"
alias gs="git status --short --branch"
alias valgrind='valgrind --suppressions="$HOME/.dotfiles/extra/valgrind-yosemite.supp"'
alias scan-build="scan-build --use-analyzer=/usr/local/bin/clang"
alias pylint="pylint --rcfile=tox.ini --report=n --unsafe-load-any-extension=y"
alias csshx="csshx -c ~/.csshx_config"
alias ldd="otool -L"

# Setup compiler options
export CFLAGS="-O3 -pipe"
export CXXFLAGS="$CFLAGS"
export CXX=c++

# Setup Ruby
source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin"

# Setup Go
export GOPATH="$HOME/Documents/personal/go"
export PATH="$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin"

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

# Contextual tmux window titles
[ -n "$TMUX" ] && precmd () { tmux rename-window ${PWD//*\//}; }
