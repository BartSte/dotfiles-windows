$Env:EDITOR = "C:/tools/vim/vim82/vim.exe"
$Env:FZF_DEFAULT_COMMAND = "fd --hidden --no-ignore-vcs --max-depth 4 --ignore-file $HOME/.ignore -t f '' ."
$Env:FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:deselect-all'
$Env:_PSFZF_FZF_DEFAULT_OPTS = "--height 80% --reverse --border"

$Env:FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'

$Env:FZF_ALT_C_COMMAND = "fd --hidden --no-ignore-vcs --max-depth 4 --ignore-file $HOME/.ignore -t d '' ."

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' `
                -PSReadlineChordReverseHistory 'Ctrl+r'

Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadLineKeyHandler -Key 'alt-l' -ScriptBlock { [Microsoft.PowerShell.PSConsoleReadLine]::Insert('cls'); [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()}

