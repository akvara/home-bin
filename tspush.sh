#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/colors.sh

if [ "$1" == "" ]; then
    echo usage: $0 "message"
    exit 1
fi

COUNT=1
MSG="Timestamping"
message "$MSG"
./bin/timestamp.sh
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="Adding"
message "$MSG"
git add .
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="Commiting"
message "$MSG"
git ci -m "$*"
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="Pushing"
message "$MSG"
git push
check_git_result "$MSG"
