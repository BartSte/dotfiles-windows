Set objShell = CreateObject("WScript.Shell") 
objShell.Run "cmd /c ./trayicon.exe -- ./kmonad.bat", 0, False
