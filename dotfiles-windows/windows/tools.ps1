function Admin-Check {
    if (!(Verify-Elevated)) {
       $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
       $newProcess.Arguments = $myInvocation.MyCommand.Definition;
       $newProcess.Verb = "runas";
       [System.Diagnostics.Process]::Start($newProcess);
       exit
    }
}

function Set-WindowsExplorer-ShowFileExtensions {
  Write-Host "Configuring Windows File Explorer to show file extensions:" -ForegroundColor "Green";

  $RegPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
  Set-ItemProperty -Path $RegPath -Name "HideFileExt" -Value 0;
}

function Set-WindowsFileExplorer-StartFolder {
  Write-Host "Configuring start folder of Windows File Explorer:" -ForegroundColor "Green";

  $RegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";

  if (-not (Test-PathRegistryKey -Path $RegPath -Name "LaunchTo")) {
    New-ItemProperty -Path $RegPath -Name "LaunchTo" -PropertyType DWord;
  }

  Set-ItemProperty -Path $RegPath -Name "LaunchTo" -Value 0; # [This PC: 1], [Quick access: 2], [Downloads: 3]
}

function Set-Multitasking-Configuration {
  Write-Host "Configuring Multitasking settings (Snap layouts):" -ForegroundColor "Green";
  
  $RegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";

  # When I snap a window, show what I can snap next to it.
  Set-ItemProperty -Path $RegPath -Name "SnapAssist" -Value 0;
  # Show snap layouts that the app is part of when I hover over the taskbar buttons.
  Set-ItemProperty -Path $RegPath -Name "EnableTaskGroups" -Value 0;
  # When I resize a snapped window, simultaneously resize any adjacent snapped window.
  Set-ItemProperty -Path $RegPath -Name "JointResize" -Value 0;

  # Show snap layout when I hover over a window's maximize button.
  Set-ItemProperty -Path $RegPath -Name "EnableSnapAssistFlyout" -Value 0;
  # When I drag a window, let me snap it without dragging all the way to the screen edge.
  Set-ItemProperty -Path $RegPath -Name "DITest" -Value 0;
  # When I snap a window, automatically size it to fill available space.
  Set-ItemProperty -Path $RegPath -Name "SnapFill" -Value 0;

  Write-Host "Multitasking successfully updated." -ForegroundColor "Green";
}

function Set-Classic-ContextMenu-Configuration {
  Write-Host "Activating classic Context Menu:" -ForegroundColor "Green";

  $RegPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}";
  $RegKey = "(Default)";

  if (-not (Test-Path -Path $RegPath)) {
    New-Item -Path $RegPath;
  }
  
  $RegPath = $RegPath | Join-Path -ChildPath "InprocServer32";

  if (-not (Test-Path -Path $RegPath)) {
    New-Item -Path $RegPath;
  }

  if (-not (Test-PathRegistryKey -Path $RegPath -Name $RegKey)) {
    New-ItemProperty -Path $RegPath -Name $RegKey -PropertyType String;
  }
  Set-ItemProperty -Path $RegPath -Name $RegKey -Value "";
  
  Write-Host "Classic Context Menu successfully activated." -ForegroundColor "Green";
}

function Set-SetAsBackground-To-Extended-ContextMenu {
  Write-Host "Configuring Context Menu to show the option 'Set as Background' just in Extended Context Menu:" -ForegroundColor "Green";

  $Extensions = ".bmp", ".dib", ".gif", ".jfif", ".jpe", ".jpeg", ".jpg", ".png", ".tif", ".tiff", ".wdp";

  foreach ($Extension in $Extensions) {
    $RegPath = "HKCR:\SystemFileAssociations\${Extension}\Shell\setdesktopwallpaper";

    if (Test-Path $RegPath) {
      if (-not (Test-PathRegistryKey -Path $RegPath -Name "Extended")) {
        New-ItemProperty -Path $RegPath -Name "Extended" -PropertyType String;
      }
    }
  }
}

function Disable-RecentlyOpenedItems-From-JumpList {
  Write-Host "Configuring Jump List to do not show the list of recently opened items:" -ForegroundColor "Green";

  $RegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
  if (-not (Test-PathRegistryKey -Path $RegPath -Name "Start_TrackDocs")) {
    New-ItemProperty -Path $RegPath -Name "Start_TrackDocs" -PropertyType DWord;
  }
  Set-ItemProperty -Path $RegPath -Name "Start_TrackDocs" -Value 0;
}

function Set-Power-Configuration {
  Write-Host "Configuring power plan:" -ForegroundColor "Green";
  # AC: Alternating Current (Wall socket).
  # DC: Direct Current (Battery).

  # Set turn off disk timeout (in minutes / 0: never)
  powercfg -change "disk-timeout-ac" 0;
  powercfg -change "disk-timeout-dc" 0;
  
  # Set hibernate timeout (in minutes / 0: never)
  powercfg -change "hibernate-timeout-ac" 0;
  powercfg -change "hibernate-timeout-dc" 0;

  # Set sleep timeout (in minutes / 0: never)
  powercfg -change "standby-timeout-ac" 0;
  powercfg -change "standby-timeout-dc" 0;

  # Set turn off screen timeout (in minutes / 0: never)
  powercfg -change "monitor-timeout-ac" 10;
  powercfg -change "monitor-timeout-dc" 10;

  # Set turn off screen timeout on lock screen (in seconds / 0: never)
  powercfg /SETACVALUEINDEX SCHEME_CURRENT SUB_VIDEO VIDEOCONLOCK 30;
  powercfg /SETDCVALUEINDEX SCHEME_CURRENT SUB_VIDEO VIDEOCONLOCK 30;
  powercfg /SETACTIVE SCHEME_CURRENT;

  Write-Host "Power plan successfully updated." -ForegroundColor "Green";
}

function Set-Custom-Regional-Format {
  Write-Host "Configuring Regional format:" -ForegroundColor "Green";

  $RegPath = "HKCU:\Control Panel\International";

  Set-ItemProperty -Path $RegPath -Name "iFirstDayOfWeek" -Value "0";
  Set-ItemProperty -Path $RegPath -Name "sShortDate" -Value "dd-MM-yyyy";
  Set-ItemProperty -Path $RegPath -Name "sLongDate" -Value "dddd, d MMMM, yyyy";
  Set-ItemProperty -Path $RegPath -Name "sShortTime" -Value "HH:mm";
  Set-ItemProperty -Path $RegPath -Name "sTimeFormat" -Value "HH:mm:ss";

  Write-Host "Regional format successfully updated." -ForegroundColor "Green";
}

function Rename-PC($computer_name) {
  if ($env:COMPUTERNAME -ne $computer_name) {
    Write-Host "Renaming PC:" -ForegroundColor "Green";

    Rename-Computer -NewName $computer_name -Force;

    Write-Host "PC renamed, restart it to see the changes." -ForegroundColor "Green";
  }
  else {
    Write-Host "The PC name is $computer_name it is not necessary to rename it." -ForegroundColor "Green";
  }
}

function Get-WindowsFeature-Installation-Status {
  [CmdletBinding()]
  param(
    [Parameter(Position = 0, Mandatory = $TRUE)]
    [string]
    $FeatureName
  )

  if ((Get-WindowsOptionalFeature -FeatureName $FeatureName -Online).State -eq "Enabled") {
    return $TRUE;
  }
  else {
    return $FALSE;
  }
}

function Disable-WindowsFeature {
  [CmdletBinding()]
  param (
    [Parameter( Position = 0, Mandatory = $TRUE)]
    [String]
    $FeatureKey,

    [Parameter( Position = 1, Mandatory = $TRUE)]
    [String]
    $FeatureName
  )

  if (Get-WindowsFeature-Installation-Status $FeatureKey) {
    Write-Host "Disabling" $FeatureName ":" -ForegroundColor "Green";
    Disable-WindowsOptionalFeature -FeatureName $FeatureKey -Online -NoRestart;
  }
  else {
    Write-Host $FeatureName "is already disabled." -ForegroundColor "Green";
  }
}

function Enable-WindowsFeature {
  [CmdletBinding()]
  param (
    [Parameter( Position = 0, Mandatory = $TRUE)]
    [String]
    $FeatureKey,

    [Parameter( Position = 1, Mandatory = $TRUE)]
    [String]
    $FeatureName
  )

  if (-not (Get-WindowsFeature-Installation-Status $FeatureKey)) {
    Write-Host "Enabling" $FeatureName ":" -ForegroundColor "Green";
    Enable-WindowsOptionalFeature -FeatureName $FeatureKey -Online -All -NoRestart;
  }
  else {
    Write-Host $FeatureName "is already enabled." -ForegroundColor "Green";
  }
}

function Test-PathRegistryKey {
  [CmdletBinding()]
  param (
    [Parameter( Position = 0, Mandatory = $TRUE)]
    [String]
    $Path,

    [Parameter( Position = 1, Mandatory = $TRUE)]
    [String]
    $Name
  )

  try {
    $Reg = Get-ItemPropertyValue -Path $Path -Name $Name;
    Return $TRUE;
  }
  catch {
    Return $FALSE;
  }
}

function Set-PSDrive-HKCR {
  Write-Host "Setting alias of HKEY_CLASSES_ROOT:" -ForegroundColor "Green";
  New-PSDrive -PSProvider "registry" -Root "HKEY_CLASSES_ROOT" -Name "HKCR" -Scope global;
}

function Uninstall-AppPackage {
  [CmdletBinding()]
  param (
    [Parameter( Position = 0, Mandatory = $TRUE)]
    [String]
    $Name
  )

  try {
    Get-AppxPackage $Name -AllUsers | Remove-AppxPackage;
    Get-AppXProvisionedPackage -Online | Where-Object DisplayName -like $Name | Remove-AppxProvisionedPackage -Online;    
  }
  catch {
    
  }  
}

