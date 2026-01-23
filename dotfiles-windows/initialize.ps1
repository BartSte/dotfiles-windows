function Install-Scoop {
    if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
        Set-ExecutionPolicy Bypass -Scope Process -Force;
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
        iex (iwr -useb get.scoop.sh)
    }
}

function clone($repo, $directory) {
    git clone --bare $repo $directory
}

function checkout($directory) {
    git --work-tree=$HOME --git-dir=$directory checkout
}

$github="https://github.com/BartSte" 

$base="$github/dotfiles.git" 
$base_dir="$HOME/dotfiles.git"

$win="$github/dotfiles-windows.git"
$win_dir="$HOME/dotfiles-windows.git"

Write-Host "# Installing scoop"
Install-Scoop

Write-Host "# Installing git"
scoop install git

Write-Host "# Clone BartSte/dotfiles.git as a bare repository"
Write-Host $base
clone $base $base_dir -and checkout $base_dir

Write-Host "# Clone BartSte/dotfiles-windows.git as a bare repository"
Write-Host $win
clone $win $win_dir -and checkout $win_dir

if (-not (Test-Path "$HOME/dotfiles-config.ps1")) {
    Copy-Item "$HOME/dotfiles-windows/default_config.ps1" "$HOME/dotfiles-config.ps1"
}

Write-Host "# Please complete the file $HOME/dotfiles-config.ps1"
Write-Host "# Next, run the ~/dotfiles-windows/main.ps1"
