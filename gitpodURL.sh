#!/bin/bash

# Set the path to the configuration file
config_file="/workspace/GSoC-2023-docker-based-quickstart/dockerfiles/jenkins.yaml"

# Extract the hostname from the GITPOD_WORKSPACE_URL variable
service_url=$(echo $GITPOD_WORKSPACE_URL | awk -F/ '{print $3}')

# Print the hostname for debugging purposes
echo Jenkins can be accessed here: "https://8080-$service_url"

# Let's try with the gp command
export JENKINS_EXT_URL="$(gp url 8080)"
echo Jenkins should be accessible here: "$JENKINS_EXT_URL"

# Use yq to update the value of the .unclassified.location.url field in the configuration file
yq eval ".unclassified.location.url = \"https://8080-$service_url/\"" "$config_file" > "$config_file.tmp" && mv "$config_file.tmp" "$config_file"
