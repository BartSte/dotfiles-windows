function Download-CapslockIndicator($version)
{
    $source="https://github.com/jonaskohl/CapsLockIndicator/releases/download/$version/CLIv3-$version.exe"
    $destination_dir="$Env:LOCALAPPDATA\capslockindicator"
    $destination="$destination_dir\capslockindicator.exe"

    Write-Host "Downloading CapsLockIndicator version: $version"
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


function New-Symlink-Exe {
    $target = "$Env:LOCALAPPDATA\capslockindicator\capslockindicator.exe"
    $path = "$HOME\Desktop\Capslock-indicator"

    write-host "SymbolicLink from $target to $path"
    New-Item -ItemType SymbolicLink -Path $path -Target $target -Force
}

function New-Symlink-Config {
    $target = "$HOME\dotfiles-windows\capslock\usercfg"
    $dir = "$HOME\AppData\Roaming\Jonas Kohl\CapsLock Indicator\settings\any"
    $path = "$dir\usercfg"

    write-host "SymbolicLink from $target to $path"
    New-Item -ItemType Directory -Path $dir -Force
    New-Item -ItemType SymbolicLink -Path $path -Target $target -Force
}

Download-CapslockIndicator "3.16.1.2"
New-Symlink-Exe
New-Symlink-Config
