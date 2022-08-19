Write-Host "Welcome to Dotfiles for Microsoft Windows 11" -ForegroundColor "Yellow";
Write-Host "Please don't use your device while the script is running." -ForegroundColor "Yellow";

# Run other scripts here
. ~/dotfiles-windows/powershell/main.ps1
. ~/dotfiles-windows/dependencies/main.ps1
. ~/dotfiles-windows/windows/main.ps1
. ~/dotfiles-windows/vim/main.ps1
. ~/dotfiles-windows/alacritty/main.ps1
. ~/dotfiles-windows/powertoys/main.ps1
. ~/dotfiles-windows/kmonad/main.ps1
# . ~/dotfiles-windows/vscode/main.ps1

Write-Host "The process has finished." -ForegroundColor "Yellow";
Write-Host "Restarting the PC in 10 seconds..." -ForegroundColor "Green";
Start-Sleep -Seconds 10;
Restart-Computer;

