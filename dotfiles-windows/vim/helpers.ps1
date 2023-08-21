function symbolic-link-configuration() {
    mkdir "${env:LOCALAPPDATA}\nvim" -ErrorAction SilentlyContinue   

    $target = "${HOME}\dotfiles\nvim\init.lua"
    $path = "${env:LOCALAPPDATA}\nvim\init.lua" 
    New-Symlink $path $target

    $target = "${HOME}\dotfiles\nvim\lua"
    $path = "${env:LOCALAPPDATA}\nvim\lua"
    New-Symlink $path $target

    $target = "${HOME}\dotfiles\nvim\plugin"
    $path = "${env:LOCALAPPDATA}\nvim\plugin"
    New-Symlink $path $target

    $target = "${HOME}\dotfiles\nvim\vim"
    $path = "${env:LOCALAPPDATA}\nvim\vim"
    New-Symlink $path $target

    $target = "${HOME}\dotfiles\nvim\after"
    $path = "${env:LOCALAPPDATA}\nvim\after"
    New-Symlink $path $target

    $target = "${HOME}\dotfiles\nvim\lazy-lock.json"
    $path = "${env:LOCALAPPDATA}\nvim\lazy-lock.json"
    New-Hardlink $path $target
}

function New-Symlink($path, $target) {
    write-host $path
    Remove-Item $path -ErrorAction SilentlyContinue -Recurse
    New-Item -ItemType SymbolicLink -Path $path -Target $target
}

function New-Hardlink($path, $target) {
    write-host $path
    Remove-Item $path -ErrorAction SilentlyContinue -Recurse
    New-Item -ItemType Hardlink -Path $path -Target $target
}

function enable_python() {
    pip install pynvim
}

function install_packer {
    rm "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim" -Recurse -Force
    git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
}
