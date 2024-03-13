function New-Symlink-Exe {
    $target = "$HOME\dotfiles-windows\capslock\CLIv3-3.16.1.2.exe"
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

New-Symlink-Exe
New-Symlink-Config
