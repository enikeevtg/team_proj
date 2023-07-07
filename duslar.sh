#!/bin/sh

function get_from_common_remote_branch() {
  echo "\033[33m$COMMON_BRANCH\033[32m remote branch last stage getting\033[0m"
  git checkout $COMMON_BRANCH
  git pull  # get latest commit from remote common branch
  git checkout $USER_BRANCH
  git merge $COMMON_BRANCH
  git push origin $USER_BRANCH
}

function push_to_user_remote_branch() {
  echo "\033[33m$USER_BRANCH\033[32m committing and pushing to remote\033[0m"
  shift
  git add .
  git commit -m "$USER_BRANCH: $*"
  git push origin $USER_BRANCH
}

function update_common_remote_branch() {
  echo "\033[33m$COMMON_BRANCH\033[32m remote branch updating\033[0m"
  git checkout $COMMON_BRANCH
  git merge $USER_BRANCH
  git push origin $COMMON_BRANCH
  git checkout $USER_BRANCH
  git push origin $USER_BRANCH
}

function usage() {
  echo "$0: illegal option -- $1"
  echo "usage: sh $0 [--help][-h][man] [--get][-g] [--update \"commit message\"][-u \"commit message\"]"
}

function man_print() {
  echo "
  Team working script.

  usage: sh $0 [--help][-h][man] [--get][-g] [--update \"commit message\"][-u \"commit message\"]

  Use options [--get][-g] for getting $COMMON_BRANCH remote branch last stage.

  Use options [--update][-u] with your commit message (in quotes!) for updating your own and $COMMON_BRANCH remote branches.
  "
}

USER_BRANCH=$(git branch | grep "*" | sed 's/* //' )  # sed is Stream EDitor
COMMON_BRANCH=test
if [ $1 = --get ] || [ $1 = -g ]
then
  get_from_common_remote_branch
elif [ $1 = --update ] || [ $1 = -u ]
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
