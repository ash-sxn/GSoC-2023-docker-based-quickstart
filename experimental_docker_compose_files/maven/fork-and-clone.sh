#!/bin/bash

MAVEN_REPO="jenkins-docs/simple-java-maven-app"

# Create a directory on the host machine to store the cloned repository
CLONE_DIR=$(pwd)/cloned-repo

# Prompt for GitHub credentials
read -p "Enter your GitHub username: " GITHUB_USERNAME
read -s -p "Enter your GitHub password or personal access token: " GITHUB_PASSWORD
echo

# Create the destination directory
mkdir -p $CLONE_DIR

# Build the Docker image
DOCKER_BUILD_ARGS="--build-arg GITHUB_USERNAME=$GITHUB_USERNAME --build-arg GITHUB_PASSWORD=$GITHUB_PASSWORD --build-arg REPO_NAME=$MAVEN_REPO --file=Dockerfile --tag=clone-result --progress=plain --output $CLONE_DIR ."
docker build $DOCKER_BUILD_ARGS

# Clean up the credentials
unset GITHUB_USERNAME
unset GITHUB_PASSWORD
