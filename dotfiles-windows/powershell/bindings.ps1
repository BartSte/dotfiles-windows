Set-PsFzfOption -PSReadlineChordProvider 'Ctrl-t' `
                -PSReadlineChordReverseHistory 'Ctrl+r'

Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
