# Package DevTools for distribution (ModDB, Nexus, etc.)
# Usage: .\package.ps1

$ModName = "Anomaly_DevTools"
$Version = "1.1.2"
$OutputDir = "$PSScriptRoot\releases"
$ZipName = "${ModName}_v${Version}.zip"

Write-Host "Packaging $ModName v$Version..." -ForegroundColor Cyan

# Create releases folder if needed
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
}

# Files to include in the package
$FilesToInclude = @(
    "gamedata",
    "README.txt",
    "meta.ini"
)

# Create a temp folder for clean packaging
$TempDir = "$env:TEMP\$ModName"
if (Test-Path $TempDir) {
    Remove-Item -Path $TempDir -Recurse -Force
}
New-Item -ItemType Directory -Path $TempDir -Force | Out-Null

# Copy files to temp
foreach ($item in $FilesToInclude) {
    $sourcePath = "$PSScriptRoot\$item"
    if (Test-Path $sourcePath) {
        Copy-Item -Path $sourcePath -Destination $TempDir -Recurse -Force
        Write-Host "  Added: $item" -ForegroundColor Gray
    } else {
        Write-Host "  WARNING: Not found: $item" -ForegroundColor Yellow
    }
}

# Remove the detailed README (keep only user-facing README.txt)
$DetailedReadme = "$TempDir\gamedata\scripts\devtools_README.md"
if (Test-Path $DetailedReadme) {
    # Keep it - it's useful documentation
    Write-Host "  Included: devtools_README.md (detailed docs)" -ForegroundColor Gray
}

# Create zip
$ZipPath = "$OutputDir\$ZipName"
if (Test-Path $ZipPath) {
    Remove-Item -Path $ZipPath -Force
}

Compress-Archive -Path "$TempDir\*" -DestinationPath $ZipPath -CompressionLevel Optimal

# Cleanup temp
Remove-Item -Path $TempDir -Recurse -Force

# Show result
$ZipSize = (Get-Item $ZipPath).Length / 1KB
Write-Host ""
Write-Host "Package created successfully!" -ForegroundColor Green
Write-Host "  Output: $ZipPath" -ForegroundColor Cyan
Write-Host "  Size: $([math]::Round($ZipSize, 2)) KB" -ForegroundColor Cyan
Write-Host ""
Write-Host "Ready to upload to ModDB!" -ForegroundColor Yellow
