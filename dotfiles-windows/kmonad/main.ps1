. $PSScriptRoot\helpers.ps1

rm -r $Env:LOCALAPPDATA\kmonad
download_trayicon "v0.2.2"
download_kmonad "0.4.1"
symlink_to_desktop
