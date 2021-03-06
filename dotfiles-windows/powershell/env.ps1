$Env:PATH += ";$HOME/vimfiles/plugged/fzf/bin"
$Env:SHELL = "powershell.exe"
$Env:EDITOR = "C:/tools/vim/vim90/vim.exe"
$Env:FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:deselect-all'
$Env:_PSFZF_FZF_DEFAULT_OPTS = "--height 100% --reverse --border"

$Env:FZF_CTRL_T_COMMAND="fd --hidden --no-ignore-vcs --max-depth 4 --ignore-file $HOME/.ignore -t d -t f '' ."
$Env:FZF_CTRL_T_OPTS='--preview "bat --theme=gruvbox-dark --style=numbers --color=always --line-range :500 {}"'

$Env:FZF_ALT_C_COMMAND = "fd --hidden --no-ignore-vcs --max-depth 4 --ignore-file $HOME/.ignore -t d '' ."
$Env:FZF_ALT_C_OPTS = '--preview "Get-ChildItem {} -Force | Select-Object Name, Parent | select -first 500"'

