function download_trayicon($version)
{
    $source="https://github.com/BartSte/trayicon/releases/download/$version/trayicon-$version.exe"
    $destination_dir="$Env:LOCALAPPDATA\kmonad"
    $destination="$destination_dir\trayicon.exe"

    Write-Host "Downloading Trayicon version: $version"
    Write-Host "URL: $source"
    Write-Host "Saving to: $destination"

    if (-not (Test-Path $destination_dir))
    {
        New-Item -ItemType Directory -Path $destination_dir
    } else
    {
        Remove-Item $destination -ErrorAction SilentlyContinue
    }

    Invoke-WebRequest -Uri $source -OutFile $destination
}

function download_kmonad($version)
{
    $source="https://github.com/kmonad/kmonad/releases/download/$version/kmonad-$version-win.exe"    
    $destination_dir="$Env:LOCALAPPDATA\kmonad"
    $destination="$destination_dir\kmonad.exe"

    Write-Host "Downloading Kmonad version: $version"
    Write-Host "URL: $source"
    Write-Host "Saving to: $destination"

    if (-not (Test-Path $destination_dir))
    {
        New-Item -ItemType Directory -Path $destination_dir
    } else
    {
        Remove-Item $destination -ErrorAction SilentlyContinue
    }

    Invoke-WebRequest -Uri $source -OutFile $destination
}

function symlink_to_desktop
{
    $source = "$HOME\dotfiles-windows\kmonad\start.vbs"
    $destination = "$HOME\Desktop\Kmonad"

    write-host "Symlink Kmonad to Desktop -> $destination"
    Remove-Item $destination -ErrorAction SilentlyContinue
    New-Item -ItemType SymbolicLink -Path $destination -Target $source
}

