#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/colors.sh


if [ "$1" == "" ]; then
    echo usage: $0 new-version-tag
    exit 1
fi

MSG="checking tags"
message "$MSG"
git fetch --tags
check_git_result "$MSG"

tagcheck=$(git tag | grep $1)
if [[ "$tagcheck" == "v$1" ]]; then
    error "Tag $1 already exists"
fi

read -n 1 -sp "Is this correct [y/N]? " answer


if [[ "$answer" == "y" ]]; then
    dialog "\nProceeding"
else
    error "Process cancelled"
fi
