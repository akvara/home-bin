#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/colors.sh

TARGET='dev'

echo -en "${COL_BLUE}Checking out to $TARGET ...${COL_RESET}\n"
git co $TARGET
check_git_result

echo -en "${COL_BLUE}Pulling $TARGET ...${COL_RESET}\n"
git pull
check_git_result

echo -en "${COL_BLUE}Pruning ...${COL_RESET}\n"
git remote update origin --prune
check_git_result

git fetch --all --prune
check_git_result

echo -en "${COL_BLUE}Removing unused branches ...${COL_RESET}\n"
BRANCHES="$(git branch --merged | egrep -v """(^\*|master|develop|dev)""")"
if [ "$BRANCHES" != "" ]; then
    git branch -d $BRANCHES
    check_git_result
fi

echo -en "${COL_BLUE}Removing gone branches ...${COL_RESET}\n"
git fetch --all --prune; git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D;
check_git_result

echo -e "${COL_GREEN}Finished.${COL_RESET}"

exit 0
