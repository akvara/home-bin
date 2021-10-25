#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/colors.sh

if [[ "$1" == "" ]]; then
    echo usage: $0 new-version-tag
    exit 1
fi

if [[ $1 == v* ]]; then
    error "version number should not contain 'v'"
    exit 1
fi


COUNT=1
MSG="checking out develop"
message "$MSG"
git checkout develop
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="pulling develop"
message "$MSG"
git pull
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="checking tags"
message "$MSG"
git fetch --tags
check_git_result "$MSG"

tagcheck=$(git tag | grep $1)
if [[ "$tagcheck" == "v$1" ]]; then
    error "Tag v$1 already exists"
fi

let "COUNT=COUNT+1"
MSG="creating new release branch"
message "$MSG"
git checkout -b "release/v$1"
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="updating version in package.json"
message "$MSG"
sed -i '' "s/\"version\": \"[0-9].[0-9]*.[0-9]*\",/\"version\": \"$1\",/" ./package.json

dialog "Changed package.json is this:"
grep '"version":' ./package.json

read -n 1 -sp "Is this correct [y/N]? " answer

if [[ "$answer" == "y" ]]; then
    dialog "\nProceeding"
else
    error "Process cancelled"
fi

let "COUNT=COUNT+1"
MSG="committing"
git add .
git commit -m "chore(Version): v$1"
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="checking out master"
message "$MSG"
git checkout master
check_git_result "$MSG"

let "COUNT=COUNT+1"
MSG="pulling master"
message "$MSG"
git pull
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
git checkout develop
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

short=${PWD##*/}
case $short in

  ta-fleet-fe)
    project="Fleet"
    ;;

  ta-backoffice-fe)
    project="BackOffice"
    ;;

  tmr-tracker-fe)
    project="TMR-fe"
    ;;

  *)
    project=""
    ;;
esac

echo -en "\n@here tagged new $project version v$1\n\n"
