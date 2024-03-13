#!/bin/sh

GIT_HOOKS_DIRECTORY=.git/hooks
SOURCE_DIR=scripts/hooks
HOOK_NAME=pre-commit

if [ ! -d $GIT_HOOKS_DIRECTORY ]; then
    mkdir $GIT_HOOKS_DIRECTORY
    echo "hooks dir created"
fi

echo "git dir $(pwd)/${GIT_HOOKS_DIRECTORY}"
echo "hook dir $(pwd)/$SOURCE_DIR/$HOOK_NAME"

cp $(pwd)/$SOURCE_DIR/$HOOK_NAME $(pwd)/${GIT_HOOKS_DIRECTORY}/$HOOK_NAME
chmod u+x ${GIT_HOOKS_DIRECTORY}/$HOOK_NAME
echo "pre-commit hook added"
