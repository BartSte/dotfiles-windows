. ~/dotfiles-windows/dependencies/helpers.ps1

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

Write-Host "Installing Desktop Utilities..." -ForegroundColor "Yellow"
Install-Scoop
Install-Desktop-Apps
