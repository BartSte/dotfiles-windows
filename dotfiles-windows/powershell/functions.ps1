# Basic commands
function which($name)
{ 
    Get-Command $name -ErrorAction SilentlyContinue | Select-Object Definition 
}

function touch($file)
{ 
    "" | Out-File $file -Encoding ASCII 
}

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


# Reload the $env object from the registry
# function Refresh-Environment
# {
#     $locations = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
#     'HKCU:\Environment'

#     $locations | ForEach-Object {
#         $k = Get-Item $_
#         $k.GetValueNames() | ForEach-Object {
#             $name  = $_
#             $value = $k.GetValue($_)
#             Set-Item -Path Env:\$name -Value $value
#         }
#     }

#     $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
# }

# Set a permanent Environment variable, and reload it into $env
function Set-Environment([String] $variable, [String] $value)
{
    Set-ItemProperty "HKCU:\Environment" $variable $value
    # Manually setting Registry entry. SetEnvironmentVariable is too slow because of blocking HWND_BROADCAST
    #[System.Environment]::SetEnvironmentVariable("$variable", "$value","User")
    Invoke-Expression "`$env:${variable} = `"$value`""
}

function Admin-Check
{
    if (!(Verify-Elevated))
    {
        Write-Host 'You need to be an Admin to run this script.'
        exit
    }
}

# Add a folder to $env:Path
function Prepend-EnvPath([String]$path)
{ $env:PATH = $env:PATH + ";$path" 
}
function Prepend-EnvPathIfExists([String]$path)
{ if (Test-Path $path)
    { Prepend-EnvPath $path 
    } 
}
function Append-EnvPath([String]$path)
{ $env:PATH = $env:PATH + ";$path" 
}
function Append-EnvPathIfExists([String]$path)
{ if (Test-Path $path)
    { Append-EnvPath $path 
    } 
}

