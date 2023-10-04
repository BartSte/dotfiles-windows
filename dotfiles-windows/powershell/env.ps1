$Env:PATH=[System.Environment]::GetEnvironmentVariable("Path","User") 

$Env:PATH+=";"
$Env:PATH+=[System.Environment]::GetEnvironmentVariable("Path","Machine") 
$Env:PATH+=";"
$Env:PATH+="$Env:LOCALAPPDATA\nvim-data\plugged\fzf\bin"
$Env:PATH+=";"
$Env:PATH+="C:\Program Files\VideoLAN\VLC"

$Env:LH=$(arch run echo -E '$(wslpath -w ~)') # WSL home (Linux Home)

$Env:VENVS = "$Env:USERPROFILE\venvs"
$Env:EDITOR = "nvim.exe"
$Env:VIRTUAL_ENV_DISABLE_PROMPT = 1

$Env:_PSFZF_FZF_DEFAULT_OPTS = "--height 40% --layout=reverse --preview-window=right,65%"
$Env:PYTHONBREAKPOINT="ipdb.set_trace"
$Env:IPDB_CONTEXT_SIZE=10

$Env:FZF_CTRL_T_COMMAND="fd --hidden --no-ignore-vcs --max-depth 5 --ignore-file $HOME\.ignore --type f"
$Env:FZF_ALT_C_COMMAND = "fd --hidden --no-ignore-vcs --max-depth 5 --ignore-file $HOME\.ignore -t d"

$FZF_CTRL_T_OPTS_FILES='bat --theme=gruvbox-dark --style=numbers --color=always --line-range :500 {}'
$FZF_CTRL_T_OPTS_DIR='dir /O-G /ON {} | bat --line-range 5:500'

$FZF_CTRL_T_OPTS_BIND="ctrl-d:reload($Env:FZF_ALT_C_COMMAND)+change-preview($FZF_CTRL_T_OPTS_DIR)+toggle-preview,"
$FZF_CTRL_T_OPTS_BIND+="ctrl-f:reload($Env:FZF_CTRL_T_COMMAND)+change-preview($FZF_CTRL_T_OPTS_FILES)+change-preview-window(hidden),"
$FZF_CTRL_T_OPTS_BIND+="ctrl-s:toggle-preview"

$Env:FZF_CTRL_T_OPTS="--bind '$FZF_CTRL_T_OPTS_BIND' "
$Env:FZF_CTRL_T_OPTS+="--preview '$FZF_CTRL_T_OPTS_FILES' "
$Env:FZF_CTRL_T_OPTS+="--preview-window 'hidden'"

$Env:FZF_ALT_C_OPTS = "--preview '$FZF_CTRL_T_OPTS_DIR'"

