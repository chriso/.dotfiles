#!/bin/bash

# Check that a directory was provided
if [ "$#" -ne 1 ]; then
    echo "$0 <dir>" && exit 1
fi

# Update all git repositories
find "$1" -name .git -type d 2>/dev/null | while read git_dir; do
  branch_info=$(git --git-dir="$git_dir" status --branch | head -1)
  repo_dir="${git_dir%/.git}"
  if ! echo $branch_info | grep -q "HEAD detached"; then
    echo "Updating $repo_dir ($branch_info)"
    pushd "$repo_dir" &>/dev/null
    git pull || true
    popd &>/dev/null
  fi
done
