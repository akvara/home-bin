#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR"/colors.sh

TARGET='master'

#COUNT=1
MSG="checking out $TARGET"
message "$MSG"
git checkout ${TARGET}
check_git_result "$MSG"

#let "COUNT=COUNT+1"
#MSG="fetching tags"
#message "$MSG"
#git fetch origin ${TARGET} --tags
#check_git_result "$MSG"

#COUNT=(( COUNT + 1 ))
MSG="calculating tag"
message "$MSG"
git tag | node "$DIR"/find-latest-tag.js "$DIR"
check_git_result "$MSG"
