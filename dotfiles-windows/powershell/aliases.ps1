${function:~} = { Set-Location ~ }
${function:Set-ParentLocation} = { Set-Location .. }; Set-Alias ".." Set-ParentLocation
${function:...} = { Set-Location ..\.. }
${function:....} = { Set-Location ..\..\.. }
${function:.....} = { Set-Location ..\..\..\.. }
${function:......} = { Set-Location ..\..\..\..\.. }

${function:vim} = { C:\tools\neovim\nvim-win64\bin\nvim.exe @args }
${function:gvim} = { C:\tools\neovim\nvim-win64\bin\nvim-qt.exe @args }
${function:base} = { git.exe --git-dir="$HOME\dotfiles.git\" --work-tree=$HOME @args }
${function:win} = { git.exe --git-dir="$HOME\dotfiles-windows.git\" --work-tree=$HOME @args }
${function:sec} = { git.exe --git-dir="$HOME\dotfiles-secret.git\" --work-tree=$HOME @args }
${function:bases} = { git.exe --git-dir="$HOME\dotfiles.git\" --work-tree=$HOME status -s --untracked-files=no}
${function:wins} = { git.exe --git-dir="$HOME\dotfiles-windows.git\" --work-tree=$HOME status -s --untracked-files=no }
${function:secs} = { git.exe --git-dir="$home\dotfiles-secret.git\" --work-tree=$HOME status -s --untracked-files=no }
${function:dots} = {Write-Host 'Base:'; bases; Write-Host 'Win:'; wins; Write-Host 'Sec:' secs}
${function:pushs} = {base push; win push; sec push}
${function:pulls} = {base pull; win pull; sec pull}

${function:ex} = {explorer.exe .}
${function:act} = {.venv/Scripts/Activate.ps1}
${function:dact} = {deactivate}
${function:test} = {python -m unittest discover -v -s @args}

${function:rm} = {Remove-ItemSafely @args}
${function:rm -r} = {Remove-ItemSafely -Recusively @args}

# Missing Bash aliases
Set-Alias time Measure-Command

# Correct PowerShell Aliases if tools are available (aliases win if set)
# WGet: Use `wget.exe` if available
if (Get-Command wget.exe -ErrorAction SilentlyContinue | Test-Path) {
  rm alias:wget -ErrorAction SilentlyContinue
}

# Directory Listing: Use `ls.exe` if available
if (Get-Command ls.exe -ErrorAction SilentlyContinue | Test-Path) {
    rm alias:ls -ErrorAction SilentlyContinue
    # Set `ls` to call `ls.exe` and always use --color
    ${function:ls} = { ls.exe --color @args }
    # List all files in long format
    ${function:l} = { ls -lF @args }
    # List all files in long format, including hidden files
    ${function:la} = { ls -laF @args }
    # List only directories
    ${function:ld} = { Get-ChildItem -Directory -Force @args }
} else {
    # List all files, including hidden files
    ${function:la} = { ls -Force @args }
    # List only directories
    ${function:ld} = { Get-ChildItem -Directory -Force @args }
}

# curl: Use `curl.exe` if available
if (Get-Command curl.exe -ErrorAction SilentlyContinue | Test-Path) {
    rm alias:curl -ErrorAction SilentlyContinue
    # Set `ls` to call `ls.exe` and always use --color
    ${function:curl} = { curl.exe @args }
    # Gzip-enabled `curl`
    ${function:gurl} = { curl --compressed @args }
} else {
    # Gzip-enabled `curl`
    ${function:gurl} = { curl -TransferEncoding GZip }
}

# Create a new directory and enter it
Set-Alias mkd CreateAndSet-Directory

# Determine size of a file or total size of a directory
Set-Alias fs Get-DiskUsage

# Empty the Recycle Bin on all drives
Set-Alias emptytrash Empty-RecycleBin

# Cleanup old files all drives
Set-Alias cleandisks Clean-Disks

# Reload the shell
Set-Alias reload Reload-Powershell

# Update installed Ruby Gems, NPM, and their installed packages.
Set-Alias update System-Update

