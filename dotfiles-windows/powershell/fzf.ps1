$Env:EDITOR="gvim.bat"
$Env:_PSFZF_FZF_DEFAULT_OPTS="--height 40% --reverse"
$Env:FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:deselect-all'
$Env:FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore AppData --ignore "Reporting Data" --ignore "Fleet Cleaner" -g .'


function Fuzzy-Directory-Get() {
    $file = Get-ChildItem . -Recurse -Attributes Directory | Invoke-Fzf 
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($file)
}

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' `
                -PSReadlineChordReverseHistory 'Ctrl+r' `

Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadLineKeyHandler -Key 'alt+o' -ScriptBlock { Invoke-FuzzyEdit }
Set-PSReadLineKeyHandler -Key 'alt+d' -ScriptBlock { Fuzzy-Directory-Get } 

# FIXME alt+c is very slow as it searches through appdata, fleet cleaner etc. Think of a way to solve this.

