$profileDir = Split-Path -parent $profile
New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue

Install-Module PSFzf
Install-Module Recycle 
Install-Module Terminal-Icons

& '~/dotfiles-windows/fonts/JetBrains Mono Regular Nerd Font Complete Mono Windows Compatible.ttf'

Get-ChildItem -Path $PSScriptRoot -Exclude main.ps1, helpers -Name|
Foreach-Object {
    New-Item -ItemType SymbolicLink -Path $profileDir\$_ -Target $PSScriptRoot\$_ -Force
}
