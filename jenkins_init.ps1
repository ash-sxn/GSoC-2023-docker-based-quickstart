# Assign the first argument passed to the script to the variable TUTORIAL
$TUTORIAL = $args[0]

# Assign values 1-4 to variables VAR1-VAR4 can be changed in the future to Maven, Node.js, Python, etc.
$VAR1 = 1
$VAR2 = 2
$VAR3 = 3
$VAR4 = 4

# Assign file paths to variables VAR0-VAR3L
$VARDL = "."
$VAR1L = "./experimental_docker_compose_files/00_old_one_from_proposal"
$VAR2L = "./experimental_docker_compose_files/01_simple_controller_plus_agent"
$VAR3L = "./experimental_docker_compose_files/02_custom_docker_file_connecting_agent_and_controller"
$VAR4L = "./experimental_docker_compose_files/03_maven_tutorial"
$DOCKER_COMPOSE = "docker-compose"

# Function to check if tutorials are already running
function Check-RunningTutorials {
    # Check if there is a .tutorials_running.txt file, if there is then check if it's empty, if not stops the script
    if (-not (Test-Path -Path ".\.tutorials_running.txt")) {
        Write-Host "Running First Tutorial"
    }
    else {
        if ((Get-Content -Path ".\.tutorials_running.txt" | Measure-Object).Count -gt 0) {
            Write-Host "Another Tutorial is running. Please use ./jenkins_teardown.ps1 first"
            exit 1
        }
    }
}

# Function to generate SSH keys
function Generate-SSHKeys {
    param(
        [string]$tutorialPath
    )

    Write-Host "generating new ssh keys"
    & $tutorialPath\keygen.ps1 $tutorialPath
}

# Function to start a tutorial based on the provided path
function Start-Tutorial {
    param(
        [string]$tutorialPath
    )

    Write-Host "Starting tutorial $tutorialPath"
    & $DOCKER_COMPOSE -f "$tutorialPath/docker-compose.yaml" up -d
}

# Check if tutorials are already running
Check-RunningTutorials

# Determine the tutorial to start based on the provided argument
if ($TUTORIAL -eq $VAR1) {
    Start-Tutorial $VAR1L
}
elseif ($TUTORIAL -eq $VAR2) {
    Start-Tutorial $VAR2L
}
elseif ($TUTORIAL -eq $VAR3) {
    Generate-SSHKeys $VAR3L
    Start-Tutorial $VAR3L
}
elseif ($TUTORIAL -eq $VAR4) {
    Generate-SSHKeys $VAR4L
    Start-Tutorial $VAR4L
}
else {
    # If no valid argument was passed, run the default tutorial
    Write-Host "No valid argument was selected. Running the default tutorial"
    Generate-SSHKeys $VARDL
    Start-Tutorial $VARDL
}

# Track which tutorials have been run for the teardown command
$TUTORIAL | Out-File -FilePath ".\.tutorials_running.txt" -Append
