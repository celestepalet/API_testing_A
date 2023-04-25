# Sets PYTHONPATH to the project root path
$env:PYTHONPATH = "$pwd"

# Sets the environment variables of the .env file
$envFile = Get-Content ".env"
foreach ($line in $envFile) {
    $envVar = $line.split("=")
    Set-Item -Path "ENV:\$($envVar[0])" -Value "$($envVar[1])"
}

# Runs the tests located in e2e folder
robot -d Results wordpress/tests/e2e/

# 3-seconds pause
Start-Sleep -Seconds 3

# Creates a new reports based on tests logs
robotmetrics -I .\results\ -M results\new_report.html

# 3-seconds pause
Start-Sleep -Seconds 3

# Open the reports in browser
Invoke-Item results\new_report.html
