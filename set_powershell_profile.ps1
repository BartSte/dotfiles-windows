$profileDir = Split-Path -parent $profile
New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue

Get-ChildItem -Path "~\.profile" -Filter *.ps1 | 
Foreach-Object {
    New-Item -ItemType SymbolicLink -Path $profileDir/$_ -Target $_.FullName
}

Remove-Variable profileDir
