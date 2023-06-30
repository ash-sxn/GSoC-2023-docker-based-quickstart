#!/bin/bash

NODE_REPO="jenkins-docs/simple-node-js-react-npm-app"

# Extract the repository name from NODE_REPO
REPO_NAME=${NODE_REPO##*/}

# Create a directory on the host machine to store the cloned repository
CLONE_DIR=$(pwd)/../$REPO_NAME

# Prompt for GitHub credentials
read -p "Enter your GitHub username: " GITHUB_USERNAME
read -s -p "Enter your GitHub password or personal access token: " GITHUB_PASSWORD
echo

# Create the destination directory
mkdir -p $CLONE_DIR

# Build the Docker image
DOCKER_BUILD_ARGS="--build-arg GITHUB_USERNAME=$GITHUB_USERNAME --build-arg GITHUB_PASSWORD=$GITHUB_PASSWORD --build-arg REPO_NAME=$NODE_REPO --file=Dockerfile --tag=clone-result --progress=plain --output $CLONE_DIR ."
docker build $DOCKER_BUILD_ARGS

# Replace the $GITHUB_USERNAME variable in the XML file
CONFIG_FILE="dockerfiles/jobs/simple-node-js-react-npm-app/config.xml"
SED_EXPRESSION="s/\$GITHUB_USERNAME/$GITHUB_USERNAME/g"
sed -i -e "$SED_EXPRESSION" $CONFIG_FILE

# Clean up the credentials
unset GITHUB_USERNAME
unset GITHUB_PASSWORD
