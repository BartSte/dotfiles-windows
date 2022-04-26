. ~/dotfiles-windows/config.ps1

function symbolic-link-configuration {
    $target = "${HOME}\.vimrc"
    $path = "${env:LOCALAPPDATA}\nvim\init.vim" 

    write-host $path
    Remove-Item $path -ErrorAction SilentlyContinue
    New-Item -ItemType SymbolicLink -Path $path -Target $target
}

function install_vim_plug() {
    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
        ni $HOME/vimfiles/autoload/plug.vim -Force
}

function install_vim_plug_nvim() {
    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
        ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
}

function install_vim_lsp() {
    foreach($lsp in $lsps){
        Write-Host "Install lsp: $lsp"
        vim -c "CocInstall $lsp | qa"
    }
}

Admin-Check
# symbolic-link-configuration 
# install_vim_plug
install_vim_lsp
# install_vim_plug_nvim
