. ./powershell/main.ps1
. ./helpers.ps1

Write-Host "Welcome to Dotfiles for Microsoft Windows 11" -ForegroundColor "Yellow";
Write-Host "Please don't use your device while the script is running." -ForegroundColor "Yellow";

Install-Nuget;
Install-PSGallery;
Install-PackageManagement;

# Run other scripts here

Write-Host "The process has finished." -ForegroundColor "Yellow";
Write-Host "Restarting the PC in 10 seconds..." -ForegroundColor "Green";
#Start-Sleep -Seconds 10;
#Restart-Computer;
