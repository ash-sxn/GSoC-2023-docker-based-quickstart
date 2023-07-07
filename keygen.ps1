param (
    [string]$LOC = "./"  # Sets a parameter named $LOC with a default value of "./"
)

Write-Host "hello"  # Displays "hello" on the console
Write-Host $LOC  # Displays the value of $LOC on the console

$secretsDirectory = Join-Path $LOC "secrets"  # Combines $LOC and "secrets" to create the secrets directory path
New-Item -ItemType Directory -Path $secretsDirectory -Force | Out-Null  # Creates the secrets directory if it doesn't exist

$privateKeyPath = Join-Path $secretsDirectory "jenkins_agent_ed"  # Combines the secrets directory path with the private key filename
$publicKeyPath = Join-Path $secretsDirectory "jenkins_agent_ed.pub"  # Combines the secrets directory path with the public key filename

# Remove existing keys
Remove-Item $privateKeyPath, $publicKeyPath -ErrorAction SilentlyContinue  # Removes any existing private and public key files

# Generate new ed25519 SSH key pair
ssh-keygen -t ed25519 -f $privateKeyPath -P "" -N ""  # Generates a new ed25519 SSH key pair with an empty passphrase

# Extract public key
$pubkey = Get-Content $publicKeyPath  # Reads the content of the public key file into the $pubkey variable

(Get-Content $LOC/docker-compose.yaml) -replace "JENKINS_AGENT_SSH_PUBKEY=.*", "JENKINS_AGENT_SSH_PUBKEY=$pubkey" | Set-Content $LOC/docker-compose.yaml
# Replaces the existing "JENKINS_AGENT_SSH_PUBKEY" value in the docker-compose.yaml file with the new public key

# Display success message
Write-Host "SSH key pair generated and Docker Compose file updated successfully."
