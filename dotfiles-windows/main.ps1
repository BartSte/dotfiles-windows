Write-Host "Welcome to Dotfiles for Microsoft Windows 11" -ForegroundColor "Yellow";
Write-Host "Please don't use your device while the script is running." -ForegroundColor "Yellow";

# Run other scripts here
. ./powershell/main.ps1
. ./dependencies/main.ps1
. ./windows/main.ps1
. ./vim/main.ps1
. ./vscode/main.ps1

Write-Host "The process has finished." -ForegroundColor "Yellow";
Write-Host "Restarting the PC in 10 seconds..." -ForegroundColor "Green";
#Start-Sleep -Seconds 10;
#Restart-Computer;
