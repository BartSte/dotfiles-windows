# These components will be loaded for all PowerShell instances

Push-Location (Split-Path -parent $profile)

# From within the ./components directory...
.\coreaudio.ps1
.\git.ps1

Pop-Location
