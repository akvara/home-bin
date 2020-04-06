#!/usr/bin/env bash
dir=$(pwd -P)
short=${PWD##*/}
echo
echo "# arguments called with ---->  ${@}     "
echo "# \$1 ---------------------->  $1       "
echo "# \$2 ---------------------->  $2       "
echo "# path to me --------------->  ${0}     "
echo "# parent path -------------->  ${0%/*}  "
echo "# my name ------------------>  ${0##*/} "
echo "# current dir -------------->  ${dir}   "
echo "# short dir ---------------->  ${short} "
echo
#exit


case $short in

  ta-fleet-fe)
    project="Fleet"
    ;;

  ta-backoffice-fe)
    project="Backoffice"
    ;;

  tmr-tracker-fe)
    project="TMR"
    ;;

  *)
    project=""
    ;;
esac

echo $project

check_git_result () {
   if [[ $? -ne 0 ]]; then
      echo -en "${COL_RED}git failed!${COL_RESET}\n"
      exit 1
   fi
}

