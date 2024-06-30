// @ts-check
const core = require("@actions/core");
const github = require("@actions/github");
const { WebClient } = require("@slack/web-api");

async function run() {
  try {
    // `github-username` input defined in action metadata file
    const githubUsername = core.getInput("github-username");
    console.log(`Looking up for GitHub username: ${githubUsername}`);

    // GitHub API: get user email address by username
    const githubToken = core.getInput("github-token");
    const octokit = github.getOctokit(githubToken);

    const {
      data: { email },
    } = await octokit.rest.users.getByUsername({
      username: githubUsername,
    });

    if (!email) {
      return core.setFailed(
        `No public email found for GitHub user: ${githubUsername}`
      );
    }

    // Slack API: get user by email address
    const slackToken = core.getInput("slack-token");
    const web = new WebClient(slackToken);
    const { user: slackUser } = await web.users.lookupByEmail({ email: email });

    if (!slackUser) {
      return core.setFailed(`No Slack user found with email: ${email}`);
    }

    // Return Slack User ID as output in action
    const slackUserId = slackUser.id;
    core.setOutput("slack-user-id", slackUserId);

    // Get the JSON webhook payload for the event that triggered the workflow
    const payload = JSON.stringify(github.context.payload, undefined, 2);
    console.log(`The event payload: ${payload}`);
  } catch (error) {
    core.setFailed(error.message);
  }
}

run();
