# Contribution guidelines

## Reporting bugs or issues

If there's an issue that prevents the course demo from working or is an issue with the learning material, please open an issue and report it so I can address it for the next course update.

Please do not open issues that are about enhancing or changing the action, since this is just for demo purposes and not for production consumption.

## Environment setup

You can use the provided DevContainer with GitHub Codespaces which should be pre-configured with all these tools, but there are some additional third-party services and tokens you'll need outlined below.

### Tools

- To work on the JavaScript action, you will need:
  - [Node 20](https://nodejs.org) or above
  - I use [fnm](https://github.com/Schniz/fnm) for Windows to manage node versions
  - The exact version is stored in the `.nvmrc` file for the JavaScript action
- To work on the Docker action, you will need:
  - [Docker Desktop 27+](https://www.docker.com/products/docker-desktop/)
  - [.NET 8+](https://get.dot.net)
  - On Windows, you also need [WSL2 setup](https://learn.microsoft.com/en-us/windows/wsl/install) (Ubuntu 22+)

### Third-Party Services

- A [public GitHub profile](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/personalizing-your-profile) with a public email set
- A Slack app connected to a test workspace ([follow the steps in the Slack Send action](https://github.com/slackapi/slack-github-action?tab=readme-ov-file#technique-2-slack-app))

### Environment variables

- `GITHUB_TOKEN` -- A personal access token (PAT) that has access to your user profile (public permissions are fine)
- `SLACK_TOKEN` -- A Slack app OAuth bot token (no special permissions required) for your Slack workspace
- `SLACK_BOT_TOKEN` -- A Slack app OAuth bot token (with `chat:write` OAuth scope) for your Slack workspace

## Branches

- `main` - The "published" version of the action
- `m3/demo` - The Module 3 final demo material
- `m4/demo` - The Module 4 final demo material
- `m5/demo` - The Module 5 final demo material
