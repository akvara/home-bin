#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source ${DIR}/colors.sh

SOURCE='dev'
TARGET='master'

read -n 1 -sp "Are you sure you want to deploy [y/N]? " answer

if [[ "$answer" == "y" ]]; then
    dialog "\nProceeding"
else
    error "Cancelled."
fi

echo -en "${COL_BLUE}Checking out to $SOURCE ...${COL_RESET}\n"
git checkout ${SOURCE}
check_git_result

echo -en "${COL_BLUE}Pulling $SOURCE ...${COL_RESET}\n"
git pull
check_git_result

echo -en "${COL_BLUE}Checking out to $TARGET ...${COL_RESET}\n"
git checkout ${TARGET}
check_git_result

echo -en "${COL_BLUE}Pulling $TARGET ...${COL_RESET}\n"
git pull
check_git_result

echo -en "${COL_BLUE}Merging $SOURCE to $TARGET...${COL_RESET}\n"
git rebase ${SOURCE}
check_git_result

echo -en "${COL_BLUE}Pushing $TARGET ...${COL_RESET}\n"
git push
check_git_result

echo -en "${COL_BLUE}Checking out to $SOURCE ...${COL_RESET}\n"
git checkout ${SOURCE}
check_git_result

echo -e "${COL_GREEN}Finished.${COL_RESET}"

exit 0
