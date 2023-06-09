#!/bin/sh

CUR_BRANCH=$(git branch | grep "*" | sed 's/* //' )  # sed is Stream EDitor

git checkout test
git pull  # get latest commit from remote test branch
git checkout $CUR_BRANCH
git merge test
git push origin $CUR_BRANCH
