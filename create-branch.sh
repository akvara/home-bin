#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source ${DIR}/colors.sh

COUNT=1
MSG="Paste task, finish with Ctrl-D"
message "$MSG"
node ${DIR}/create-branch.js ${DIR} $1
check_git_result "$MSG"
