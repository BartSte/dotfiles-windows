$computer_name = "PROBOOK"

# @(program, args)
$install = 
@('curl', ''),
@('vim', '')

$disable = 
@("WindowsMediaPlayer", "Windows Media Player"),
@("Internet-Explorer-Optional-amd64", "Internet Explorer"),
@("Printing-XPSServices-Features", "Microsoft XPS Document Writer"),
@("WorkFolders-Client", "WorkFolders-Client"),
@("Containers-DisposableClientVM", "Windows Sandbox")

$uninstall = 
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
"SpotifyAB.SpotifyMusic"
