function New-SymbolicLink-Config {
    $target = "$HOME\dotfiles\qutebrowser\config.py"
    $path = "$Env:APPDATA\qutebrowser\config\config.py"

    write-host "SymbolicLink from $path to $target"
    Remove-Item $path -ErrorAction SilentlyContinue
    New-Item -ItemType SymbolicLink -Path $path -Target $target -Force
}

function New-SymbolicLink-Urls {
    $target = "$HOME\Dropbox\Config\urls"
    $path = "$Env:APPDATA\qutebrowser\config\bookmarks\urls"
    
    write-host "SymbolicLink from $path to $target"
    New-Item -ItemType SymbolicLink -Path $path -Target $target -Force
}

function New-SymbolicLink-Quickmarks {
    $target = "$HOME\Dropbox\Config\quickmarks"
    $path = "$Env:APPDATA\qutebrowser\config\quickmarks"
    
    write-host "SymbolicLink from $path to $target"
    New-Item -ItemType SymbolicLink -Path $path -Target $target -Force
}

New-SymbolicLink-Config
New-SymbolicLink-Urls
New-SymbolicLink-Quickmarks
