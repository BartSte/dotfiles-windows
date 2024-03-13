# CD
${function:~} = { Set-Location ~ }
${function:Set-ParentLocation} = { Set-Location .. }; Set-Alias ".." Set-ParentLocation
${function:...} = { Set-Location ..\.. }
${function:....} = { Set-Location ..\..\.. }
${function:.....} = { Set-Location ..\..\..\.. }
${function:......} = { Set-Location ..\..\..\..\.. }

# Git dotfiles
${function:base} = { git.exe --git-dir="$HOME\dotfiles.git\" --work-tree=$HOME @args }
${function:bases} = { base status -s --untracked-files=no}
${function:basec} = { Write-Host 'Base:'; base add ~/dotfiles; bases; base commit --untracked-files=no -a -m "Automatic update";}

${function:win} = { git.exe --git-dir="$HOME\dotfiles-windows.git\" --work-tree=$HOME @args }
${function:wins} = { win status -s --untracked-files=no }
${function:winc} = { Write-Host 'Win:'; win add ~/dotfiles-windows; wins; win commit --untracked-files=no -a -m "Automatic update";}

${function:dot} = { base @args; win @args }
${function:dots} = { Write-Host 'Base:'; bases; Write-Host 'Win:'; wins }
${function:dotc} = { basec; winc; }
${function:dotp} = { dot push}
${function:dotu} = { dotc; dot pull; dotp }

# Cli
${function:dev} = {& "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\Launch-VsDevShell.ps1"}
${function:dl} = {Remove-ItemSafely @args}
${function:ex} = {explorer.exe .}
${function:touch} = { "" | Out-File $file -Encoding ASCII }
${function:which} = { Get-Command @args -ErrorAction SilentlyContinue | Select-Object Definition }

# Vim
${function:v} = { C:\tools\neovim\nvim-win64\bin\nvim.exe @args }
${function:vims} = { 
    if (Test-Path Session.vim)
    {
        C:\tools\neovim\nvim-win64\bin\nvim.exe -S Session.vim @args 
    } else
    {
        Write-Host "No sesson found."
    }
}

# Python virtualenv
function act
{
    $folder = $(Split-Path -Path (Get-Location) -Leaf)
    $opt1 =  "$PWD\venv"        
    $opt2 =  "$PWD\.venv"

    if (Test-Path $opt1)
    {
        & $(Join-Path -Path $local -Child "Scripts\Activate.ps1")
    } elseif (Test-Path $opt2)
    {
        & $(Join-Path -Path $local -Child "Scripts\Activate.ps1")
    } else
    {
        Write-Host "No python virtualenvironmet found for: $folder"
    }
}

function deact
{
    $folder = $(Split-Path -Path (Get-Location) -Leaf)
    $opt1 =  "$PWD\venv"        
    $opt2 =  "$PWD\.venv"

    if (Test-Path $opt1)
    {
        & $(Join-Path -Path $local -Child "Scripts\Deactivate.ps1")
    } elseif (Test-Path $opt2)
    {
        & $(Join-Path -Path $local -Child "Scripts\Deactivate.ps1")
    } else
    {
        Write-Host "No python virtualenvironmet found for: $folder"
    }
}

# Correct PowerShell Aliases if tools are available (aliases win if set)
# WGet: Use `wget.exe` if available
if (Get-Command wget.exe -ErrorAction SilentlyContinue | Test-Path)
{
    Remove-Item alias:wget -ErrorAction SilentlyContinue
}

# Directory Listing: Use `ls.exe` if available
if (Get-Command ls.exe -ErrorAction SilentlyContinue | Test-Path)
{
    Remove-Item alias:ls -ErrorAction SilentlyContinue
    # Set `ls` to call `ls.exe` and always use --color
    ${function:ls} = { ls.exe --color @args }
    # List all files in long format
    ${function:l} = { ls -lF @args }
    # List all files in long format, including hidden files
    ${function:la} = { ls -laF @args }
    # List only directories
    ${function:ld} = { Get-ChildItem -Directory -Force @args }
} else
{
    # List all files, including hidden files
    ${function:la} = { ls -Force @args }
    # List only directories
    ${function:ld} = { Get-ChildItem -Directory -Force @args }
}

# curl: Use `curl.exe` if available
if (Get-Command curl.exe -ErrorAction SilentlyContinue | Test-Path)
{
    Remove-Item alias:curl -ErrorAction SilentlyContinue
    # Set `ls` to call `ls.exe` and always use --color
    ${function:curl} = { curl.exe @args }
    # Gzip-enabled `curl`
    ${function:gurl} = { curl --compressed @args }
} else
{
    # Gzip-enabled `curl`
    ${function:gurl} = { curl -TransferEncoding GZip }
}
