Invoke-Expression (oh-my-posh --init --shell pwsh --config $HOME\dotfiles-windows\posh\gruvbox.omp.json)

Push-Location (Split-Path -parent $profile) 

"env", "vi_mode", "functions", "aliases", "bindings" | 
Where-Object { Test-Path "$_.ps1" } | 
ForEach-Object -process { Invoke-Expression ". .\$_.ps1" }

Pop-Location
