#!/bin/sh

# Run 'ls -al' and process its output
ls -al | awk '{print "::debug::" $0}'

# Run the original entrypoint
dotnet DotNetDockerAction.dll
