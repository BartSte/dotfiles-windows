# Profile for the Microsoft.Powershell Shell, only. (Not Visual Studio or other PoSh instances)
# ===========
Import-Module Terminal-Icons

Push-Location (Split-Path -parent $profile) 

"vi_mode", "functions", "aliases", "env", "bindings" | 
Where-Object { Test-Path "$_.ps1" } | 
ForEach-Object -process { Invoke-Expression ". .\$_.ps1" }

Pop-Location
