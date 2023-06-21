#!/bin/bash

# Generate new ed25519 SSH key pair
ssh-keygen -t ed25519 -f secrets/jenkins_agent_ed -N ""

# Extract public key
pubkey=$(cat secrets/jenkins_agent_ed.pub)

# Update docker-compose file with new public key
sed -i "s|JENKINS_AGENT_SSH_PUBKEY=.*|JENKINS_AGENT_SSH_PUBKEY=$pubkey|" docker-compose.yaml
ls
