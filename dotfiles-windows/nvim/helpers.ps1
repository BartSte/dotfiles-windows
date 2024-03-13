function New-Link-Config() {
    Remove-Item "${env:LOCALAPPDATA}\nvim" -ErrorAction SilentlyContinue -Recurse
    mkdir "${env:LOCALAPPDATA}\nvim" -ErrorAction SilentlyContinue   

    $target = "${HOME}\dotfiles\nvim\init.lua"
    $path = "${env:LOCALAPPDATA}\nvim\init.lua" 
    New-Symlink $path $target

    $target = "${HOME}\dotfiles\nvim\ginit.vim"
    $path = "${env:LOCALAPPDATA}\nvim\ginit.vim" 
    New-Symlink $path $target

    $target = "${HOME}\dotfiles\nvim\vim"
    $path = "${env:LOCALAPPDATA}\nvim\vim"
    New-Symlink $path $target

    $target = "${HOME}\dotfiles\nvim\lua"
    $path = "${env:LOCALAPPDATA}\nvim\lua"
    New-Symlink $path $target

    $target = "${HOME}\dotfiles\nvim\lazy-lock.json"
    $path = "${env:LOCALAPPDATA}\nvim\lazy-lock.json"
    New-Hardlink $path $target # must be hardlink
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

function Enable-Python() {
    pip install pynvim
}

function Get-Spell($lang){
    $dir="${env:LOCALAPPDATA}\nvim\spell"
    mkdir "$dir" -ErrorAction SilentlyContinue
    curl -o "$dir/$lang.utf-8.spl" "http://ftp.vim.org/pub/vim/runtime/spell/$lang.utf-8.spl"
}
