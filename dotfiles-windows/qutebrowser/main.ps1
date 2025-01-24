. ~\dotfiles-windows\helpers.ps1

function New-SymbolicLink-Config {
    param (
        [string]$SourceDir = "$HOME\dotfiles\qutebrowser",
        [string]$DestinationDir = "$Env:APPDATA\qutebrowser\config"
    )

    Write-Host "Ensure $DestinationDir exists"
    New-Item -ItemType Directory -Force -Path $DestinationDir | Out-Null

    Write-Host "Link all files from $SourceDir to $DestinationDir"
    $files = Get-ChildItem -Path $SourceDir -File

    foreach ($file in $files) {
        $source = Join-Path -Path $SourceDir -ChildPath $file.Name
        $destination = Join-Path -Path $DestinationDir -ChildPath $file.Name

        Write-Host "Link $source to $destination"
        New-Item -ItemType SymbolicLink -Path $destination -Target $source -Force
    }
}


# Uses the quickmarks file from the dotfiles repo from WSL. See the environment 
# variable LH.
function New-SymbolicLink-Urls {
    $target = "$Env:LH\dropbox\Config\urls-$(hostname)"
    $path = "$Env:APPDATA\qutebrowser\config\bookmarks\urls"
    
    write-host "SymbolicLink from $path to $target"
    New-Item -ItemType SymbolicLink -Path $path -Target $target -Force
}

# Uses the quickmarks file from the dotfiles repo from WSL. See the environment 
# variable LH.
function New-SymbolicLink-Quickmarks {
    $target = "$Env:LH\dropbox\Config\quickmarks-$(hostname)"
    $path = "$Env:APPDATA\qutebrowser\config\quickmarks"
    
    write-host "SymbolicLink from $path to $target"
    New-Item -ItemType SymbolicLink -Path $path -Target $target -Force
}

# Uses the greasemonkey files from the dotfiles repo from WSL. See the environment
# variable LH.
function New-SymbolicLink-Greasemonkey {
    $source_dir = "$Env:LH\dropbox\Config\tampermonkey"
    $destination_dir = "$Env:APPDATA\qutebrowser\config\greasemonkey"

    $source_files = Get-ChildItem -Path $source_dir -File
    foreach ($file in $source_files) {
        $source = Join-Path -Path $source_dir -ChildPath $file.Name
        $destination = Join-Path -Path $destination_dir -ChildPath $file.Name

        write-host "SymbolicLink from $destination to $source"
        New-Item -ItemType SymbolicLink -Path $destination -Target $source -Force
    }
}

Set-WSL-HOME
New-SymbolicLink-Config
New-SymbolicLink-Urls
New-SymbolicLink-Quickmarks
New-SymbolicLink-Greasemonkey
