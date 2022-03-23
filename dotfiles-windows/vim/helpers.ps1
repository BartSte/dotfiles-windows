. ./../config.ps1

function Install-Chocolately {
    if ((which cinst) -eq $null) {
        iex (new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')
        Refresh-Environment
        choco feature enable -n=allowGlobalConfirmation
    }
}

function Install-Desktop-Apps {
    foreach($app in $install){
        choco install $app[0] $app[1]
    }
}

