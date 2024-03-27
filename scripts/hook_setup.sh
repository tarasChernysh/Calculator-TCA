#!/bin/sh

ROOT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && cd ../ && pwd )"
GIT_HOOKS_DIRECTORY=${ROOT_DIRECTORY}/.git/hooks
SOURCE_DIR=${ROOT_DIRECTORY}/scripts/hooks
HOOK_NAME=pre-commit

if [ ! -d $GIT_HOOKS_DIRECTORY ]; then
    mkdir $GIT_HOOKS_DIRECTORY
    echo "hooks dir created"
fi

cp $SOURCE_DIR/$HOOK_NAME ${GIT_HOOKS_DIRECTORY}/$HOOK_NAME
chmod u+x ${GIT_HOOKS_DIRECTORY}/$HOOK_NAME
echo "pre-commit hook added"
