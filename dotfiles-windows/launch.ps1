$programs = @(
'C:\Users\barts\AppData\Local\slack\slack.exe',
'C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE'
)

get-desktop 0 | switch-desktop
foreach($program in $programs) {
    start-process $program
}
start-sleep 2

$programs = @(
'C:\Users\barts\AppData\Local\Programs\Microsoft VS Code\Code.exe',
'C:\Program Files\WindowsApps\53707johannesjo.SuperProductivity_7.10.1.0_x64__ch45amy23cdv6\app\superProductivity.exe'
)

get-desktop 1 | switch-desktop
foreach($program in $programs) {
    start-process $program
}
start-sleep 2

$programs = @(
'C:\Program Files\WindowsApps\SpotifyAB.SpotifyMusic_1.179.763.0_x86__zpdnekdrzrea0\Spotify.exe',
'C:\Program Files\Mozilla Firefox\firefox.exe'
)

get-desktop 2 | switch-desktop
foreach($program in $programs) {
    start-process $program
}

