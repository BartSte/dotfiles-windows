# Profile for the Microsoft.Powershell Shell, only. (Not Visual Studio or other PoSh instances)
# ===========
Push-Location (Split-Path -parent $profile) 
cd "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools"
Launch-VsDevShell.ps1
clear
Pop-Location

Import-Module Terminal-Icons

Push-Location (Split-Path -parent $profile) 

"env", "vi_mode", "functions", "aliases", "bindings" | 
Where-Object { Test-Path "$_.ps1" } | 
ForEach-Object -process { Invoke-Expression ". .\$_.ps1" }

Pop-Location
