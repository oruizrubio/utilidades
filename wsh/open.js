/* versión VBS
Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run "%windir%\notepad nota.txt" 
*/

var WS = WScript.CreateObject("WScript.Shell");
WS.Run("notepad nota.txt");