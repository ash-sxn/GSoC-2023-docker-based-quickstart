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
VAR0="./experimental_docker_compose_files/00_old_one_from_proposal"
VAR1L="./experimental_docker_compose_files/01_simple_controller_plus_agent"
VAR2L="./experimental_docker_compose_files/02_custom_docker_file_connecting_agent_and_controller"
VAR3L="./experimental_docker_compose_files/03_maven_tutorial/"

# Function to start a tutorial based on the provided path
start_tutorial() {
  local tutorial_path=$1
  echo "Starting tutorial $tutorial_path"
  docker compose -f "$tutorial_path/docker-compose.yaml" up -d
}

# Determine the tutorial to start based on the provided argument
if [[ "$TUTORIAL" == "$VAR0" ]]; then
  start_tutorial "$VAR0"
elif [[ "$TUTORIAL" == "$VAR1" ]]; then
  start_tutorial "$VAR1L"
elif [[ "$TUTORIAL" == "$VAR2" ]]; then
  start_tutorial "$VAR2L"
elif [[ "$TUTORIAL" == "$VAR3" ]]; then
  start_tutorial "$VAR3L"
else
  # If no valid argument was passed, run the default tutorial
  echo "No valid argument was selected, running the default tutorial"
  docker compose up -d
fi
