#!/bin/sh

# Homebrew @ http://mxcl.github.com/homebrew/

brew tap homebrew/dupes homebrew/versions

# Want a newer openssh?
# http://www.dctrwatson.com/2013/07/how-to-update-openssh-on-mac-os-x/

brew install --with-clang --HEAD llvm

brew install --HEAD vim

brew install cmake wget autoconf xz automake scons binutils zsh tmux \
    valgrind redis nginx sqlite mariadb git the_silver_searcher \
    python python3 postgresql cloc gfortran r

