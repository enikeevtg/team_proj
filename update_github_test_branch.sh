#!/bin/sh

CUR_BRANCH=$(git branch | grep "*" | sed 's/* '// )

git checkout test
git merge $CURBRANCH
git push origin test
git checkout $CURBRANCH
git push origin $CUR_BRANCH
