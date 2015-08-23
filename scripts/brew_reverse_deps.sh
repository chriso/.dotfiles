#!/bin/bash

brew list | while read cask; do
  echo -n "$cask: "
  brew uses --installed "$cask" | awk '{printf("%s ", $0)}'
  echo ""
done
