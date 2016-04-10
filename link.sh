#!/bin/bash

find "$HOME/.dotfiles" -name '.*' -mindepth 1 -maxdepth 1 | while read dotfile; do
  filename="$(basename "$dotfile")"
  if [[ "$filename" = ".DS_Store" ]] || [[ "$filename" = ".git" ]] || [[ "$filename" = ".gitmodules" ]]; then
    continue
  fi
  if [[ -e "$HOME/$filename" ]]; then
    echo skipping $filename
  else
    echo linking $filename
    ln -s "$dotfile" "$HOME/$filename"
  fi
done
