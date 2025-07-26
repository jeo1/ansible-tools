#!/bin/bash

REPO_DIRS=(

) #

for DIR in "${REPO_DIRS[@]}"; do
  cd $DIR || continue
  timestamp=$(date "+%Y-%m-%d %H:%M:%S")
  commit_msg="Auto commit at $timestamp"
  git add .
  git commit -m "$commit_msg"
  git push -f
done
