Dim trayicon_path, trayicon_opts, cmd

' Configuration
trayicon_path = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%LOCALAPPDATA%\kmonad\trayicon.exe")
trayicon_opts = "--icon """ & CreateObject("WScript.Shell").ExpandEnvironmentStrings("%USERPROFILE%\dotfiles-windows\kmonad\kmonad.ico") & """"
cmd = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%LOCALAPPDATA%\kmonad\kmonad.exe") & " " & CreateObject("WScript.Shell").ExpandEnvironmentStrings("%USERPROFILE%\dotfiles-windows\kmonad\config.kbd")

' Construct the full command
Dim full_command
full_command = """" & trayicon_path & """ " & trayicon_opts & " """ & cmd & """"

' Execute the command
CreateObject("WScript.Shell").Run full_command, 0, False

