. ~\dotfiles-windows\helpers.ps1

function New-SymbolicLink-Config {
    $target = "$HOME\dotfiles\qutebrowser\config.py"
    $path = "$Env:APPDATA\qutebrowser\config\config.py"

    write-host "SymbolicLink from $path to $target"
    Remove-Item $path -ErrorAction SilentlyContinue
    New-Item -ItemType SymbolicLink -Path $path -Target $target -Force
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

Set-WSL-HOME
New-SymbolicLink-Config
New-SymbolicLink-Urls
New-SymbolicLink-Quickmarks
