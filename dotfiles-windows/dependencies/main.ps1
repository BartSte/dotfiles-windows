. ~/dotfiles-windows/dependencies/helpers.ps1

Admin-Check;

Write-Host "Updating Help..." -ForegroundColor "Yellow"
Update-Help -Force

Write-Host "Installing Package Providers..." -ForegroundColor "Yellow"
Install-NuGet
Install-PSGallery
Install-PackageManagement

Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"
Install-Module PSWindowsUpdate -Scope CurrentUser -Force
Install-Module PSReadline -Scope CurrentUser -Force
Install-Module PSFzf
Install-Module Terminal-Icons
Install-Module Recycle 
symlink-dotfile-scripts

Write-Host "Installing Desktop Utilities..." -ForegroundColor "Yellow"
Install-Chocolately
Install-Desktop-Apps

Refresh-Environment

