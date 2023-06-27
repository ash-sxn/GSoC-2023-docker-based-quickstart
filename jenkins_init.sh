#!/bin/bash
set -exo pipefail

# Assign the first argument passed to the script to the variable TUTORIAL

TUTORIAL=$1

# Assign values 0-3 to variables VAR0-VAR3

VAR0=0
VAR1=1
VAR2=2
VAR3=3

# Assign file paths to variables VAR0-VAR3L
VARDL="."
VAR0L="./experimental_docker_compose_files/00_old_one_from_proposal"
VAR1L="./experimental_docker_compose_files/01_simple_controller_plus_agent"
VAR2L="./experimental_docker_compose_files/02_custom_docker_file_connecting_agent_and_controller"
VAR3L="./experimental_docker_compose_files/03_maven_tutorial"
DOCKER_COMPOSE="docker compose"
# Function to start a tutorial based on the provided path

check_gitpod() {
    # Check for existence of this gitpod-specific file and the ENV var.
    if [ -e /ide/bin/gitpod-code ] && [ -v GITPOD_REPO_ROOT ]; then
        echo "Gitpod detected"
        echo "Changing URL in jenkins.yaml that supports gitpod"
        local tutorial_path=$1
        sh $tutorial_path/gitpodURL.sh
    fi
}

check_docker_compose() {
    if ! command -v docker &> /dev/null
    then
        echo "Docker Engine is not installed. Please install it before using Docker Compose."
        exit 1
    fi

    if ! docker compose version &> /dev/null
    then
        if ! command -v docker-compose &> /dev/null
        then
            echo "Installing docker compose"
            # Steps to install docker compose
            if [[ "$OSTYPE" == "linux-gnu"* ]]; then
                # Install Docker Compose manually on Linux
                # Download and install Compose standalone
                curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
                # Apply executable permissions to the standalone binary in the target path for the installation
                chmod +x /usr/local/bin/docker-compose
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
                echo "Couldn't Install docker compose, please install it manually and try again"
                exit 1
            fi

            DOCKER_COMPOSE=$(which docker-compose)
        else
            echo "docker-compose is already installed"
            DOCKER_COMPOSE=$(which docker-compose)
        fi
    else
        echo "docker compose is already installed"
        DOCKER_COMPOSE="docker compose"
    fi

    echo $DOCKER_COMPOSE
}


start_tutorial() {
  local tutorial_path=$1
  echo "Starting tutorial $tutorial_path"
  $DOCKER_COMPOSE -f "$tutorial_path/docker-compose.yaml" up -d
}


check_docker_compose
# Determine the tutorial to start based on the provided argument
if [[ "$TUTORIAL" == "$VAR0" ]]; then
  start_tutorial "$VAR0"
elif [[ "$TUTORIAL" == "$VAR1" ]]; then
  start_tutorial "$VAR1L"
elif [[ "$TUTORIAL" == "$VAR2" ]]; then
  check_gitpod "$VAR2L"
  start_tutorial "$VAR2L"
elif [[ "$TUTORIAL" == "$VAR3" ]]; then
  start_tutorial "$VAR3L"
else
  # If no valid argument was passed, run the default tutorial
  echo "No valid argument was selected, running the default tutorial"
  start_tutorial "$VARDL"
fi
