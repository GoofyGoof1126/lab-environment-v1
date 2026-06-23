# Purpose: Automated script that checks for inactivity
# After 15 minutes of inactivity, automatically locks the 
# workstation to prevent unauthorised access
# POPIA mapping: Section 19(1) - organisational measure
# Schedule: Windows Task Scheduler

# PowerShell Script - Set Machine Inactivity Limit to 15 Minutes

# Define registry path and value
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$valueName = "InactivityTimeoutSecs"
$newValue = 900   # 900 seconds = 15 minutes

# Check if the registry path exists
if (-not (Test-Path $regPath)) {
    Write-Output "Registry path not found. Creating..."
    New-Item -Path $regPath -Force | Out-Null
}

# Set the inactivity timeout value
Set-ItemProperty -Path $regPath -Name $valueName -Value $newValue

# Confirm the change
$currentValue = Get-ItemProperty -Path $regPath -Name $valueName
Write-Output "Inactivity timeout successfully set to $($currentValue.$valueName) seconds."
