' Author : Peter J.C. van der Klugt
' Purpose: Demonstrates the use of the WshDialog.Kit object
'------------------------------------------------------------

Option Explicit

Const vbModal = 1

Dim oShell, oDlg, oFrm, oCtl, sInfo, nCount, bNext, bBox

Set oShell = Wscript.CreateObject("WScript.Shell")
Set oDlg = Wscript.CreateObject("WshDialog.Kit", "oDlg_")

sInfo = oDlg.DLL.Exename & " v" & oDlg.DLL.Major & "." & oDlg.DLL.Minor & "." & oDlg.DLL.Revision
sInfo = sInfo & " by " & oDlg.DLL.Companyname

'MsgBox WScript.Version

CreateForm1
CreateForm2

Do
	If Not bNext Then
		oDlg.Frm.Show vbModal
	Else
		bNext = False
		oDlg.Frm("2").Show vbModal
	End If

	'Exit loop when a CloseBox or a Finish button is clicked
	If Ucase(oDlg.Clicked) = "FINISH" Then Exit Do
	If oDlg.Clicked = "*CLOSE" Then Exit Do
Loop

oDlg.ClearForms

'Let's tidy up (not technically necessary)
WScript.DisconnectObject oShell
WScript.DisconnectObject oDlg
Set oShell = Nothing
Set oDlg = Nothing

Sub CreateForm1

	Set oFrm = oDlg.NewForm  

	oFrm.Caption = sInfo

	oFrm.NewButton "Next", 150, 3000, 950, 375, "&Next >"
	oFrm.NewButton "Toggle", 1250, 3000, 950, 375, "&Toggle"
	oFrm.NewButton "Progress", 2350, 3000, 950, 375, "&Progress"
	oFrm.NewButton "Read", 3450, 3000, 950, 375, "&Read Out"	
	oFrm.NewButton "Finish", 4550, 3000, 950, 1000, "&Finish"

	oFrm.Ctl("Finish").Picture = oDlg.LoadPic("C:\Windows\HlpGlobe.gif")

	oFrm.Ctl("Finish").DownPicture = oDlg.LoadPic("C:\Windows\HlpBell.gif")
	oFrm.Ctl("Finish").DownPicture = oDlg.LoadPic("C:\H_Point.cur")
	oFrm.Ctl("Finish").DownPicture = oDlg.LoadPic("C:\Bulb2.ico")

	Set oCtl = oFrm.NewTextBox("TBX1", 150, 50, 1250, 40)
	oCtl.PassWordChar = "*"
	oCtl.MaxLength = 5
	oCtl.ToolTipText = "Enter security code"

	Set oCtl = oFrm.NewMaskedEditBox("MEX1", 1500, 50, 1000, 300)
	oCtl.Mask = "##-???-##"
        oCtl.Format = "dddddd"
'	oCtl.ForeColor = RGB(0, 0, 255)

	Set oCtl = oFrm.NewCheckBox("CBX1", 3750, 50, 1250, 40, "&Selfdestruct", 0)
	oCtl.ForeColor = RGB(255, 0, 0)

	Set oCtl = oFrm.NewTextBox("TBX2", 150, 450, 1250, 40, "StarTrek")
	oCtl.Alignment = 2

	Set oCtl = oFrm.NewDropDownCombo("DDX1", 1500, 450, 1575)
	oCtl.AddItem "Kathryn Janeway"
	oCtl.AddItem "Chakotay"
	oCtl.AddItem "Tuvok"
	oCtl.AddItem "Tom Paris"
	oCtl.AddItem "Harry Kim"
	oCtl.AddItem "B'Elanna Torres"
	oCtl.AddItem "Seven of Nine"
	oCtl.AddItem "Neelix"			
	oCtl.ListIndex = 0

	Set oCtl = oFrm.NewFrame("FRM1", 150, 800, 3100, 1575, "Species")
	oCtl.Tooltiptext = "Enemies of the United Federation of Planets"

	oFrm.NewOptionButton "OBN1", 120, 300, 1000, 255, "&Romulans", False, "FRM1"
	oFrm.NewOptionButton "OBN2", 120, 600, 1000, 255, "&Kazon", True, "FRM1"
	oFrm.NewOptionButton "OBN3", 120, 900, 1000, 255, "&Borg", False, "FRM1"
	oFrm.NewOptionButton "OBN4", 120,1200, 1000, 255, "&8472", False, "FRM1"

 	Set oCtl = oFrm.NewLabel("LBL1", 1350, 300, 1600, 1100, "You have selected the Kazon", "FRM1")
	oCtl.Alignment = 0
	oCtl.BorderStyle = 1
	oCtl.WordWrap = True

 	Set oCtl = oFrm.NewLabel("LBL2", 4750, 50, 1575, 255, " Disabled ")
	oCtl.Alignment = 2
	oCtl.BorderStyle = 1
'	oCtl.WordWrap = True
	oCtl.AutoSize = True

 	Set oCtl = oFrm.NewListBox("LBX1", 3750, 1500, 1750, 1000)
 	oCtl.AddItem "Picard"
 	oCtl.AddItem "Riker"
  	oCtl.AddItem "Data"
 	oCtl.AddItem "Worf"
 	oCtl.AddItem "LaForge"

 	Set oCtl = oFrm.NewLabel("LBL3", 3625, 500, 2000, 255, " Standard icons included in the DLL")
	oCtl.AutoSize = True

	'oFrm.NewImage "IMG1", 3750, 800, 0, 0, "D:\Icons\Iconmania\Computers\Winzip.ico"
	oFrm.NewImage "ICON1", 3750, 800, 0, 0, "IconCritical"
	oFrm.NewImage "ICON2", 4250, 800, 0, 0, "IconQuestion"
	oFrm.NewImage "ICON3", 4750, 800, 0, 0, "IconExclamation"
	oFrm.NewImage "ICON4", 5250, 800, 0, 0, "IconInformation"
	oFrm.Ctl("ICON3").MousePointer = 99

	oFrm.Ctl("ICON3").MouseIcon = oDlg.LoadPic("C:\Pens01.ico")

	Set oCtl = oFrm.NewProgressBar("GAUGE", 150, 2500, 3100, 250, 0, 100, 0)

	Set oCtl = oFrm.NewSlider("SLIDER", 3500, 2500, 2000, 300, 0, 100, 0)
	oCtl.TickStyle = 0 : oCtl.TickFrequency = 10
	oCtl.LargeChange = 10

 	Set oCtl = oFrm.NewLabel("LBL4", 5750, 2500, 200, 300, CStr(oCtl))
	oCtl.BorderStyle = 1
	oCtl.AutoSize = True

	set oCtl=oFrm.NewMultiLineTextBox("MBX1", 150, 3500, 4200, 1500, "")
	oCtl.Text = "This is a Multiline" & vbCrlF & "TextBox"
	oCtl.ToolTipText = "Enter specifications. Use Ctrl+Enter to move to a new line"
	oCtl.ForeColor = RGB(255, 0, 0)

	oFrm.NewTimer "TIMER", 10
	oFrm.Ctl("TIMER").Enabled = False

	oFrm.Taskbar = True
	oFrm.CallBack = True
	oFrm.AutoSize

End Sub

Sub CreateForm2

	Set oFrm = oDlg.NewForm("2")

	oFrm.Caption = sInfo

'	Icon file may not be read-only with standard LoadPicture method (Wsh2!)	
	oFrm.Icon = oDlg.LoadPic("C:\Bulb2.ico")

	oFrm.Picture = oDlg.LoadPic("C:\Windows\Wolken.bmp")

	oFrm.NewButton "Back", 350, 4500, 950, 375, "< &Back"
	oFrm.NewButton "CloseBox", 1450, 4500, 950, 375, "&CloseBox"
	oFrm.NewButton "Finish", 2550, 4500, 950, 375, "&Finish"

	Set oCtl = oFrm.NewCalendar("CAL", 300, 250, 3300, 3500)
	oCtl.DayFont.Bold = False
	oCtl.DayFontColor = RGB(255, 0, 0)

 	Set oCtl = oFrm.NewLabel("LBL5", 350, 4000, 300, 375, "Selected Date:")
	oCtl.BorderStyle = 1
	oCtl.AutoSize = True

	oFrm.AutoSize

'	oFrm.NewImage "IMG1", 0, 0, oFrm.Width, oFrm.Height, "C:\Windows\Clouds.bmp"

	oFrm.Taskbar = False
	oFrm.CallBack = True
	oFrm.AutoSize

	bBox = True	

End Sub

Sub oDlg_ClickHandler(sForm, sControl)

	Dim oFrm, oCtl, X

	Set oFrm = oDlg.Frm(sForm)
	Set oCtl = oFrm.Ctl(sControl)

	Select Case UCase(sForm)
	Case ""
		Select Case UCase(sControl)
		Case "*ACTIVATE"
			oFrm.CloseBox = False
		Case "NEXT"
			oFrm.Hide : bNext = True
		Case "READ"
			MsgBox "Button clicked: " & oDlg.Clicked
			MsgBox "Password entered: " & oFrm.Ctl("TBX1")
			MsgBox "TextBox entered: " & oFrm.Ctl("TBX2")
			MSgBox "OptionButton: " & oFrm.GetOptionButton("FRM1")
			MsgBox "DropDown: " & oFrm.Ctl("DDX1").ListIndex + 1 & "=" & oFrm.Ctl("DDX1")
			MsgBox "Listbox: " & oFrm.Ctl("LBX1").ListIndex + 1 & "=" & oFrm.Ctl("LBX1")
			MsgBox "ProgressBar: " & oFrm.Ctl("GAUGE")
			MsgBox "MultiLinetext: " & oFrm.Ctl("MBX1") 
			MsgBox "MaskedEditBox: " & oFrm.Ctl("MEX1").Text & vbCrlf & oFrm.Ctl("MEX1").FormattedText & vbCrlf & oFrm.Ctl("MEX1").ClipText 
		Case "TOGGLE"
			oFrm.Ctl("CBX1").Value = Abs(oFrm.Ctl("CBX1") -1)
		Case "PROGRESS"
			Dim nVal
			nVal = oFrm.Ctl("GAUGE").Value + 10
			if nVal > 100 Then nVal = 100
			oFrm.Ctl("GAUGE").Value = nVal
			oFrm.Ctl("SLIDER").Value = nVal
			oFrm.Ctl("LBL4").Caption = CStr(nVal)
		Case "TIMER"
			nCount = nCount + 1
			If nCount = 3 Then
				oFrm.Ctl("CBX1").Value = 0 
				oFrm.Ctl("TIMER").Enabled = False
				oFrm.Hide : bNext = True
			Else
				oShell.Popup "This dialog will selfdestruct in " & CStr(30 - nCount * 10) & " seconds", 3
			End If
		Case "FINISH"
			oFrm.Hide
		Case "*CLOSE"
			oShell.Popup "Closebox (ignored ..., or is it)" ,3
		Case "CBX1"
			If oFrm.Ctl("CBX1") = 1 Then
				oFrm.Ctl("LBL2").Caption = " Enabled "
				nCount =0 : oFrm.Ctl("TIMER").Enabled = True
				oShell.Popup "This dialog will selfdestruct in 30 seconds", 3
			Else
				oFrm.Ctl("LBL2").Caption = " Disabled "
				nCount = 0 : oFrm.Ctl("TIMER").Enabled = False
			End If
		Case "OBN1", "OBN2", "OBN3", "OBN4"
			oFrm.Ctl("LBL1").Caption = "You have selected: " & oFrm.Ctl(sControl).Caption
		Case "ICON1", "ICON2", "ICON3", "ICON4"
			Msgbox sControl & " clicked"
		Case "DDX1", "LBX1"
			oFrm.Ctl("TBX2").Text = oFrm.Ctl(sControl)
		Case "SLIDER"
			oFrm.Ctl("LBL4").Caption = CStr(oFrm.Ctl("SLIDER"))
			oFrm.Ctl("GAUGE").Value = oFrm.Ctl("SLIDER")
		Case Else
		End Select
	Case "2"
		Select Case UCase(sControl)		
		Case "BACK"
			oFrm.Hide 
		Case "CLOSEBOX"
			bBox = Not bBox
			oFrm.CloseBox = bBox
		Case "FINISH"
			oFrm.Hide
		Case "CAL"
			oFrm.Ctl("LBL5").Caption = "Selected date: " & oFrm.Ctl("CAL").Value
		Case "*CLOSE"
			oFrm.Hide
		Case Else
		End Select
	Case Else
	End Select	
    
End Sub

