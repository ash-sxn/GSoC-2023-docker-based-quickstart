# Developer Onboarding Guide

## Introduction

This guide provides instructions on how to set up your development environment to contribute to the `docker-based-jenkins-quickstart` repository.

## Prerequisites

Before you begin, make sure you have the following installed:

- Git
- Docker
- Docker Compose

## Forking the Repository

To make changes to the codebase, you'll need to fork the `docker-based-jenkins-quickstart` repo on GitHub into your own account.

To fork the repo:

1. Go to https://github.com/ash-sxn/GSoC-2023-docker-based-quickstart
2. Click the 'Fork' button in the top right corner. This will create a copy of the repo in your own GitHub account.

## Cloning Your Fork

The next step is to clone your forked repository locally on your machine:

```bash
git clone https://github.com/<your-username>/GSoC-2023-docker-based-quickstart
```

Replace `<your-username>` with your GitHub username.

This will download the codebase to your local machine.

## Configuring the Upstream Remote

To keep your fork in sync with the upstream repository, you'll need to configure a remote that points to the upstream repo:

```bash
git remote add upstream https://github.com/ash-sxn/GSoC-2023-docker-based-quickstart
```

You can then fetch the latest changes from upstream:

```bash
git fetch upstream
```

And merge them into your local main branch:

```bash
git checkout main
git merge upstream/main
```

This will sync your fork before you start making changes.

## Making Changes

To start working on issues:

1. Check out the project board to find issues to work on: https://github.com/ash-sxn/GSoC-2023-docker-based-quickstart/issues

2. Create a new branch for the issue you want to work on:

```bash
git checkout -b <branch-name>
```

3. Make your code changes and commit them with descriptive commit messages.

4. Push your branch to your fork:

```bash
git push origin <branch-name>
```

5. Open a pull request against the `main` branch with details on the changes.

6. Request a review from the maintainers.

7. Make any changes based on the review feedback.

8. Once approved, your PR will be merged into the `main` branch.

## Testing Changes Locally

To test your changes locally with Docker:

1. Build the Docker images:

```bash
docker compose build
```

2. Start the containers:

```bash
docker compose up
```

3. Access Jenkins at http://localhost:8080 and test your changes.

4. Tear down the environment when done:

```bash
docker-compose down
```

This allows you to rapidly develop and iterate on the project.

## Getting Help

If you need any help with the onboarding process, check out the project docs or reach out on the [gsoc-2023-docker-quickstart](https://app.gitter.im/#/room/#gsoc-2023-docker-quickstart:matrix.org) Gitter channel.
The maintainers are happy to assist!