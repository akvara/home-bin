#!/usr/bin/env bash

# Set colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_BLACK=$ESC_SEQ"30;01m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_GRAY=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_PINK=$ESC_SEQ"35;01m"
COL_MAGENTA=$ESC_SEQ"36;01m"
COL_LIGHT=$ESC_SEQ"37;01m"

check_git_result () {
   if [[ $? -ne 0 ]]; then
      echo -en "${COL_RED}git failed!${COL_RESET}\n"
      exit 1
   fi
}

check_git_result_popd () {
   if [[ $? -ne 0 ]]; then
      echo -en "${COL_RED}git failed!${COL_RESET}\n"
      popd
      exit 1
   fi
}

message () {
  echo -en "${COL_BLUE}${COUNT}. $1...${COL_RESET}\n"
}
