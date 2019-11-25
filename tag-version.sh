#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/colors.sh

check_git_result () {
   if [[ $? -ne 0 ]]; then
      echo -en "${COL_RED}git failed ($1)${COL_RESET}\n"
      exit 1
   fi
}

message () {
  echo -en "${COL_BLUE}${COUNT}. $1...${COL_RESET}\n"
}

if [ "$1" == "" ]; then
    echo usage: $0 new-version-tag
    exit 1
fi

COUNT=1
MSG="checking out develop"
message "$MSG"
git co develop
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="creating new release branch"
message "$MSG"
git co -b "release/v$1"
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="updating version in package.json"
sed -i '' "s/\"version\": \"[0-9].[0-9]*.[0-9]*\",/\"version\": \"$1\",/" ./package.json

let "COUNT=COUNT+1"
MSG="committing"
git add .
git ci -m "chore(Version): v$1"
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="checking out master"
message "$MSG"
git co master
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="merging release branch"
message "$MSG"
git merge "release/v$1"
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="adding tag"
message "$MSG"
git tag "v$1"
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="pushing tag"
message "$MSG"
git push && git push --tags
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="checking out develop"
message "$MSG"
git co develop
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="removing release branch"
message "$MSG"
git branch -D "release/v$1"
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="merging master into develop"
message "$MSG"
git merge master
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="pushing develop"
message "$MSG"
git push
check_git_result "$MSG"
