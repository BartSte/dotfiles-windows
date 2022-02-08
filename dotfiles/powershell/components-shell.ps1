# These components will be loaded when running Microsoft.Powershell (i.e. Not Visual Studio)

Push-Location (Split-Path -parent $profile)

# From within the ./components directory...
.\console.ps1

Pop-Location
