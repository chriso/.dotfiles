# setup the environment
export LC_ALL=C
export EDITOR=/usr/local/bin/vim
export PAGER=less
export LESS=-R
export CLICOLOR=1
export PS1="\e[1m\e[30m\w \e[37m\$ \e[0m"

# add scripts overlay
export PATH=$HOME/.dotfiles/scripts:$PATH

# setup golang
export GOPATH=$HOME/Documents/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
