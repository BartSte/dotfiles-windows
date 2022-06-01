# Profile for the Microsoft.Powershell Shell, only. (Not Visual Studio or other PoSh instances)
# ===========

Import-Module -Name Terminal-Icons

~/dotfiles-windows/powershell/helpers/set_font.ps1 'JetBrainsMono NF' 16

Push-Location (Split-Path -parent $profile) 

"functions", "aliases", "fzf" | 
Where-Object { Test-Path "$_.ps1" } | 
ForEach-Object -process { Invoke-Expression ". .\$_.ps1" }

Pop-Location
