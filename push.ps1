# Pushes this folder to https://github.com/NTT-DATA-PT-IoT-AoE/TelcoOfferingMVP
# Prerequisite: the empty repo TelcoOfferingMVP already exists on GitHub.
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot
$remote = "https://github.com/NTT-DATA-PT-IoT-AoE/TelcoOfferingMVP.git"

if (-not (Test-Path ".git")) { git init -b main }
git add -A
git diff --cached --quiet
if ($LASTEXITCODE -ne 0) { git commit -m "Telco Capability Landscape v1.0" }

$existing = git remote 2>$null
if ($existing -contains "origin") { git remote set-url origin $remote } else { git remote add origin $remote }

git branch -M main
git push -u origin main
Write-Host "`nDone. Now enable Pages: repo Settings > Pages > Deploy from a branch > main / (root)."
