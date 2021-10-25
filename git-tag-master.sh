#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/colors.sh

if [[ "$1" == "" ]]; then
    echo usage: $0 new-version-tag
    exit 1
fi

if [[ $1 == v* ]]; then
    error "version number should not contain 'v'"
    exit 1
fi

TARGET='master'

COUNT=1
MSG="checking out $TARGET"
message "$MSG"
git checkout $TARGET
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="pulling $TARGET"
message "$MSG"
git pull
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="checking tags"
message "$MSG"
git fetch --tags -f
check_git_result "$MSG"

tagcheck=$(git tag | grep $1)
if [[ "$tagcheck" == "$1" ]]; then
    error "Tag $1 already exists"
fi

let "COUNT=COUNT+1"
MSG="adding tag"
message "$MSG"
git tag "$1"
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="pushing tag"
message "$MSG"
git push && git push --tags
check_git_result "$MSG"
