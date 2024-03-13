. ~\dotfiles-windows\helpers.ps1

function New-Symlink($path, $target)
{
    write-host $path
    Remove-Item $path -ErrorAction SilentlyContinue -Recurse
    New-Item -ItemType SymbolicLink -Path $path -Target $target
}

Set-WSL-HOME

$target = "$Env:LH\dotfiles\waka\.wakatime.cfg"
$path = "${env:USERPROFILE}\.wakatime.cfg"

Write-Host "Setting up wakatime"
Write-Host "Creating symlink from $target to $path"
New-Symlink $path $target
