#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/colors.sh

BRANCH=`git rev-parse --abbrev-ref HEAD`

if [[ "${BRANCH}" == "dev" ]]; then
    echo -en "${COL_RED}Cannot push: You are on dev!${COL_RESET}\n"
    exit 1
fi

if [[ "$1" == "" ]]; then
    echo usage: "$0" commit-message
    exit 1
fi

COMMIT_TEXT=${1}

echo -en "${COL_BLUE}Running tests${COL_RESET}\n"
npm test
check_git_result

echo -en "${COL_BLUE}Running linter...${COL_RESET}\n"
npm run lint:fix
check_git_result

echo -en "${COL_BLUE}Running typelint...${COL_RESET}\n"
npm run typelint
check_git_result

if [[ "$1" != "-" ]]; then
    echo -en "${COL_BLUE}Adding files...${COL_RESET}\n"
    git add .
    check_git_result

    echo -en "${COL_BLUE}Committing with message: \"{$COMMIT_TEXT}\"${COL_RESET}\n"
    git commit -m "${COMMIT_TEXT}"
    check_git_result
fi

echo -en "${COL_BLUE}Pushing...${COL_RESET}\n"
git push
check_git_result
