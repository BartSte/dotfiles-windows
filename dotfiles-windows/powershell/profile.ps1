# Profile for the Microsoft.Powershell Shell, only. (Not Visual Studio or other PoSh instances)
# ===========

Import-Module -Name Terminal-Icons

# Override PSReadLine's history search
Set-PsFzfOption -PSReadlineChordProvider 'alt+o' `
                -PSReadlineChordSetLocation 'alt+d' `
                -PSReadlineChordReverseHistory 'Ctrl+r' `
                -PSReadlineChordReverseHistoryArgs 'alt+c'

# Override default tab completion
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

Push-Location (Split-Path -parent $profile) 
"functions","aliases" | Where-Object {Test-Path "$_.ps1"} | ForEach-Object -process {Invoke-Expression ". .\$_.ps1"}

Pop-Location
