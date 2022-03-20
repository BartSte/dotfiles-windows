function Hard-Link-VSCode-Configurations {
    $vscode_settings_path = Join-Path -Path $env:appdata -ChildPath "Code" | Join-Path -ChildPath "User";

    if (-not (Test-Path -Path $vscode_settings_path)) {
        Write-Host "VSCode is not installed yet." -ForegroundColor "Green";
    }
    else {
        $targets = Get-ChildItem -Path "${PSScriptRoot}\*" -Include "*.json" -Recurse
        ForEach($target in $targets) {
            $path = Join-Path -Path $vscode_settings_path -ChildPath $target.Name
            Remove-Item $path -ErrorAction SilentlyContinue
            New-Item -ItemType HardLink -Path $path -Target $target
        }
    }
}

Hard-Link-VSCode-Configurations;
