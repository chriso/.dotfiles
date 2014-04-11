#!/bin/bash

# Work out current directory and the location of dotfiles
dir="$(cd "$(dirname "$0")" && pwd)"

# Init vim plugins
pushd $dir
git submodule init
git submodule update

# Link dot files to ~
find $dir/.[^.]* -maxdepth 0 | grep -v '.git$' | while read src; do
    dest=$(basename $src)
    (ln -s $src ~/$dest 2>/dev/null && echo "$dest linked") || echo "$dest already exists!"
done

# Link SSH config
ln -s $dir/ssh_config ~/.ssh/config
chmod 600 ~/.ssh/config

popd
