function parse_text_rows_to_array($file, $delimiter) {
    $as_array = Get-Content -Path $file 
    $as_string = $as_array -join $delimiter
    return $as_string
}

$alt_c_head = 'Get-ChildItem . -Recurse -Directory | Where {$_.FullName -notlike "'
$alt_c_middle = parse_text_rows_to_array ~/.ignore '" -and $_.FullName -notlike "' 
$alt_c_tail = '"}'

$Env:EDITOR = "gvim.bat"
$Env:FZF_DEFAULT_COMMAND = "ag --hidden -U --path-to-ignore '$HOME\.ignore' -g ."
$Env:_PSFZF_FZF_DEFAULT_OPTS = "--height 40% --reverse"
$Env:FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:deselect-all'
$Env:FZF_ALT_C_COMMAND = $alt_c_head + $alt_c_middle + $alt_c_tail

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' `
                -PSReadlineChordReverseHistory 'Ctrl+r' `

Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadLineKeyHandler -Key 'alt+o' -ScriptBlock { Invoke-FuzzyEdit }
