#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/colors.sh

branch=`git rev-parse --abbrev-ref HEAD`

if [[ "${branch}" == "dev" ]]; then
    echo -en "${COL_RED}Cannot push: You are on dev!${COL_RESET}\n"
    exit 1
fi

#read committext
if [[ "$1" == "" ]]; then
    echo usage: $0 commit-message
    exit 1
fi

committext=${1}

echo -en "${COL_BLUE}Running tests${COL_RESET}\n"
npm test
check_git_result

echo -en "${COL_BLUE}Running linter...${COL_RESET}\n"
#npm run lint
#check_git_result

echo -en "${COL_BLUE}Adding files...${COL_RESET}\n"
git add .
check_git_result

echo -en "${COL_BLUE}Committing with message: "$committext"${COL_RESET}\n"
git commit -m "${committext}"
check_git_result

echo -en "${COL_BLUE}Pushing...${COL_RESET}\n"
git push
check_git_result
