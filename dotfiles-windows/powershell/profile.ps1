$dir="$HOME\dotfiles-windows\powershell"
"env", "vi_mode", "aliases", "bindings" | ForEach-Object { . "$dir\$_" }
