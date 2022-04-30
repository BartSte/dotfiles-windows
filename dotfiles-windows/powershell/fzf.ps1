$commandOverride = [ScriptBlock]{ param($Location) cd $Location }

function Fuzzy-File-Get() {
    $file = Get-ChildItem . -Recurse -File | Invoke-Fzf
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($file)
}

function Fuzzy-Directory-Get() {
    $file = Get-ChildItem . -Recurse -Attributes Directory | Invoke-Fzf 
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($file)
}


Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r' `
                -AltCCommand $commandOverride

Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadLineKeyHandler -Key 'alt+o' -ScriptBlock { Invoke-FuzzyEdit }
Set-PSReadLineKeyHandler -Key 'alt+d' -ScriptBlock { Fuzzy-Directory-Get }
Set-PSReadLineKeyHandler -Key 'ctrl+t' -ScriptBlock { Fuzzy-File-Get }


$Env:EDITOR="vim.bat"
$Env:_PSFZF_FZF_DEFAULT_OPTS="--height 40% --reverse"
$Env:FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:deselect-all'
$Env:FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g .'

