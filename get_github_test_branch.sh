#!/bin/sh

CUR_BRANCH=$(git branch | grep "*" | sed 's/* '// )  # sed is Stream EDitor

git checkout test
git pull  #from github test branch
git checkout $CURBRANCH
git merge test
git push origin $CUR_BRANCH
