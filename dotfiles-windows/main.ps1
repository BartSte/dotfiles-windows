Write-Host "Welcome to Dotfiles for Microsoft Windows 11" -ForegroundColor "Yellow";
Write-Host "Please don't use your device while the script is running." -ForegroundColor "Yellow";

if (-not (Test-Path ~\dotfiles-config.ps1))
{
    Write-Host "The file ~\dotfiles-config.ps1 does not exist. Aborting." -ForegroundColor "Red";
    return;
}

$dir = "$HOME/dotfiles-windows"
. "$dir/powershell/main.ps1"
. "$dir/dependencies/main.ps1"
. "$dir/windows/main.ps1"
. "$dir/git/main.ps1"
. "$dir/nvim/main.ps1"
. "$dir/alacritty/main.ps1"
. "$dir/powertoys/main.ps1"
. "$dir/kmonad/main.ps1"
. "$dir/capslock/main.ps1"
. "$dir/qutebrowser/main.ps1"
. "$dir/waka/main.ps1"

Write-Host "Finished!" -ForegroundColor "Yellow";
