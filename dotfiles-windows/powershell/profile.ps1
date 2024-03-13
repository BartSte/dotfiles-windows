Invoke-Expression (oh-my-posh --init --shell pwsh --config $HOME\dotfiles-windows\posh\gruvbox.omp.json)
$dir="$HOME\dotfiles-windows\powershell"
"env", "vi_mode", "aliases", "bindings" | ForEach-Object { . "$dir\$_" }
