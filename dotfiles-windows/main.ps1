Write-Host "Welcome to Dotfiles for Microsoft Windows 11" -ForegroundColor "Yellow";
Write-Host "Please don't use your device while the script is running." -ForegroundColor "Yellow";

# Run other scripts here
$dir = "$HOME/dotfiles-windows"
. "$dir/powershell/main.ps1"
. "$dir/dependencies/main.ps1"
. "$dir/windows/main.ps1"
. "$dir/vim/main.ps1"
. "$dir/alacritty/main.ps1"
. "$dir/powertoys/main.ps1"
. "$dir/kmonad/main.ps1"
. "$dir/capslock/main.ps1"
. "$dir/qutebrowser/main.ps1"
. "$dir/waka/main.ps1"
# . $dir/vscode/main.ps1"

Write-Host "The process has finished." -ForegroundColor "Yellow";
Write-Host "Restarting the PC in 10 seconds..." -ForegroundColor "Green";
Start-Sleep -Seconds 10;
Restart-Computer;

