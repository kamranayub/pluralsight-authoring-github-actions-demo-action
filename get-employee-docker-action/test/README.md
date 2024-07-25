# Run GitHub Action Locally

You can build a local Docker action to test it and see if it works. To do so, you have to simulate the GitHub Actions runner and pass the appropriate environment config to `docker run` command which the `run-action-locally.sh` script does (technically, a subset of all the env vars). You can see the command GitHub Actions runs when you run your action in a workflow and inspect the logs.

## Prerequisites

- Docker
- Environment variables:
  - `GITHUB_TOKEN`: a personal access token that has permissions to view emails of users
  - `SLACK_TOKEN`: a Slack bot OAuth token for your Slack workspace

Run the script file from the `get-employee-docker-action` folder:

```
./test/run-action-locally.sh
```

If it works, you should see a message like this:

```
Found Slack user ID: <id>
```

## If you are on Windows:

You will need to pass the environment variables holding secrets to WSL using [`WSLENV`](https://devblogs.microsoft.com/commandline/share-environment-vars-between-wsl-and-windows/):

**Powershell:**
```
$env:WSLENV="GITHUB_TOKEN/u:SLACK_TOKEN/u"
```