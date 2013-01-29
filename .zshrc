[ -z "$PS1" ] && return

# Setup zsh
TERM=xterm-256color
color_prompt=yes
autoload -U compinit
compinit
autoload -U colors
colors
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zhistory
setopt inc_append_history

# Exports
export PATH=/usr/local/bin:/usr/local/sbin:$PATH # brew
export PATH=/usr/local/share/npm/bin:$PATH       # npm
export NODE_ENV=development
export CXX=c++

# Setup the prompt
pre="%{$fg[red]%}"
[ "${UID}" = 0 ] && pre="%{$fg[blue]%}"
post="%{$reset_color%}"
PS1="${pre}%~${post} $ "

# Aliases
alias ls="ls -G"
alias ll='ls -lah'
alias gs='git status'
alias hidefile="SetFile -a V $1"
alias repos="cd /Volumes/Repositories/"

# Prefer github.com/ggreer/the_silver_searcher over ack
if command -v ag >/dev/null; then
    alias ack='ag'
fi

# Prefer gzcat over osx's weird zcat
if command -v gzcat >/dev/null; then
    alias zcat='gzcat'
fi

# Truecrypt volume & SSH keys
on() {
    ~/.vault ~
    echo "$fg[green]Truecrypt volumes & SSH keys enabled$reset_color"
}
off() {
    truecrypt -t -l >/dev/null 2>&1 && truecrypt -t -d
    ssh-add -d ~/.ssh/*.key >/dev/null 2>&1
    echo "$fg[yellow]Truecrypt volumes & SSH keys disabled$reset_color"
}

# Clear history
clear() {
    rm ~/.*history
    echo "$fg[yellow]History cleared$reset_color"
}

# Proxy traffic through EC2
networkservices() {
    networksetup -listallnetworkservices | grep -v 'Bluetooth\|iPhone\|FireWire\|\*'
}
proxy() {
    port=1456
    networkservices | while read service; do
        sudo networksetup -setsocksfirewallproxy "$service" "127.0.0.1" $port
        sudo networksetup -setsocksfirewallproxystate "$service" on
    done
    ssh -fND $port ec2
    echo "$fg[green]Proxy enabled$reset_color"
}
unproxy() {
    networkservices | while read service; do
        sudo networksetup -setsocksfirewallproxystate "$service" off
    done
    ps aux | grep 'ssh -fND' | grep -v grep | awk '{print $2}' | xargs kill -9
    echo "$fg[yellow]Proxy disabled$reset_color"
}

# Productive shortcuts
productive() {
    cat /etc/hosts > /tmp/hosts
    cat ~/.unproductive | sed 's/^\(.*\)$/127.0.0.1 \1 #unproductive/g' >> /tmp/hosts
    sudo mv /{tmp,etc}/hosts
    dscacheutil -flushcache
    echo "$fg[green]Unproductive hosts blocked$reset_color"
}
unproductive() {
    cat /etc/hosts | grep -v '#unproductive' > /tmp/hosts
    sudo mv /{tmp,etc}/hosts
    dscacheutil -flushcache
}

# Update all the things
update() {
    if command -v brew >/dev/null; then
        brew update
        brew upgrade
    elif command -v apt-get >/dev/null; then
        sudo apt-get update
        sudo apt-get -y upgrade
    fi
}

