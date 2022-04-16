. ~/dotfiles-windows/dependencies/helpers.ps1

Admin-Check;

Write-Host "Updating Help..." -ForegroundColor "Yellow"
Update-Help -Force

Write-Host "Installing Package Providers..." -ForegroundColor "Yellow"
Get-PackageProvider NuGet -Force | Out-Null

Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"
Install-Module PSWindowsUpdate -Scope CurrentUser -Force
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module PSFzf

Write-Host "Installing Desktop Utilities..." -ForegroundColor "Yellow"

Install-NuGet
Install-PSGallery
Install-PackageManagement
Install-Chocolately
Install-Desktop-Apps

Refresh-Environment

