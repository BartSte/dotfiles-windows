. ./config.ps1

remove-alldesktops
foreach($program in $launch){
    Write-Host $program
    start-process $program 
}
