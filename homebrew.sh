#!/bin/sh

# Homebrew
# http://mxcl.github.com/homebrew/

brew update

brew install --with-clang llvm

brew install cmake wget autoconf xz automake pkg-config scons binutils \
    unrar zsh tmux valgrind redis nginx sqlite mysql git node ntfs-3g \
    the_silver_searcher

