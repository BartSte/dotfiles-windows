$computer_name = "jsmith"

$git_settings=@{user='jsmith'; email='name@domain.com'}

$wall_paper = "$HOME\dotfiles\static\wallpaper_fleet_cleaner.png"

# Paths that are always added to the PATH environment variable. In contrast to
# the ./powershell/env.ps1 file which is only added when a shell is started.
$env_paths+="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30133\bin\Hostx64\x64;"

# The following programs are installed with chocolatey. The first element is the
# program name and the second element are the optional arguments that are passed
# to the choco.
# @(program, args)
$install = @(
    @('adobereader', ''),
    @('ag', '')
    @('alacritty', ''),
    @('cmake', '')
    @('curl', ''),
    @('grep', '')
    @('inkscape', ''),
    @('innosetup', ''),
    @('mingw', ''),
    @('neovim', '--pre'),
    @('nerd-fonts-jetbrainsmono', '')
    @('nodejs', ''),
    @('powertoys', ''),
    @('python3', ''),
    @('python3', '--version=3.10.8 --side-by-side'),
    @('qtcreator', ''),
    @('qutebrowser', '')
    @('slack', ''),
    @('strawberryperl', '')
    @('super-productivity', '')
    @('teamviewer', ''),
    @('vlc', ''),
    @('wget', '')
    @('winscp', ''),
    @('yarn', ''),
)

# The following built-in Windows features are disabled. The first element is the
# program name and the second element is the name of the feature.
# @(program, name)
$disable = 
@("WindowsMediaPlayer", "Windows Media Player"),
@("Internet-Explorer-Optional-amd64", "Internet Explorer"),
@("Printing-XPSServices-Features", "Microsoft XPS Document Writer"),
@("WorkFolders-Client", "WorkFolders-Client"),
@("Containers-DisposableClientVM", "Windows Sandbox")

# The following pre-installed Windows programs are uninstalled.
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
