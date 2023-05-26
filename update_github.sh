#!/bin/sh

CUR_BRANCH=$(git branch | grep "*" | sed 's/* '// )

git checkout test
git merge $CUR_BRANCH
git push origin test
git checkout $CUR_BRANCH
git push origin $CUR_BRANCH
