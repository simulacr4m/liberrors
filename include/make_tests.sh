#!/usr/bin/env bash

###################################
#                                 #
# Author: silentcat               #
# Date: 2018-12-13                #
# Description: Makes symbolic     #
# links to the actual test files  #
# in the test/ directory for ease #
# of typing.                      #
#                                 #
###################################


if [[ "$1" == "" ]]
then

  cat <<EOF
  make_tests.sh [c|d]:

  c - Creates symbolic links to all *_test files in the test/ directory.
  d - Deletes symbolic links to all *_test files in the test/ directory.
EOF
  printf "\n"
  exit
fi

if [[ "$1" == "c" ]]
then
  for i in $(ls test | grep -e "_test$")
  do
    ln -s "test/$i" $i
  done
elif [[ "$1" == "d" ]]
then
  for i in $(ls test | grep -e "_test$")
  do
    rm $i
  done
else
  echo "Command unrecognized."
fi