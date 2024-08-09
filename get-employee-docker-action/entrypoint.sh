#!/bin/sh

# Show the current working directory
echo "::debug::Current working directory: $(pwd)"

# Run 'ls -al' and process its output
ls -al | awk '{print "::debug::" $0}'