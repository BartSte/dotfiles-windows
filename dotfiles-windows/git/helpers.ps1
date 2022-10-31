. ~/dotfiles-windows/config.ps1
. ~/dotfiles-secret/secret-config.ps1

function set_git_config () {
    git config --global --add safe.directory $env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim
    git config --global user.name $git_settings['user']
    git config --global user.email $git_settings['email']
    git config --global core.autocrlf true
}
