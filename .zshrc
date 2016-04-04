# enable colours and completion
autoload -U colors && colors
autoload -U compinit && compinit
zstyle ':completion::complete:*' use-cache 1

# enable history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$HOME/.zhistory"
setopt inc_append_history hist_expire_dups_first no_nomatch
bindkey '^R' history-incremental-search-backward

# setup the environment
export EDITOR=/usr/local/bin/vim
export TERM=xterm-256color

# fix encoding issues
alias sed="LC_ALL=C sed"
alias grep="LC_ALL=C grep"
alias sort="LC_ALL=C sort"
alias cut="LC_ALL=C cut"

# setup aliases
alias ls="ls -G"
alias ll="ls -lh"
alias gs="git status --short --branch"
alias valgrind='valgrind --suppressions="$HOME/.dotfiles/valgrind/yosemite.supp"'
alias less="less -R"
alias redir="cd \$(pwd -P)"
alias uuid="python -c 'import uuid; print str(uuid.uuid4())'"
alias random_mac="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig en0 ether"
alias update="brew update && brew upgrade --all && brew cleanup"

# setup python
export PYSPARK_DRIVER_PYTHON=ipython
source /usr/local/bin/virtualenvwrapper.sh

# setup golang
export GOPATH=$HOME/Documents/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

export PATH=$HOME/.dotfiles/wrappers:$PATH

# setup the dev environment
export DEV_VBOX=Alpine
dev() {
  if ! VBoxManage list runningvms 2>/dev/null | grep -q $DEV_VBOX; then
    VBoxManage startvm $DEV_VBOX --type headless
    echo -n Waiting for sshd
    for wait_s in $(seq 1 30); do echo -n .; sleep 1; done
    echo
  elif VBoxManage showvminfo $DEV_VBOX 2>/dev/null | grep -q 'State: *paused'; then
    VBoxManage controlvm $DEV_VBOX resume
  fi
  ssh dev
  VBoxManage controlvm $DEV_VBOX pause
}

# add git info to the prompt
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '%F{1}%b%F{3}|%F{1}%a%f '
zstyle ':vcs_info:*' formats '%F{3}%b%f '
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' disable bzr cdv cvs darcs fossil hg mtn p4 svk svn tla
vcs_info_wrapper() {
    vcs_info && [ -n "$vcs_info_msg_0_" ] && echo "$vcs_info_msg_0_"
}

# shorten common dirs
go=$GOPATH/src/github.com
: ~go

PS1="%{$fg_bold[green]%}mac%{$reset_color%} %{$fg_bold[black]%}%~%{$reset_color%} \$(vcs_info_wrapper)$ "
