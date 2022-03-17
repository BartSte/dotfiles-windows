function Install-Nuget {
    if (-not (Get-PackageProvider-Installation-Status -PackageProviderName "NuGet")) {
      Write-Host "Installing NuGet as package provider:" -ForegroundColor "Green";
      Install-PackageProvider -Name "NuGet" -Force;
    }
}

function Get-PackageProvider-Installation-Status {
  [CmdletBinding()]
  param(
    [Parameter(Position = 0, Mandatory = $TRUE)]
    [string]
    $PackageProviderName
  )

  try {
    Get-PackageProvider -Name $PackageProviderName;
    return $TRUE;
  }
  catch [Exception] {
    return $FALSE;
  }
}

function Install-PSGallery {
    if (-not (Get-PSRepository-Trusted-Status -PSRepositoryName "PSGallery")) {
      Write-Host "Setting up PSGallery as PowerShell trusted repository:" -ForegroundColor "Green";
      Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted;
    }
}

function Get-PSRepository-Trusted-Status {
  [CmdletBinding()]
  param(
    [Parameter(Position = 0, Mandatory = $TRUE)]
    [string]
    $PSRepositoryName
  )

  try {
    if (-not (Get-PSRepository -Name $PSRepositoryName -ErrorAction SilentlyContinue)) {
      return $FALSE;
    }

    if ((Get-PSRepository -Name $PSRepositoryName).InstallationPolicy -eq "Trusted") {
      return $TRUE;
    }
    return $FALSE;
  }
  catch [Exception] {
    return $FALSE;
  }
}

function Install-PackageManagement {
    if (-not (Get-Module-Installation-Status -ModuleName "PackageManagement" -ModuleMinimumVersion "1.4.6")) {
      Write-Host "Updating PackageManagement module:" -ForegroundColor "Green";
      [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;
      Install-Module -Name "PackageManagement" -Force -MinimumVersion "1.4.6" -Scope "CurrentUser" -AllowClobber -Repository "PSGallery";
    }
}

function Get-Module-Installation-Status {
  [CmdletBinding()]
  param(
    [Parameter(Position = 0, Mandatory = $TRUE)]
    [string]
    $ModuleName,

    [Parameter(Position = 1, Mandatory = $FALSE)]
    [string]
    $ModuleMinimumVersion
  )

  try {
    if (-not ([string]::IsNullOrEmpty($ModuleMinimumVersion))) {
      if ((Get-Module -ListAvailable -Name $ModuleName).Version -ge $ModuleMinimumVersion) {
        return $TRUE;
      }
      return $FALSE;
    }

    if (Get-Module -ListAvailable -Name $ModuleName) {
      return $TRUE;
    }
    else {
      return $FALSE;
    }
  }
  catch [Exception] {
    return $FALSE;
  }
}
