#!/bin/bash
set -exo pipefail

# Assign the first argument passed to the script to the variable TUTORIAL
TUTORIAL=$1

# Assign values 1-4 to variables VAR1-VAR4 can be changed in future to maven, nodejs, python
VAR1=1
VAR2=2
VAR3=3
VAR4=4

# Assign file paths to variables VAR0-VAR3L
VARDL="."
VAR1L="./experimental_docker_compose_files/00_old_one_from_proposal"
VAR2L="./experimental_docker_compose_files/01_simple_controller_plus_agent"
VAR3L="./experimental_docker_compose_files/02_custom_docker_file_connecting_agent_and_controller"
VAR4L="./experimental_docker_compose_files/03_maven_tutorial"
DOCKER_COMPOSE="docker compose"

# Function to check if running in Gitpod and modify jenkins.yaml if needed
# I created this one yesterday but it's not needed after last PR that got merged which solves this issue 
check_gitpod() {
    if [ -e /ide/bin/gitpod-code ] && [ -v GITPOD_REPO_ROOT ]; then
        echo "Gitpod detected"
        echo "Changing URL in jenkins.yaml that supports Gitpod"
        local tutorial_path=$1
        sh $tutorial_path/gitpodURL.sh
    fi
}

# Function to check if Docker Compose is installed not checked on macOS yet
check_docker_compose() {
    if ! command -v docker &> /dev/null
    then
      echo "Docker is not installed. Please install Docker first and then run the script again."
    fi
    if ! docker compose version &> /dev/null
    then
        if ! command -v docker-compose &> /dev/null
        then
            echo "Installing Docker Compose"
            # Steps to install Docker Compose
            if [[ "$OSTYPE" == "linux-gnu"* ]]; then
                apt-get update
                apt-get install ca-certificates curl gnupg
                install -m 0755 -d /etc/apt/keyrings
                curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
                chmod a+r /etc/apt/keyrings/docker.gpg
            elif [[ "$OSTYPE" == "darwin"* ]]; then
                # Install Docker Compose on macOS without Docker Desktop
                # Install the right docker-compose binary for your chipset from the releases page
                if [[ "$(uname -m)" == "arm64" ]]; then
                    sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-darwin-arm64 -o /usr/local/bin/docker-compose
                else
                    sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-darwin-x86_64 -o /usr/local/bin/docker-compose
                fi
                chmod +x /usr/local/bin/docker-compose
            else
                echo "Couldn't install Docker Compose. Please install it manually and try again."
                exit 1
            fi
            DOCKER_COMPOSE=$(which docker-compose)
        else
            echo "docker-compose is already installed"
            DOCKER_COMPOSE=$(which docker-compose)
        fi
    else
        echo "Docker Compose is already installed"
        DOCKER_COMPOSE="docker compose"
    fi
    echo $DOCKER_COMPOSE
}

# Function to start a tutorial based on the provided path
start_tutorial() {
  local tutorial_path=$1
  echo "Starting tutorial $tutorial_path"
  $DOCKER_COMPOSE -f "$tutorial_path/docker-compose.yaml" up -d
}

# Check Docker Compose installation
check_docker_compose

# Determine the tutorial to start based on the provided argument
if [[ "$TUTORIAL" == "$VAR1" ]]; then
  start_tutorial "$VAR1L"
elif [[ "$TUTORIAL" == "$VAR2" ]]; then
  start_tutorial "$VAR2L"
elif [[ "$TUTORIAL" == "$VAR3" ]]; then
  start_tutorial "$VAR3L"
elif [[ "$TUTORIAL" == "$VAR4" ]]; then
  start_tutorial "$VAR4L"
else
  # If no valid argument was passed, run the default tutorial
  echo "No valid argument was selected. Running the default tutorial"
  start_tutorial "$VARDL"
fi

# Track which tutorials have been run for teardown command
echo "$TUTORIAL"
if [[ -z "$TUTORIAL" ]]; then
    echo "0" >> ./.tutorials_running.txt
else
  echo "$TUTORIAL" >> ./.tutorials_running.txt
fi
