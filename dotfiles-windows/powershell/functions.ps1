# Basic commands
function which($name) { Get-Command $name -ErrorAction SilentlyContinue | Select-Object Definition }
function touch($file) { "" | Out-File $file -Encoding ASCII }

## Python

# Tries to set a python virtualenvironmet that is located at $VENVS under the
# name $folder, which is the name of the top-level directory of the $PWD. If
# this venv does not exist, it wil try to activate a venv that is located at
# the $PWD named "venv". If this also fails, the host is informed.
function act {
    $folder = $(Split-Path -Path (Get-Location) -Leaf)
    $global = Join-Path -Path $Env:VENVS -Child $folder
    $local =  "$PWD\venv"        

    if (Test-Path $global) {
        & $(Join-Path -Path $global -Child "Scripts\Activate.ps1")
    } elseif (Test-Path $local) {
        & $(Join-Path -Path $local -Child "Scripts\Activate.ps1")
    } else {
        Write-Host "No python virtualenvironmet found for: $folder"
    }
}


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
        Write-Host 'You need to be an Admin to run this script.'
            exit
    }
}

# Add a folder to $env:Path
function Prepend-EnvPath([String]$path) { $env:PATH = $env:PATH + ";$path" }
function Prepend-EnvPathIfExists([String]$path) { if (Test-Path $path) { Prepend-EnvPath $path } }
function Append-EnvPath([String]$path) { $env:PATH = $env:PATH + ";$path" }
function Append-EnvPathIfExists([String]$path) { if (Test-Path $path) { Append-EnvPath $path } }

