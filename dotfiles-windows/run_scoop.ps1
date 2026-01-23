Write-Host "Installing Scoop dependencies..." -ForegroundColor "Yellow";

if (-not (Test-Path ~\dotfiles-config.ps1))
{
    Write-Host "The file ~\dotfiles-config.ps1 does not exist. Aborting." -ForegroundColor "Red";
    return;
}

$dir = "$HOME/dotfiles-windows"
. "$dir/dependencies/helpers.ps1"

Install-Scoop
Install-Desktop-Apps

Write-Host "Finished!" -ForegroundColor "Yellow";
