# pluralsight-authoring-github-actions-demo-action

A demo containing multiple custom GitHub Actions:

- [action.yml](./action.yml) -- A Composite GitHub action that gets the Slack ID for a GitHub actor and sends them a Slack message through the slackapi/slack-github-action action.
- [get-employee-js-action](./get-employee-js-action/action.yml) -- A JavaScript action that looks up the Slack User ID for the GitHub actor who triggered the workflow.
