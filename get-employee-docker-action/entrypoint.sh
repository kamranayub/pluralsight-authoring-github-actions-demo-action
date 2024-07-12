#!/bin/sh
export INPUT_GITHUB_USERNAME=$1
export INPUT_GITHUB_TOKEN=$2
export INPUT_SLACK_TOKEN=$3

npm ci
node main.js