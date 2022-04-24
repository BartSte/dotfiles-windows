$commandOverride = [ScriptBlock]{ param($Location) cd $Location }


function Fuzzy-Directory-Get() {
    $file = Get-ChildItem . -Recurse -Attributes Directory | Invoke-Fzf 
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($file)
}


Set-PsFzfOption -PSReadlineChordProvide  'Ctrl+t' `
                -PSReadlineChordReverseHistory 'Ctrl+r' `
                -AltCCommand $commandOverride

Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadLineKeyHandler -Key 'alt+o' -ScriptBlock { Invoke-FuzzyEdit }
Set-PSReadLineKeyHandler -Key 'alt+d' -ScriptBlock { Fuzzy-Directory-Get }

$Env:EDITOR="gvim.bat"
$Env:_PSFZF_FZF_DEFAULT_OPTS="--height 40% --reverse"
