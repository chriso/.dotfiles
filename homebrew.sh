#!/bin/sh

# See http://mxcl.github.com/homebrew/
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

brew update

brew install ack cmake wget autoconf xz automake pkg-config scons binutils \
    unrar zsh tmux valgrind redis nginx sqlite mysql git node ntfs-3g

