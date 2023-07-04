#!/bin/bash
# This script generates a new SSH key pair and updates a Docker Compose file with the public key.
# Create secrets directory if it doesn't exist
set -x
LOC=$1
if [[ -z "$LOC" ]]; then
    LOC="./"
fi

echo Location is $LOC
ls -artl $LOC

mkdir -p $LOC/secrets

# Remove existing keys
rm -fr $LOC/secrets/jenkins_agent_ed $LOC/secrets/jenkins_agent_ed.pub

# Generate new ed25519 SSH key pair
ssh-keygen -t ed25519 -f $LOC/secrets/jenkins_agent_ed -N ""

# Set appropriate permissions for private key
chmod 444 $LOC/secrets/jenkins_agent_ed

# Extract public key
pubkey=$(cat $LOC/secrets/jenkins_agent_ed.pub)

echo The public key is $pubkey

# Creates the environment file that will be used by the Jenkins ssh agent
echo "JENKINS_AGENT_SSH_PUBKEY=$pubkey" > app/secrets/jenkins_agent_ed.env

# This file will be used by other containers to know we went up to the end of the key generation
echo "OK" > $LOC/secrets/conductor_ok

# Display success message
echo "SSH key pair generated successfully."
