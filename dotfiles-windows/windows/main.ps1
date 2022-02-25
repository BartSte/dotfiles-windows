. ~/dotfiles-windows/config.ps1
. ~/dotfiles-windows/windows/tools.ps1

Admin-Check;

Disable-WindowsFeature "WindowsMediaPlayer" "Windows Media Player";
Disable-WindowsFeature "Internet-Explorer-Optional-amd64" "Internet Explorer";
Disable-WindowsFeature "Printing-XPSServices-Features" "Microsoft XPS Document Writer";
Disable-WindowsFeature "WorkFolders-Client" "WorkFolders-Client";
Disable-WindowsFeature "Containers-DisposableClientVM" "Windows Sandbox";

# Uses appxpackage, 
Uninstall-AppPackage "Microsoft.Getstarted";
Uninstall-AppPackage "Microsoft.GetHelp";
Uninstall-AppPackage "Microsoft.WindowsFeedbackHub";
Uninstall-AppPackage "Microsoft.MicrosoftSolitaireCollection";
Uninstall-AppPackage "Microsoft.549981C3F5F10"; # Cortana
Uninstall-AppPackage "Microsoft.WindowsCalculator"; 
Uninstall-AppPackage "Microsoft.Todos"; 
Uninstall-AppPackage "Microsoft.WindowsNotepad"; 
Uninstall-AppPackage "Microsoft.ZuneMusic"; 
Uninstall-AppPackage "Microsoft.ZuneVideo"; 
Uninstall-AppPackage "Microsoft.GamingApp"; 
Uninstall-AppPackage "Microsoft.BingWeather"; 
Uninstall-AppPackage "Microsoft.BingNews"; 
Uninstall-AppPackage "Microsoft.MicrosoftStickyNotes"; 
Uninstall-AppPackage "Microsoft.YourPhone"; 
Uninstall-AppPackage "Microsoft.XboxIdentityProvider"; 
Uninstall-AppPackage "Microsoft.SkypeApp"; 
Uninstall-AppPackage "Microsoft.XboxApp"; 
Uninstall-AppPackage "Microsoft.People"; 
Uninstall-AppPackage "Microsoft.XboxGamingOverlay"; 
Uninstall-AppPackage "Microsoft.XboxSpeechToTextOverlay"; 


# get-package is part of the moduel packagemanagement
get-package "IIS" -erroraction 'silentlycontinue'| uninstall-package;

Set-WindowsExplorer-ShowFileExtensions;
Set-WindowsFileExplorer-StartFolder;
Set-Multitasking-Configuration;
Set-Classic-ContextMenu-Configuration;
Set-SetAsBackground-To-Extended-ContextMenu;
Disable-RecentlyOpenedItems-From-JumpList;
Set-Power-Configuration;
Set-Custom-Regional-Format;
Rename-PC($computer_name);

#TODO remove more programs you dont like. Try to find out why some are not found by appxpackage


