. ~/dotfiles-windows/config.ps1
. ~/dotfiles-windows/windows/tools.ps1

Admin-Check;

for($i=0; $i -lt $disable_arg_1.length; $i++){
    Disable-WindowsFeature $disable_arg_1[$i] $disable_arg_2[$i]        
}

foreach($app in $uninstall){
    Uninstall-AppPackage $app
}

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


