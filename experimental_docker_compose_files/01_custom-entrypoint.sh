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

# Install dependencies
echo "Installing plugin dependencies..."
DEPENDENCIES=(
  commons-text-api:1.10.0-36.vc008c8fcda_7b_
  caffeine-api:2.9.3-65.v6a_47d0f4d1fe
  snakeyaml-api:1.33-95.va_b_a_e3e47b_fa_4
)

for DEP in "${DEPENDENCIES[@]}"; do
  PLUGIN=$(echo "$DEP" | cut -d ":" -f 1)
  VERSION=$(echo "$DEP" | cut -d ":" -f 2)
  PLUGIN_FILE="${JENKINS_PLUGINS_DIR}/${PLUGIN}.jpi"

  PLUGIN_URL="https://updates.jenkins.io/download/plugins/${PLUGIN}/${VERSION}/${PLUGIN}.hpi"

  curl -sSL "${PLUGIN_URL}" -o "${PLUGIN_FILE}"
done

# Start Jenkins
echo "Starting Jenkins..."
/usr/local/bin/jenkins.sh "$@"
