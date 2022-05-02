$Env:EDITOR="gvim.bat"
$Env:_PSFZF_FZF_DEFAULT_OPTS="--height 40% --reverse"
$Env:FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:deselect-all'

$Env:FZF_DEFAULT_COMMAND = -join @('ag --hidden '
    '--ignore .git '
    '--ignore *.vscode* '
    '--ignore *.dot* '
    '--ignore *.venv* '
    '--ignore AppData '
    '--ignore "Fleet Cleaner"'
    '-g .')

$Env:FZF_ALT_C_COMMAND = -join @('Get-ChildItem . -Recurse -Directory |'
    'Where {'
        '$_.FullName -notlike "*\.vscode\*" -and '
        '$_.FullName -notlike "*.venv*" -and '
        '$_.FullName -notlike "Fleet Cleaner" -and '
        '$_.FullName -notlike "*.git*" -and '
        '$_.FullName -notlike "*.dot*" '
        '}')

function Fuzzy-Directory-Get() {
    $file = Get-ChildItem . -Recurse -Attributes Directory | Invoke-Fzf 
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($file)
}

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' `
                -PSReadlineChordReverseHistory 'Ctrl+r' `

Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadLineKeyHandler -Key 'alt+o' -ScriptBlock { Invoke-FuzzyEdit }
Set-PSReadLineKeyHandler -Key 'alt+d' -ScriptBlock { Fuzzy-Directory-Get } 
