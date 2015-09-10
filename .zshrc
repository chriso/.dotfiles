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
alias ldd="otool -L"
alias ccat="pygmentize -g"
alias less="less -R"

# handy scripts
alias todo="vim ~/.todo"
alias uuid="python -c 'import uuid; print str(uuid.uuid4())'"
alias now="date +%s"
alias local_server="python -m SimpleHTTPServer 8080"
alias random_mac="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig en0 ether"

# setup python
alias pylint="pylint --rcfile=tox.ini --report=n --unsafe-load-any-extension=y"
alias py.test="py.test --cov-config=tox.ini"
export PYSPARK_DRIVER_PYTHON=ipython
source /usr/local/bin/virtualenvwrapper.sh

# setup golang
export PATH="$PATH:/usr/local/opt/go/libexec/bin:/Users/chris/Documents/go/bin"
export GOPATH="/Users/chris/Documents/go"

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

PS1="%{$fg_bold[black]%}%~%{$reset_color%} \$(vcs_info_wrapper)$ "
