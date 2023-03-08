#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR"/colors.sh

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "usage: $0 project (prepare | restore)"
    exit 1
fi

PROJECT_NAME="$1"
COMMAND="$2"
BRANCH=""
API_PATH=""

if [[ "$COMMAND" == "prepare" ]]; then
    BRANCH="save/api"
fi

if [[ "$COMMAND" == "restore" ]]; then
    BRANCH="master"
fi

if [[ "$PROJECT_NAME" == "claims" ]]; then
    API_PATH="src/utils/api.ts"
fi

if [[ "$PROJECT_NAME" == "repair" ]]; then
    API_PATH="src/project/settings/additional.py"
fi

if [[ "$API_PATH" == "" ]]; then
    echo -en "\n${COL_RED}Error: unknown project ${PROJECT_NAME}${COL_RESET}\n\n"
    exit 1
fi

echo -en "\n${COL_BLUE}Taking ${API_PATH} from ${BRANCH} in ${PROJECT_NAME}${COL_RESET}...\n\n"
git checkout "$BRANCH" $API_PATH
check_git_result
