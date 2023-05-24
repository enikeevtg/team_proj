#!/bin/bash

CURBRANCH=$(git branch | grep "*" | sed 's/* '// )

git checkout test
git pull  #from github test branch
git checkout $CURBRANCH
git merge test
git push
