$profileDir = Split-Path -parent $profile
New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue

Get-ChildItem -Path $PSScriptRoot -Exclude main.ps1, helpers -Name|
Foreach-Object {
    New-Item -ItemType SymbolicLink -Path $profileDir\$_ -Target $PSScriptRoot\$_ -Force
    New-Item -ItemType SymbolicLink -Path $profileDir\$_ -Target $PSScriptRoot\$_ -Force
}
