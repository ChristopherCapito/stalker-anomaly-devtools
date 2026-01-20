# Deploy gamedata to Anomaly
# Usage: .\deploy.ps1

$Source = "$PSScriptRoot\gamedata"
$Destination = "C:\Anomaly\gamedata"

Write-Host "Deploying DevTools gamedata..." -ForegroundColor Cyan
Write-Host "  From: $Source" -ForegroundColor Gray
Write-Host "  To:   $Destination" -ForegroundColor Gray

if (-not (Test-Path $Source)) {
    Write-Host "ERROR: Source folder not found: $Source" -ForegroundColor Red
    exit 1
}

# Create destination if it doesn't exist
if (-not (Test-Path $Destination)) {
    New-Item -ItemType Directory -Path $Destination -Force | Out-Null
}

# Copy with overwrite
Copy-Item -Path "$Source\*" -Destination $Destination -Recurse -Force

Write-Host "DevTools deploy complete!" -ForegroundColor Green
