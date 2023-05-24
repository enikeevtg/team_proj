#!/bin/sh

CURBRANCH=$(git branch | grep "*" | sed 's/* '// )

git checkout test
git merge $CURBRANCH
git push -u origin test
git checkout $CURBRANCH
