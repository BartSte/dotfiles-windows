$Env:PATH+=";$HOME\vimfiles\plugged\fzf\bin"
$Env:PATH+=";$Env:ProgramFiles\CMake\bin" 
$Env:PATH+=";C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30133\bin\Hostx64\x64"
$Env:PATH+=";C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\"
$Env:PATH+=";C:\tools\opencv\build\x64\vc15\bin"
$Env:PATH+=";C:\Qt\5.15.2\msvc2019_64\bin"
$Env:PATH+=";C:\Qt\5.15.2\msvc2019_64\include"

$Env:EDITOR = "C:/tools/vim/vim90/vim.exe"

$Env:_PSFZF_FZF_DEFAULT_OPTS = "--height 40% --layout=reverse --preview-window=right,65%"

$Env:FZF_CTRL_T_COMMAND="fd --hidden --no-ignore-vcs --max-depth 3 --ignore-file $HOME/.ignore --type f"
$Env:FZF_ALT_C_COMMAND = "fd --hidden --no-ignore-vcs --max-depth 4 --ignore-file $HOME/.ignore -t d"

$FZF_CTRL_T_OPTS_FILES='bat --theme=gruvbox-dark --style=numbers --color=always --line-range :500 {}'
$FZF_CTRL_T_OPTS_DIR='dir /O-G /ON {} | bat --line-range 5:500'

$FZF_CTRL_T_OPTS_BIND="ctrl-d:reload($Env:FZF_ALT_C_COMMAND)+change-preview($FZF_CTRL_T_OPTS_DIR)+toggle-preview,"
$FZF_CTRL_T_OPTS_BIND+="ctrl-f:reload($Env:FZF_CTRL_T_COMMAND)+change-preview($FZF_CTRL_T_OPTS_FILES)+change-preview-window(hidden),"
$FZF_CTRL_T_OPTS_BIND+="ctrl-s:toggle-preview"

$Env:FZF_CTRL_T_OPTS="--bind '$FZF_CTRL_T_OPTS_BIND' "
$Env:FZF_CTRL_T_OPTS+="--preview '$FZF_CTRL_T_OPTS_FILES' "
$Env:FZF_CTRL_T_OPTS+="--preview-window 'hidden'"

$Env:FZF_ALT_C_OPTS = "--preview '$FZF_CTRL_T_OPTS_DIR'"

