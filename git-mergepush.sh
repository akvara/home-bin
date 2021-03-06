#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source ${DIR}/colors.sh

echo -en "${COL_BLUE}Adding files...${COL_RESET}\n"
git add .
check_git_result

echo -en "${COL_BLUE}Committing with no message...${COL_RESET}\n"
git commit -m "fix(Merge): Merge conflicts fixed"
check_git_result

echo -en "${COL_BLUE}Pushing...${COL_RESET}\n"
git push
check_git_result
