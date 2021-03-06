function Hard-Link-Keyboard-Settings {
    $my_default = Join-Path -Path $PSScriptRoot -ChildPath "keyboard_default.json"
    $my_settings = Join-Path -Path $PSScriptRoot -ChildPath "keyboard_settings.json"

    $power_toys_default = Join-Path -Path $env:LOCALAPPDATA -ChildPath "Microsoft" | Join-Path -ChildPath "PowerToys" | Join-Path -ChildPath "Keyboard Manager" | Join-Path -ChildPath "default.json";
    $power_toys_settings = Join-Path -Path $env:LOCALAPPDATA -ChildPath "Microsoft" | Join-Path -ChildPath "PowerToys" | Join-Path -ChildPath "Keyboard Manager" | Join-Path -ChildPath "settings.json";
    
    Remove-Item $power_toys_default -ErrorAction SilentlyContinue
    Remove-Item $power_toys_settings -ErrorAction SilentlyContinue

    New-Item -ItemType HardLink -Path $power_toys_default -Target $my_default
    New-Item -ItemType HardLink -Path $power_toys_settings -Target $my_settings

    Write-Host "Make hardlink to keyboard Manager of PowerToys"
}

Hard-Link-Keyboard-Settings
