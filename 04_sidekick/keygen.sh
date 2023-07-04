#!/bin/bash
# This script generates a new SSH key pair and updates a Docker Compose file with the public key.
# Create secrets directory if it doesn't exist
set -x
LOC=$1
if [[ -z "$LOC" ]]; then
    LOC="./"
fi
echo hello
echo $LOC
mkdir -p $LOC/dockerfiles/secrets

# Remove existing keys
rm -f $LOC/dockerfiles/secrets/jenkins_agent_ed $LOC/dockerfiles/secrets/jenkins_agent_ed.pub

# Generate new ed25519 SSH key pair
ssh-keygen -t ed25519 -f $LOC/dockerfiles/secrets/jenkins_agent_ed -N ""

# Set appropriate permissions for private key
chmod 400 $LOC/dockerfiles/secrets/jenkins_agent_ed

# Extract public key
pubkey=$(cat $LOC/dockerfiles/secrets/jenkins_agent_ed.pub)

# Display success message
echo "SSH key pair generated successfully."
