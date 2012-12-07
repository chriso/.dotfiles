#!/bin/sh

dir="$(cd "$(dirname "$0")" && pwd)"

# Link dot files to ~
find $dir/.[^.]* -type f -maxdepth 0 -type d -name .git -prune -o -print | while read src; do
    dest=$(basename $src)
    (ln -s $src ~/$dest 2>/dev/null && echo "$dest linked") || echo "$dest already exists!"
done

