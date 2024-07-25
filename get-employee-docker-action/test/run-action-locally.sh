#!/bin/sh

# Build the image
docker build -t DotNetDockerAction -f Dockerfile .

# Run the built image and pass a subset of the expected environment
# Use `env` to pass hyphenated environment variables to Docker
# Both "GITHUB_TOKEN" and "SLACK_TOKEN" secrets need to be defined in the environment
env "INPUT_GITHUB-USERNAME=kamranayub" \
  "INPUT_GITHUB-TOKEN=$GITHUB_TOKEN" \
  "INPUT_SLACK-TOKEN=$SLACK_TOKEN" \
  "GITHUB_OUTPUT=/github/file_commands/GITHUB_OUTPUT" \
  docker run \
    --label DotNetDockerAction \
    --workdir /github/workspace \
    -e "INPUT_GITHUB-USERNAME" \
    -e "INPUT_GITHUB-TOKEN" \
    -e "INPUT_SLACK-TOKEN" \
    -e "GITHUB_OUTPUT" \
    -v "test/_runner_file_commands":"/github/file_commands" \
    -v ".":"/github/workspace"
