#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/colors.sh

if [[ "$1" == "" ]]; then
    echo usage: $0 commit-message
    exit 1
fi

echo -en "${COL_BLUE}Running tests${COL_RESET}\n"
npm test
check_git_result

echo -en "${COL_BLUE}Running linter...${COL_RESET}\n"
npm run lint:fix
check_git_result

echo -en "${COL_BLUE}Running type-check...${COL_RESET}\n"
npm run type-check
check_git_result

echo -en "${COL_BLUE}Adding files...${COL_RESET}\n"
git add .
check_git_result

echo -en "${COL_BLUE}Committing with message: $1{COL_RESET}\n"
git commit -m "$1"
check_git_result

echo -en "${COL_BLUE}Pushing...${COL_RESET}\n"
git push
check_git_result
