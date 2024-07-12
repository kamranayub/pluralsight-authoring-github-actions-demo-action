#! /bin/sh/env

# Copy the JS action's code to the current working directory
# so when the action is started, it can find the code
copy -r ../get-employee-js-action/ ./action