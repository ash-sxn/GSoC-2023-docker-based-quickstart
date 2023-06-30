# Check if the tutorials are running
if (-not (Test-Path -Path ".\.tutorials_running.txt")) {
    Write-Output "None of the tutorials are running"
    exit 1
}

# These could be changed in future with maven, nodejs, and python
$VAR1 = 1
$VAR2 = 2
$VAR3 = 3
$VAR4 = 4

# Assign file paths to variables VAR1-VAR3L and VARDL for default location
$VARDL = "."
$VAR1L = ".\experimental_docker_compose_files\00_old_one_from_proposal"
$VAR2L = ".\experimental_docker_compose_files\01_simple_controller_plus_agent"
$VAR3L = ".\experimental_docker_compose_files\02_custom_docker_file_connecting_agent_and_controller"
$VAR4L = ".\experimental_docker_compose_files\03_maven_tutorial\"

# Function to stop a tutorial based on the provided path
function Stop-Tutorial {
    param (
        [string]$tutorial_path
    )
    Write-Output "Removing tutorial $tutorial_path"
    docker-compose -f "$tutorial_path/docker-compose.yaml" down --volumes
    $tutorialsRunning = Get-Content -Path ".\.tutorials_running.txt"
    $tutorialsRunning = $tutorialsRunning | Select-Object -First ($tutorialsRunning.Count - 1)
    $tutorialsRunning | Out-File -FilePath ".\.tutorials_running.txt" -Encoding utf8

    git restore "$tutorial_path/docker-compose.yaml"
}

# Loop through the running tutorials and stop them
while ((Test-Path -Path ".\.tutorials_running.txt") -and ((Get-Content -Path ".\.tutorials_running.txt").Count -gt 0)) {
    $TUTORIAL = Get-Content -Path ".\.tutorials_running.txt" | Select-Object -Last 1
    if ($TUTORIAL -eq $VAR1) {
        Stop-Tutorial -tutorial_path $VAR1L
    }
    elseif ($TUTORIAL -eq $VAR2) {
        Stop-Tutorial -tutorial_path $VAR2L
    }
    elseif ($TUTORIAL -eq $VAR3) {
        Stop-Tutorial -tutorial_path $VAR3L
    }
    elseif ($TUTORIAL -eq $VAR4) {
        Stop-Tutorial -tutorial_path $VAR4L
    }
    elseif ($TUTORIAL -eq "0") {
        Stop-Tutorial -tutorial_path $VARDL
    }
    else {
        Write-Output "None of the tutorials are running"
    }
}

Write-Output "All tutorials are closed"
