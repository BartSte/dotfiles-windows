$computer_name = "PROBOOK"

$launch = @( 
'C:\Users\barts\AppData\Local\slack\slack.exe',
'C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE',
'C:\Program Files\WindowsApps\SpotifyAB.SpotifyMusic_1.180.699.0_x86__zpdnekdrzrea0\Spotify.exe',
'C:\Program Files\Mozilla Firefox\firefox.exe',
'C:\Users\barts\AppData\Local\Programs\Microsoft VS Code\Code.exe',
'C:\Program Files\WindowsApps\53707johannesjo.SuperProductivity_7.10.1.0_x64__ch45amy23cdv6\app\superProductivity.exe')

# @(program, args)
$install = 
@('curl', ''),
@('vim', '')

# @(program, name)
$disable = 
@("WindowsMediaPlayer", "Windows Media Player"),
@("Internet-Explorer-Optional-amd64", "Internet Explorer"),
@("Printing-XPSServices-Features", "Microsoft XPS Document Writer"),
@("WorkFolders-Client", "WorkFolders-Client"),
@("Containers-DisposableClientVM", "Windows Sandbox")

$uninstall = @(
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
