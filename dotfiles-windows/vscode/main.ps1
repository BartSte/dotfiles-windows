. ~\dotfiles-windows\vscode\helpers.ps1
. ~\dotfiles-config.ps1

Hard-Link-VSCode-Configurations;
refreshenv;
ForEach($extension in $vscode_extensions) {
    code --install-extension $extension
}
