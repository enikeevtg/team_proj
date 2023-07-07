#!/bin/sh

function get_from_common_remote_branch() {
  echo "\033[33m$COMMON_BRANCH\033[32m last stage getting from remote\033[0m"
  git checkout $COMMON_BRANCH
  git pull  # get latest commit from remote common branch
  git checkout $USER_BRANCH
  git merge $COMMON_BRANCH
  git push origin $USER_BRANCH
}

function push_to_user_remote_branch() {
  echo "\033[33m$USER_BRANCH \033[32mcommit pushing to remote\033[0m"
  shift
  git add .
  git commit -m "$USER_BRANCH: $*"
  git push origin $USER_BRANCH
}

function update_common_remote_branch() {
  echo "\033[33m$COMMON_BRANCH\033[32m remote updatung\033[0m"
  git checkout $COMMON_BRANCH
  git merge $USER_BRANCH
  git push origin $COMMON_BRANCH
  git checkout $USER_BRANCH
  git push origin $USER_BRANCH
}

function usage() {
  echo "$0: illegal option -- $1"
  echo "usage: sh $0 [--help][-h][man]
                    [--get][-g]
                    [--msg \"commit message\"][-m \"commit message\"]"
}

function man_print() {
  echo manual will be here!
}

USER_BRANCH=$(git branch | grep "*" | sed 's/* //' )  # sed is Stream EDitor
COMMON_BRANCH=test
if [ $1 = --get ] || [ $1 = -g ]
then
  get_from_common_remote_branch
elif [ $1 = --msg ] || [ $1 = -m ]
then
  get_from_common_remote_branch
  push_to_user_remote_branch $*
  update_common_remote_branch
elif [ $1 = --help ] || [ $1 = -h ] || [ $1 = man ]
then
  man_print
else
  usage $1
fi