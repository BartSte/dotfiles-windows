function symbolic-link-config {
    $target = "${HOME}\.alacritty.toml"
    $directory = "${env:APPDATA}\alacritty" 
    $file = "alacritty.toml" 
    $path = "${directory}\${file}"
    
    write-host $path
    If (!(test-path $directory)) {
        New-Item -ItemType Directory -Force -Path $directory
    } 
    else {
        Remove-Item $path -ErrorAction SilentlyContinue
    }

    New-Item -ItemType SymbolicLink -Path $path -Target $target
}

symbolic-link-config
