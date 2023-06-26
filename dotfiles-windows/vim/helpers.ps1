function symbolic-link-configuration() {
    mkdir "${env:LOCALAPPDATA}\nvim" -ErrorAction SilentlyContinue   

    $target = "${HOME}\dotfiles\nvim\init.lua"
    $path = "${env:LOCALAPPDATA}\nvim\init.lua" 
    _symlink $path $target

    $target = "${HOME}\dotfiles\nvim\lua"
    $path = "${env:LOCALAPPDATA}\nvim\lua"
    _symlink $path $target

    $target = "${HOME}\dotfiles\nvim\plugin"
    $path = "${env:LOCALAPPDATA}\nvim\plugin"
    _symlink $path $target

    $target = "${HOME}\dotfiles\nvim\vim"
    $path = "${env:LOCALAPPDATA}\nvim\vim"
    _symlink $path $target

    $target = "${HOME}\dotfiles\nvim\after"
    $path = "${env:LOCALAPPDATA}\nvim\after"
    _symlink $path $target
}

function _symlink($path, $target) {
    write-host $path
    Remove-Item $path -ErrorAction SilentlyContinue -Recurse
    New-Item -ItemType SymbolicLink -Path $path -Target $target
}

function enable_python() {
    pip install pynvim
}

function install_packer {
    rm "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim" -Recurse -Force
    git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
}
