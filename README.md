# Notify Slack User Demo Action (Pluralsight)

<!--
[![GitHub Super-Linter](https://github.com/actions/hello-world-javascript-action/actions/workflows/linter.yml/badge.svg)](https://github.com/super-linter/super-linter)
![CI](https://github.com/actions/hello-world-javascript-action/actions/workflows/ci.yml/badge.svg)
-->

This action sends a Slack message to a GitHub user by looking them up in your Slack workspace by their public email address. This is a demo action for the [Authoring and Maintaining GitHub Actions Pluralsight course](https://github.com/kamranayub/pluralsight-course-authoring-maintaining-github-actions).

> [!CAUTION]
>
> DO NOT USE THIS ACTION. It is a working demo for the course and 
> is not intended for public consumption. I will not be maintaining 
> it beyond the scope course updates.

## Prerequisites

- You need to set up a Slack app. [Follow the instructions](https://github.com/slackapi/slack-github-action?tab=readme-ov-file#technique-2-slack-app) for "Technique 2: Slack App" for the Slack Send action to set up your `SLACK_BOT_TOKEN` secret.
- Add the two Slack secrets to your repository, `SLACK_TOKEN` and `SLACK_BOT_TOKEN`
  - These can be the same tokens but the `SLACK_BOT_TOKEN` requires the `chat:write` OAuth scope.
- Ensure the GitHub user(s) you want to notify have their public profile email set to whatever email they use for your Slack workspace. If their email is private, or if the email doesn't match a user in Slack, the action will not work.

## Usage

Here's an example of how to use this action in a workflow file:

```yaml
name: Example Workflow

on:
  pull_request:
    branches:
      - main

jobs:
  build-and-test:
    name: Example build and test workflow
    runs-on: ubuntu-latest

    steps:

      - name: Checkout
        uses: actions/checkout@v4

      #
      # Perform your project build steps here
      #

      # TODO: Replace with actual SHA/version for published action
      # Change @main to a specific commit SHA or version tag, e.g.:
      # kamranayub/pluralsight-authoring-github-actions-demo-action@e76147da8e5c81eaf017dede5645551d4b94427b
      # kamranayub/pluralsight-authoring-github-actions-demo-action@v1.0.0
      - id: "notify-slack"
        name: "Send Slack notification to user"
        uses: kamranayub/pluralsight-authoring-github-actions-demo-action@main
        with:
          github-username: ${{ github.actor }}
          github-token: ${{ secrets.GITHUB_TOKEN }}
          slack-token: ${{ secrets.SLACK_TOKEN }}
          slack-bot-token: ${{ secrets.SLACK_BOT_TOKEN }}
```

For example workflow runs, check out the
[Actions tab](https://github.com/kamranayub/pluralsight-authoring-github-actions-demo-action/actions)!
:rocket:

## Inputs

| Input             | Default | Required | Description                                           |
| ----------------- | ------- | -------- | ----------------------------------------------------- |
| `github-token`    |         | true     | The GitHub token to authenticate with GitHub API      |
| `github-username` |         | true     | The GitHub username of the employee to look up        |
| `slack-token`     |         | true     | The organizational Slack access token to look up users|
| `slack-bot-token` |         | true     | The organizational Slack access token to send messages|

> [!NOTE]
>
> The `slack-token` and `slack-bot-token` can be the same token, but the `slack-bot-token` must have the necessary `chat:write` OAuth scope.
>
> Please see the [slack-send](https://github.com/slackapi/slack-github-action?tab=readme-ov-file#technique-2-slack-app) action for details on the bot token.

## Outputs

| Output | Description                   |
| ------ | ----------------------------- |
| `time` | The time the message was sent |


### How to Use the `time` Output

The `time` output from the action provides the timestamp of when the Slack message was sent. This can be useful for logging or further processing in your workflow.

Here is an example of how to use the `time` output in your GitHub Actions workflow:

```yaml
      - id: "notify-slack"
        name: "Send Slack notification to user"
        uses: kamranayub/pluralsight-authoring-github-actions-demo-action@main
        with:
          github-username: ${{ github.actor }}
          github-token: ${{ secrets.GITHUB_TOKEN }}
          slack-token: ${{ secrets.SLACK_TOKEN }}
          slack-bot-token: ${{ secrets.SLACK_BOT_TOKEN }}

      - name: Print Slack Message Time
        run: echo "Message sent at: ${{ steps.notify-slack.outputs.time }}"
```