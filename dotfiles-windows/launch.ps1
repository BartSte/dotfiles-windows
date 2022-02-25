function start-process-new-desktop($programs) {
    new-desktop | switch-desktop
    foreach($program in $programs) {
        start-process $program -NoNewWindow
    }
    start-sleep 2
}

$programs_desktop_0 = @(
'C:\Users\barts\AppData\Local\slack\slack.exe',
'C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE'
)

$programs_desktop_1 = @(
'C:\Users\barts\AppData\Local\Programs\Microsoft VS Code\Code.exe',
'C:\Program Files\WindowsApps\53707johannesjo.SuperProductivity_7.10.1.0_x64__ch45amy23cdv6\app\superProductivity.exe'
)

$programs_desktop_2 = @(
'C:\Program Files\WindowsApps\SpotifyAB.SpotifyMusic_1.179.763.0_x86__zpdnekdrzrea0\Spotify.exe',
'C:\Program Files\Mozilla Firefox\firefox.exe'
)

$programs = @($programs_desktop_0, $programs_desktop_1, $programs_desktop_2)

remove-alldesktops
$current = get-desktop
foreach($arg in $programs) {
    start-process-new-desktop($arg)
}
remove-desktop $current
