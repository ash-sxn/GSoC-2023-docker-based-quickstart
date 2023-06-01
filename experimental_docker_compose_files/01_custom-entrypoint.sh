#!/bin/bash
set -x
set -e

# Install JCasC plugin
echo "Installing JCasC plugin..."
JENKINS_PLUGINS_DIR=/var/jenkins_home/plugins
JCAS_PLUGIN_VERSION=latest
JCAS_PLUGIN_URL="https://updates.jenkins.io/download/plugins/configuration-as-code/${JCAS_PLUGIN_VERSION}/configuration-as-code.hpi"
JCAS_PLUGIN_FILE="${JENKINS_PLUGINS_DIR}/configuration-as-code.jpi"

mkdir -p "${JENKINS_PLUGINS_DIR}"
curl -sSL "${JCAS_PLUGIN_URL}" -o "${JCAS_PLUGIN_FILE}"

# Start Jenkins
echo "Starting Jenkins..."
/usr/local/bin/jenkins.sh "$@"
