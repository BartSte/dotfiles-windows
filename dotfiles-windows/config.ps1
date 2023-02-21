$computer_name = "jsmith"

$git_settings=@{user='jsmith'; email='name@domain.com'}

$wall_paper = "dotfiles\static\wallpaper_fleet_cleaner.png"

$env_paths="$HOME\bin;"
$env_paths+="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30133\bin\Hostx64\x64;"

# @(program, args)
$install = @(
@('curl', ''),
@('neovim', '--pre'),
@('inkscape', ''),
@('slack', ''),
@('qtcreator', ''),
@('powertoys', ''),
@('teamvier', ''),
@('python3', '--version=3.6.8 --side-by-side'),
@('python3', '--version=3.10.8 --side-by-side'),
$('python3', ''),
@('mingw', ''),
@('innosetup', ''),
@('teamviewer', ''),
@('adobereader', ''),
@('vlc', ''),
@('nodejs', ''),
@('jetbrainsmono', ''),
@('yarn', ''),
@('winscp', ''),
@('alacritty', ''),
@('ag', '')
@('cmake', '')
@('qutebrowser', '')
@('wget', '')
@('grep', '')
@('strawberryperl', '')
)

$vscode_extensions=@(
'batisteo.vscode-django',
'donjayamanne.python-extension-pack',
'dsznajder.es7-react-js-snippets',
'eamodio.gitlens',
'esbenp.prettier-vscode',
'firefox-devtools.vscode-firefox-debug',
'GitLab.gitlab-workflow',
'Gruntfuggly.todo-tree',
'hbenl.vscode-test-explorer',
'idleberg.innosetup',
'James-Yu.latex-workshop',
'KevinRose.vsc-python-indent',
'littlefoxteam.vscode-python-test-adapter',
'mgmcdermott.vscode-language-babel',
'mhutchie.git-graph',
'ms-python.python',
'ms-python.vscode-pylance',
'ms-toolsai.jupyter',
'ms-vscode.test-adapter-converter',
'nicohlr.pycharm',
'njpwerner.autodocstring',
'njqdev.vscode-python-typehint',
'streetsidesoftware.code-spell-checker',
'Tyriar.sort-lines',
'vscodevim.vim',
'wholroyd.jinja',
'xabikos.JavaScriptSnippets',
'xyz.local-history')

# @(program, name)
$disable = 
@("WindowsMediaPlayer", "Windows Media Player"),
@("Internet-Explorer-Optional-amd64", "Internet Explorer"),
@("Printing-XPSServices-Features", "Microsoft XPS Document Writer"),
@("WorkFolders-Client", "WorkFolders-Client"),
@("Containers-DisposableClientVM", "Windows Sandbox")

$uninstall = @(
"Microsoft.MixedReality.Portal",
"Microsoft.Xbox.TCUI",
"SynapticsIncorporated.SynHPCommercialStykDApp",
"Microsoft.Microsoft3DViewer_6.1908.2042.0_x64__8wekyb3d8bbwe",
"Microsoft.MicrosoftEdge.Stable_99.0.1150.46_neutral__8wekyb3d8bbwe",
"Microsoft.MicrosoftEdgeDevToolsClient_1000.19041.1023.0_neutral_neutral_8wekyb3d8bbwe",
"Microsoft.Wallet_2.4.18324.0_x64__8wekyb3d8bbwe",
"Microsoft.XboxGameOverlay_1.46.11001.0_x64__8wekyb3d8bbwe",
"*.AutodeskSketchBook",
"*.DisneyMagicKingdoms",
"*.Facebook",
"*.MarchofEmpires",
"*.SlingTV",
"*.Twitter",
"DolbyLaboratories.DolbyAccess",
"king.com.BubbleWitch3Saga",
"king.com.CandyCrushSodaSaga",
"Microsoft.3DBuilder",
"Microsoft.549981C3F5F10",
"Microsoft.BingFinance",
"Microsoft.BingNews",
"Microsoft.BingSports",
"Microsoft.BingWeather", 
"Microsoft.GamingApp", 
"Microsoft.GetHelp",
"Microsoft.GetStarted",
"Microsoft.Messaging",
"Microsoft.MicrosoftOfficeHub",
"Microsoft.MicrosoftSolitaireCollection",
"Microsoft.MicrosoftStickyNotes",
"Microsoft.MSPaint",
"Microsoft.Office.OneNote",
"Microsoft.Office.Sway",
"Microsoft.OneConnect",
"Microsoft.People",
"Microsoft.Print3D",
"Microsoft.SkypeApp",
"Microsoft.SkypeApp", 
"Microsoft.Todos", 
"Microsoft.Windows.Photos",
"Microsoft.WindowsAlarms",
"Microsoft.WindowsCalculator", 
"Microsoft.WindowsCommunicationsApps",
"Microsoft.WindowsFeedbackHub",
"Microsoft.WindowsMaps",
"Microsoft.WindowsNotepad", 
"Microsoft.WindowsPhone",
"Microsoft.WindowsSoundRecorder",
"Microsoft.XboxApp", 
"Microsoft.XboxGamingOverlay", 
"Microsoft.XboxIdentityProvider", 
"Microsoft.XboxSpeechToTextOverlay"
"Microsoft.YourPhone", 
"Microsoft.ZuneMusic", 
"Microsoft.ZuneVideo", 
"SpotifyAB.SpotifyMusic")
