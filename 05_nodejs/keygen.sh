#!/bin/bash
# This script generates a new SSH key pair and updates a Docker Compose file with the public key.
# Create secrets directory if it doesn't exist
LOC=$1
if [[ -z "$LOC" ]]; then
    LOC="./"
fi
echo hello
echo $LOC
mkdir -p $LOC/secrets

# Remove existing keys
rm -f $LOC/secrets/jenkins_agent_ed secrets/jenkins_agent_ed.pub

# Generate new ed25519 SSH key pair
ssh-keygen -t ed25519 -f $LOC/secrets/jenkins_agent_ed -N ""

# Set appropriate permissions for private key
chmod 404 $LOC/secrets/jenkins_agent_ed

# Extract public key
pubkey=$(cat $LOC/secrets/jenkins_agent_ed.pub)

# Check OS with if else statement and Update docker-compose file with a new public key with the appropriate command for MacOS(darwin) and Linux (linux-gnu) & windows-wsl(linux-gnu)  
if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s|JENKINS_AGENT_SSH_PUBKEY=.*|JENKINS_AGENT_SSH_PUBKEY=$pubkey|" $LOC/docker-compose.yaml
    else
        sed -i "s|JENKINS_AGENT_SSH_PUBKEY=.*|JENKINS_AGENT_SSH_PUBKEY=$pubkey|" $LOC/docker-compose.yaml
    fi

# Display success message
echo "SSH key pair generated and Docker Compose file updated successfully."

# End of script
