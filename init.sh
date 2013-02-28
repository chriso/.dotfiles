#!/bin/sh

# Work out current directory and the location of dotfiles
wd=`pwd`
dir="$(cd "$(dirname "$0")" && pwd)"

# Init vim plugins
cd $dir
git submodule init
git submodule update

# Link dot files to ~
find $dir/.[^.]* -maxdepth 0 | grep -v '.git$' | while read src; do
    dest=$(basename $src)
    (ln -s $src ~/$dest 2>/dev/null && echo "$dest linked") || echo "$dest already exists!"
done

cd $wd

