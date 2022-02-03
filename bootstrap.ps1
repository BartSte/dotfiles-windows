$profileDir = Split-Path -parent $profile

New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue

New-Item -ItemType SymbolicLink -Path $profileDir/aliases.ps1 -Target $home/aliases.ps1
New-Item -ItemType SymbolicLink -Path $profileDir/components.ps1 -Target $home/components.ps1
New-Item -ItemType SymbolicLink -Path $profileDir/components-shell.ps1 -Target $home/components-shell.ps1
New-Item -ItemType SymbolicLink -Path $profileDir/console.ps1 -Target $home/console.ps1
New-Item -ItemType SymbolicLink -Path $profileDir/coreaudio.ps1 -Target $home/coreaudio.ps1
New-Item -ItemType SymbolicLink -Path $profileDir/deps.ps1 -Target $home/deps.ps1
New-Item -ItemType SymbolicLink -Path $profileDir/exports.ps1 -Target $home/exports.ps1
New-Item -ItemType SymbolicLink -Path $profileDir/functions.ps1 -Target $home/functions.ps1
New-Item -ItemType SymbolicLink -Path $profileDir/git.ps1 -Target $home/git.ps1
New-Item -ItemType SymbolicLink -Path $profileDir/Microsoft.PowerShell_profile.ps1 -Target $home/Microsoft.PowerShell_profile.ps1
New-Item -ItemType SymbolicLink -Path $profileDir/profile.ps1 -Target $home/profile.ps1
New-Item -ItemType SymbolicLink -Path $profileDir/windows.ps1 -Target $home/windows.ps1

Remove-Variable profileDir
