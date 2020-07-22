#!/usr/bin/env bash

clear
printf "Welcome to the unofficial Datadog data_bag creation tool.\n\
This script will guide you through creating your databag so that you can ssh into jumpbox.\n\n"
read -p "Press enter to continue... "
clear
printf "Enter your username in \"first.last\" format. Use the same as your datadoghq email.\n> "
# Automatically changing output to lowercase.
read SSH_USERNAME; SSH_USERNAME=$(echo $SSH_USERNAME | tr '[:upper:]' '[:lower:]')
# Not suggested that they change to zsh, fish, etc due to jumpbox limitations.
SHELL=/bin/bash
printf "\nEnter your full name in \"First Last\" format.\n> "
read FULLNAME
printf "\nEnter your Github username. This is case-sensitive.\n> "
read GITHUB
printf "\nEnter your Datadog email address.\n> "
read EMAIL; EMAIL=$(echo $EMAIL | tr '[:upper:]' '[:lower:]')
printf "\nEnter your Slack Username. See https://dd.slack.com/account/settings#username\n> "
read SLACK_USERNAME
printf "\nEnter your AWS Username. Look for \"Datadog AWS account\" in gmail. If you don't have one, just hit return.\n> "
read AWS_USERNAME
# Ignore GIT_EMAIL
GIT_EMAIL=$(git config --get user.email) # the email you have configured for git commits
clear
printf "That's it! A file named \"${SSH_USERNAME}.json\" has been created in the current directory you are in.\n\
You can run \"pwd\" to see what that is if you don't remember.\n\n\
If your public SSH key was not stored at the default location, replace the contents of \"ssh_keys\" with the the output of:\n\
\"cat path/to/<publickey>.pub\"\n\n\
Go through the process to create a PR for the proper staging branch for your team and upload this file to \"devops/data_bags/users\".\n\n\
If you have any feedback or bug reports, leave an issue or make a PR at: <placeholder>\n"

# From onboarding gists
echo '{
  "id": "'$SSH_USERNAME'",
  "duo": "'$SSH_USERNAME'",
  "ssh_keys": ["'$(cat  ~/.ssh/id_rsa.pub)'"],
  "groups": [ "dogs" ],
  "shell": "'$SHELL'",
  "comment": "'$FULLNAME'",
  "github": "'$GITHUB'",
  "email": "'$EMAIL'",
  "slack_username": "'$SLACK_USERNAME'",
  "additional_git_emails": [
    "'$GIT_EMAIL'"
  ],
  "aws": "'$AWS_USERNAME'"
}' > ${SSH_USERNAME}.json
