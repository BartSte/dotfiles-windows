function symbolic-link-config {
    $target = "${HOME}\.alacritty.yml"
    $directory = "${env:APPDATA}\alacritty" 
    $file = "alacritty.yml" 
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
