#!/bin/bash
set -o pipefail

# Assign file paths to variables VAR0-VAR3L
VAR0L="./experimental_docker_compose_files/00_old_one_from_proposal"
VAR1L="./experimental_docker_compose_files/01_simple_controller_plus_agent"
VAR2L="./experimental_docker_compose_files/02_custom_docker_file_connecting_agent_and_controller"
VAR3L="./experimental_docker_compose_files/03_maven_tutorial/"


# Stop and remove containers, networks, images, and volumes for tutorial 0
echo "Stopping and removing tutorial 0"
docker compose -f $VAR0L/docker-compose.yaml down --volumes

# Stop and remove containers, networks, images, and volumes for tutorial 1
echo "Stopping and removing tutorial 1"
docker compose -f $VAR1L/docker-compose.yaml down --volumes

# Stop and remove containers, networks, images, and volumes for tutorial 2
echo "Stopping and removing tutorial 2"
docker compose -f $VAR2L/docker-compose.yaml down --volumes

# Stop and remove containers, networks, images, and volumes for tutorial 3
echo "Stopping and removing tutorial 3"
docker compose -f $VAR3L/docker-compose.yaml down --volumes

# Stop and remove containers, networks, images, and volumes for default tutorial
echo "Stopping and removing default tutorial"
docker compose down --volumes

echo "All tutorials have been stopped and removed."
