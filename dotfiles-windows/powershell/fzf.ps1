function parse_text_rows_to_array($file, $delimiter) {
    $as_array = Get-Content -Path $file 
    $as_string = $as_array -join $delimiter
    return $as_string
}

$alt_c_head = 'Get-ChildItem ~ -Recurse -Directory | Where {$_.FullName -notlike "'
$alt_c_middle = parse_text_rows_to_array ~/.ignore '" -and $_.FullName -notlike "' 
$alt_c_tail = '"}'

$Env:EDITOR = "gvim.bat"
$Env:FZF_DEFAULT_COMMAND = "ag --hidden -U --path-to-ignore '$HOME\.ignore' -g . $HOME"
$Env:_PSFZF_FZF_DEFAULT_OPTS = "--height 80% --reverse"
$Env:FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:deselect-all'
$Env:FZF_ALT_C_COMMAND = $alt_c_head + $alt_c_middle + $alt_c_tail

function fzf_set_directory {
    $result = $null
    try {
        if ($null -eq $env:FZF_ALT_C_COMMAND) {
            Get-ChildItem . -Recurse -ErrorAction SilentlyContinue -Directory | Invoke-Fzf | ForEach-Object { $result = $_ }
        }
        else {
            Invoke-Expression ($env:FZF_ALT_C_COMMAND + ' ' + $env:FZF_ALT_C_OPTS) | Invoke-Fzf | ForEach-Object { $result = $_ }
        }
    } 
    catch {
        catch custom exception
    }
    if (-not [string]::IsNullOrEmpty($result)) {
        Set-Location $result
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    }
    else {
        #HACK: workaround for fact that PSReadLine seems to clear screen
        # after keyboard shortcut action is executed:
        [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
    }
}

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' `
    -PSReadlineChordReverseHistory 'Ctrl+r' `

Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadLineKeyHandler -Key 'alt+o' -ScriptBlock { Invoke-FuzzyEdit }
Set-PSReadLineKeyHandler -Key 'alt+c' -ScriptBlock { fzf_set_directory }

# function fzf_set_directory() {
#     Invoke-Expression $alt_c_command | Invoke-Fzf | Set-Location
#     # Get-ChildItem . -Recurse -Attributes Directory | Invoke-Fzf | Set-Location
# }
