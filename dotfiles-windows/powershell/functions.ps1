# Basic commands
function which($name) { Get-Command $name -ErrorAction SilentlyContinue | Select-Object Definition }
function touch($file) { "" | Out-File $file -Encoding ASCII }

# Empty the Recycle Bin on all drives
function Empty-RecycleBin {
    $RecBin = (New-Object -ComObject Shell.Application).Namespace(0xA)
    $RecBin.Items() | %{Remove-Item $_.Path -Recurse -Confirm:$false}
}

# Determine size of a file or total size of a directory
function Get-DiskUsage([string] $path=(Get-Location).Path) {
    Convert-ToDiskSize `
        ( `
            Get-ChildItem .\ -recurse -ErrorAction SilentlyContinue `
            | Measure-Object -property length -sum -ErrorAction SilentlyContinue
        ).Sum `
        1
}

# Cleanup all disks (Based on Registry Settings in `windows.ps1`)
function Clean-Disks {
    Start-Process "$(Join-Path $env:WinDir 'system32\cleanmgr.exe')" -ArgumentList "/sagerun:6174" -Verb "runAs"
}

### Environment functions
### ----------------------------

# Reload the $env object from the registry
function Refresh-Environment {
    $locations = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
                 'HKCU:\Environment'

    $locations | ForEach-Object {
        $k = Get-Item $_
        $k.GetValueNames() | ForEach-Object {
            $name  = $_
            $value = $k.GetValue($_)
            Set-Item -Path Env:\$name -Value $value
        }
    }

    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# Set a permanent Environment variable, and reload it into $env
function Set-Environment([String] $variable, [String] $value) {
    Set-ItemProperty "HKCU:\Environment" $variable $value
    # Manually setting Registry entry. SetEnvironmentVariable is too slow because of blocking HWND_BROADCAST
    #[System.Environment]::SetEnvironmentVariable("$variable", "$value","User")
    Invoke-Expression "`$env:${variable} = `"$value`""
}

function Admin-Check {
    if (!(Verify-Elevated)) {
       $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
       $newProcess.Arguments = $myInvocation.MyCommand.Definition;
       $newProcess.Verb = "runas";
       [System.Diagnostics.Process]::Start($newProcess);
       exit
    }
}
# Add a folder to $env:Path
function Prepend-EnvPath([String]$path) { $env:PATH = $env:PATH + ";$path" }
function Prepend-EnvPathIfExists([String]$path) { if (Test-Path $path) { Prepend-EnvPath $path } }
function Append-EnvPath([String]$path) { $env:PATH = $env:PATH + ";$path" }
function Append-EnvPathIfExists([String]$path) { if (Test-Path $path) { Append-EnvPath $path } }

function prompt {

    #Assign Windows Title Text
    $host.ui.RawUI.WindowTitle = "Current Folder: $pwd"

    #Configure current user, current folder and date outputs
    $CmdPromptCurrentFolder = Split-Path -Path $pwd -Leaf

    # Test for Admin / Elevated
    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    #Decorate the CMD Prompt
    Write-host "PS" -NoNewline -ForegroundColor White -BackgroundColor DarkRed
    Write-host " " -NoNewline 
    Write-host ($(if ($IsAdmin) { 'Admin' } else { '' })) -BackgroundColor DarkRed -ForegroundColor White -NoNewline
    Write-host ($(if ($IsAdmin) { ' ' })) -NoNewline

    If ($CmdPromptCurrentFolder -like "*:*") {
        Write-Host "$CmdPromptCurrentFolder"  -NoNewline -ForegroundColor Cyan
    }
    else {
        Write-Host ".\$CmdPromptCurrentFolder"  -NoNewline -ForegroundColor Cyan
    }

    if (Test-Path .git) {
        Write-BranchName
    }

    return "> "
} 
