$computer_name = "barts"

$wall_paper = "dotfiles\static\wallpaper_fleet_cleaner.png"

$launch = @( 
'$HOME\AppData\Local\slack\slack.exe',
'C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE',
'C:\Program Files\WindowsApps\SpotifyAB.SpotifyMusic_1.180.699.0_x86__zpdnekdrzrea0\Spotify.exe',
'C:\Program Files\Mozilla Firefox\firefox.exe',
'$HOME\AppData\Local\Programs\Microsoft VS Code\Code.exe',
'C:\Program Files\WindowsApps\53707johannesjo.SuperProductivity_7.10.1.0_x64__ch45amy23cdv6\app\superProductivity.exe')

# @(program, args)
$install = @(
@('curl', ''),
@('vim', ''),
@('vscode', ''),
@('inkscape', ''),
@('firefox', ''),
@('slack', ''),
@('qtcreator', ''),
@('powertoys', ''),
@('teamvier', ''),
@('python3', ''),
@('python3', '--version=3.6.8'),
@('mingw', ''),
@('innosetup', '')
@('teamviewer', '')
@('adobereader', '')
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
