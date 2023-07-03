#!/bin/bash
set -exo pipefail

# Check if the tutorials are running 
if [ ! -f ./.tutorials_running.txt ]; then
    echo "None of the tutorials are running"
    exit 1
fi
# These could be changed in future with maven, nodejs and python
VAR1=1
VAR2=2
VAR3=3
VAR4=4

# Assign file paths to variables VAR1-VAR3L and VARDL for defauld location
VARDL="."
VAR1L="./00_old_one_from_proposal"
VAR2L="./01_simple_controller_plus_agent"
VAR3L="./02_custom_docker_file_connecting_agent_and_controller"
VAR4L="./03_maven_tutorial"

# Function to stop a tutorial based on the provided path
stop_tutorial() {
  local tutorial_path=$1
  echo "Removing tutorial $tutorial_path"
  if ! docker compose version &> /dev/null
  then
    docker-compose -f "$tutorial_path/docker-compose.yaml" down --volumes
  else
    docker compose -f "$tutorial_path/docker-compose.yaml" down --volumes
  fi
  head -n -1 .tutorials_running.txt > temp.txt ; mv temp.txt .tutorials_running.txt

  git restore "$tutorial_path/docker-compose.yaml"
}

# Loop through the running tutorials and stop them
while [ -s .tutorials_running.txt ];
do 
  TUTORIAL=$(tail -n 1 ./.tutorials_running.txt)
  if [[ "$TUTORIAL" == "$VAR1" ]]; then
    stop_tutorial "$VAR1L"
  elif [[ "$TUTORIAL" == "$VAR2" ]]; then
    stop_tutorial "$VAR2L"
  elif [[ "$TUTORIAL" == "$VAR3" ]]; then
    stop_tutorial "$VAR3L"
  elif [[ "$TUTORIAL" == "$VAR4" ]]; then
    stop_tutorial "$VAR4L"
  elif [[ "$TUTORIAL" == "0" ]]; then
    stop_tutorial "$VARDL"
  else
    echo "None of the tutorials are running"
  fi
done

echo "All tutorials are closed"
