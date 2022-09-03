function download_kmonad($version) {
    $source="https://github.com/kmonad/kmonad/releases/download/$version/kmonad-$version-win.exe"    
    $destination="$HOME\dotfiles-windows\kmonad\kmonad.exe"

    Write-Host "Downloading Kmonad version: $version"
    Write-Host "URL: $source"
    Write-Host "Saving to: $destination"

    Remove-Item $destination -ErrorAction SilentlyContinue
    wget -Uri $source -Outfile $destination
}

function symlink_to_desktop {
    $source = "$HOME\dotfiles-windows\kmonad\kmonad.bat"
    $destination = "$HOME\Desktop\Kmonad"

    write-host "Symlink Kmonad to Desktop -> $destination"
    Remove-Item $destination -ErrorAction SilentlyContinue
    New-Item -ItemType SymbolicLink -Path $destination -Target $source
}

