#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/colors.sh

TARGET='master'

echo -en "${COL_GREEN}Checking out to $TARGET ...${COL_RESET}\n"
git co $TARGET
check_git_result

echo -en "${COL_GREEN}Pulling $TARGET ...${COL_RESET}\n"
git pull
check_git_result

echo -en "${COL_GREEN}Pruning ...${COL_RESET}\n"
git remote update origin --prune
check_git_result

echo -en "${COL_GREEN}Removing unused branches ...${COL_RESET}\n"
BRANCHES="$(git branch --merged | egrep -v """(^\*|master|dev)""")"
if [ "$BRANCHES" != "" ]; then
    git branch -d $BRANCHES
    check_git_result
fi

echo -e "${COL_GREEN}Finished.${COL_RESET}"

exit 0
