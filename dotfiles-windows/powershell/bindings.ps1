Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' `
                -PSReadlineChordReverseHistory 'Ctrl+r'

Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadLineKeyHandler -Key 'ctrl-f' -Function ViCommandMode
Set-PSReadLineKeyHandler -Key 'ctrl-b' -ScriptBlock {[Microsoft.PowerShell.PSConsoleReadLine]::Insert($(git branch --all|Invoke-Fzf).substring(2))}
Set-PSReadLineKeyHandler -Key 'alt-l' -ScriptBlock {[Microsoft.PowerShell.PSConsoleReadLine]::Insert('cls'); [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()}
Set-PSReadLineKeyHandler -Key 'alt-l' -Function ClearScreen

