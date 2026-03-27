#!/usr/bin/env zsh

local repo=$(basename $(git rev-parse --show-toplevel 2> /dev/null) 2> /dev/null)
if [[ "$repo" == "" ]]; then
  echo "$PWD"
else
  echo "$repo"
fi
