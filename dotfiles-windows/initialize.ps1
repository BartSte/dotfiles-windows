function Install-Chocolately {
    if ((which cinst) -eq $null) {
        Set-ExecutionPolicy Bypass -Scope Process -Force; 
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
        iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        Refresh-Environment
        choco feature enable -n=allowGlobalConfirmation
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

Write-Host "# Installing chocolatey"
Install-Chocolately

Write-Host "# Installing git"
choco install git

Write-Host "# Clone BartSte/dotfiles.git as a bare repository"
Write-Host $base
clone $base $base_dir -and checkout $base_dir

Write-Host "# Clone BartSte/dotfiles-windows.git as a bare repository"
Write-Host $win
clone $win $win_dir -and checkout $win_dir
Refresh-Environment

Write-Host "# Please complete the file ~/dotfiles-windows/config.ps1"
Write-Host "# Next, run the ~/dotfiles-windows/main.ps1"

