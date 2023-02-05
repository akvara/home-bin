#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR"/colors.sh

if [[ "$1" == "" ]]; then
    echo usage: "$0" branch-link
    exit 1
fi

COMMENT=""

if [[ "$2" != "" ]]; then
   COMMENT="-${2}"
fi

#len=`echo ${BRANCH_NAME} | wc -c`
#if [[ $len -lt 55 ]]; then
#  NAME="ft/${1:37:10}${COMMENT}"
#else
#  NAME="ft/${1:44:10}${COMMENT}"
#fi

BRANCH_NAME="$1"
SEARCH_STRING="/browse/"
REST=${BRANCH_NAME#*$SEARCH_STRING}
STARTS_AT=$(( ${#BRANCH_NAME} - ${#REST} - ${#SEARCH_STRING} + 8 ))

NAME="ft/${1:${STARTS_AT}}${COMMENT}"

#echo "${NAME}"

git checkout -b "${NAME}"
check_git_result
