function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a block.
        Write-Host -NoNewLine "`e[2 q"
    } else {
        # Set the cursor to a line.
        Write-Host -NoNewLine "`e[6 q"
    }
}
Set-PSReadlineOption -EditMode vi
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange
