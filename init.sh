#!/bin/sh

dir="$(cd "$(dirname "$0")" && pwd)"

# Link dot files to ~
find $dir/.[^.]* -maxdepth 0 | grep -v '.git$' | while read src; do
    dest=$(basename $src)
    (ln -s $src ~/$dest 2>/dev/null && echo "$dest linked") || echo "$dest already exists!"
done

