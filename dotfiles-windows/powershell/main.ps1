$profileDir = Split-Path -parent $profile
New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue

Import-Module PSFzf
Install-Module Recycle 

Get-ChildItem -Path $PSScriptRoot -Exclude main.ps1 -Name|
Foreach-Object {
    New-Item -ItemType SymbolicLink -Path $profileDir\$_ -Target $PSScriptRoot\$_ -Force
}
