Dim trayicon_path, trayicon_opts, cmd

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Configuration
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
trayicon_path = "trayicon.exe"  ' The path to the trayicon executable
trayicon_opts = "--icon kmonad.ico"  ' The options to pass to trayicon 
cmd = "kmonad.exe config.kbd"  ' The command to run by trayicon

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Concatenate the command to run and execute it.
'
' The 0 argument hides the console window, and the False argument
' tells the script not to wait for the command to finish before continuing. For
' more information, see https://ss64.com/vb/run.html
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Dim full_command
full_command = """" & trayicon_path & """ " & trayicon_opts & " """ & cmd & """"
CreateObject("WScript.Shell").Run full_command, 0, False
