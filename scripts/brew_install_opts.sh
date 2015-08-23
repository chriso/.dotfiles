#!/bin/bash

brew list | while read cask; do
  echo -n "$cask:"
  brew info $cask | grep 'Built from source\|Poured from bottle'
done
