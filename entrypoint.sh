#!/bin/sh
set -euo pipefail
echo "--> Setup env"
export CI_PULL_REQUEST=$(cat $GITHUB_EVENT_PATH | jq -r .number)
export CI_REPO_REF=$GITHUB_SHA
export CI_REPO_OWNER=$(cat $GITHUB_EVENT_PATH | jq -r .repository.owner.login)
export CI_REPO_NAME=$(cat $GITHUB_EVENT_PATH | jq -r .repository.name)
export GITHUB_TOKEN="${INPUT_GITHUB_TOKEN}"
export CI_CONFIG_PATH="${INPUT_CONFIG_PATH}"
export PATH=$(pwd)/usr/local/bin/:$PATH

env | grep CI_ | sort

echo "--> Execute pr_auto_assign"
pr_auto_assign
