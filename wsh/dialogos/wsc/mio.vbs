Const READYSTATE_COMPLETE = 4
set ie = CreateObject ("InternetExplorer.Application")

' Begin Callout A
ie.navigate "about:blank"
Do While ie.ReadyState <> READYSTATE_COMPLETE
	WScript.Sleep 50
Loop
' End Callout A

' Begin Callout B
dim text
Set text = ie.document.createElement("textarea")
text.Value = "type text here"
ie.document.body.AppendChild text
Dim okButton
Set okButton = ie.document.createElement("input")
okButton.type = "button"
okButton.value = "OK"
ie.document.body.AppendChild okButton
' End Callout B

' Begin Callout C
Dim Finished: Finished = False
Set okButton.onclick = GetRef("OK_Clicked")
' End Callout C

ie.visible = true

' Begin Callout D
Do While Not Finished
	WScript.Sleep 50
Loop
' End Callout D

WScript.Echo text.value
ie.Quit

' Begin Callout E
Sub OK_Clicked()
	Finished = True
End Sub
' End Callout E
