
' Begin Callout A
Dim dialogs
Set dialogs = CreateObject _
	("penton.scripting.iedialogs")
' End Callout A

' Begin Callout B
dialogs.Width	= 320
dialogs.Height= 240
dialogs.Scroll = False
dialogs.Title = "Demoing Dialogs"
' End Callout B

' Begin Callout C
dialogs.BeforeText = "Enter a password"
Dim password
password = dialogs.Password(WScript)
WScript.Echo password
' End Callout C

' Begin Callout D
password = dialogs. _
	ConfirmedPassword(WScript)
WScript.Echo password
' End Callout D

dialogs.Reset

' Begin Callout E
dim path: path = dialogs.File(WScript)
WScript.Echo path
' End Callout E

dialogs.Reset

' Begin Callout F
dim sd
set sd = createobject _
	("Scripting.Dictionary")
sd.CompareMode = vbTextCompare
sd.add "Power Users", 1
sd.add "Restricted Users", 2
sd.add "Administrators", 3
dialogs.Title = "Choose A User Group"
value = dialogs.Selection(WScript, sd)
WScript.Echo value
' End Callout F

dialogs.Reset

' Begin Callout G
Set progressDialog = _
	dialogs.Progress(WScript)
For i = 1 to 100
	WScript.Sleep 20
	progressDialog.Add "."
Next
' End Callout G

dialogs.Reset

' Begin Callout H
cal = dialogs.CalendarDate(WScript)
WScript.Echo cal
' End Callout H
