# Profile for the Microsoft.Powershell Shell, only. (Not Visual Studio or other PoSh instances)
# ===========

Import-Module -Name Terminal-Icons

Push-Location (Split-Path -parent $profile) 
"functions","aliases", "shortcuts" | Where-Object {Test-Path "$_.ps1"} | ForEach-Object -process {Invoke-Expression ". .\$_.ps1"}

Pop-Location
