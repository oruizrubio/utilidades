VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{8E27C92E-1264-101C-8A2F-040224009C02}#7.0#0"; "MSCAL.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmDialog 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   5835
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7230
   Icon            =   "WshDialog.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5835
   ScaleWidth      =   7230
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin MSComctlLib.ListView ListViewArray 
      Height          =   375
      Index           =   0
      Left            =   4800
      TabIndex        =   20
      Top             =   3960
      Visible         =   0   'False
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   661
      View            =   3
      Arrange         =   2
      MultiSelect     =   -1  'True
      LabelWrap       =   0   'False
      HideSelection   =   0   'False
      AllowReorder    =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      PictureAlignment=   5
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin MSComctlLib.ImageList ImageListArray 
      Index           =   0
      Left            =   5400
      Top             =   3000
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin MSComCtl2.UpDown UpDownHorizontalArray 
      Height          =   240
      Index           =   0
      Left            =   4800
      TabIndex        =   18
      Top             =   3000
      Visible         =   0   'False
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   423
      _Version        =   393216
      Orientation     =   1
      Enabled         =   -1  'True
   End
   Begin TabDlg.SSTab SSTabArray 
      Height          =   660
      Index           =   0
      Left            =   240
      TabIndex        =   17
      Top             =   5040
      Visible         =   0   'False
      Width           =   6615
      _ExtentX        =   11668
      _ExtentY        =   1164
      _Version        =   393216
      Tabs            =   1
      TabHeight       =   520
      TabCaption(0)   =   "SSTabArray"
      TabPicture(0)   =   "WshDialog.frx":030A
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).ControlCount=   0
   End
   Begin VB.FileListBox FileListBoxArray 
      Height          =   285
      Index           =   0
      Left            =   4800
      MultiSelect     =   2  'Extended
      TabIndex        =   16
      Top             =   4560
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.DirListBox DirListBoxArray 
      Height          =   315
      Index           =   0
      Left            =   2400
      TabIndex        =   15
      Top             =   4560
      Visible         =   0   'False
      Width           =   1935
   End
   Begin VB.DriveListBox DriveListBoxArray 
      Height          =   315
      Index           =   0
      Left            =   240
      TabIndex        =   14
      Top             =   4560
      Visible         =   0   'False
      Width           =   1935
   End
   Begin MSMask.MaskEdBox MaskedEditBoxArray 
      Height          =   375
      Index           =   0
      Left            =   240
      TabIndex        =   13
      Top             =   2280
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   661
      _Version        =   393216
      AutoTab         =   -1  'True
      PromptChar      =   "_"
   End
   Begin VB.TextBox MultiLineTextBoxArray 
      Height          =   645
      Index           =   0
      Left            =   2040
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   12
      Text            =   "WshDialog.frx":0326
      Top             =   1320
      Visible         =   0   'False
      Width           =   1935
   End
   Begin MSACAL.Calendar CalendarArray 
      Height          =   2655
      Index           =   0
      Left            =   4200
      TabIndex        =   11
      Top             =   120
      Visible         =   0   'False
      Width           =   2655
      _Version        =   524288
      _ExtentX        =   4683
      _ExtentY        =   4683
      _StockProps     =   1
      BackColor       =   -2147483633
      Year            =   2001
      Month           =   3
      Day             =   19
      DayLength       =   0
      MonthLength     =   2
      DayFontColor    =   0
      FirstDay        =   1
      GridCellEffect  =   1
      GridFontColor   =   10485760
      GridLinesColor  =   -2147483632
      ShowDateSelectors=   -1  'True
      ShowDays        =   -1  'True
      ShowHorizontalGrid=   -1  'True
      ShowTitle       =   0   'False
      ShowVerticalGrid=   -1  'True
      TitleFontColor  =   10485760
      ValueIsNull     =   0   'False
      BeginProperty DayFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty GridFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty TitleFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComctlLib.Slider SliderArray 
      Height          =   255
      Index           =   0
      Left            =   2400
      TabIndex        =   10
      Top             =   3600
      Visible         =   0   'False
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   450
      _Version        =   393216
   End
   Begin MSComctlLib.ProgressBar ProgressBarArray 
      Height          =   375
      Index           =   0
      Left            =   2280
      TabIndex        =   9
      Top             =   2880
      Visible         =   0   'False
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   661
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.Timer TimerArray 
      Index           =   0
      Left            =   6360
      Top             =   3000
   End
   Begin VB.ComboBox DropDownComboArray 
      Height          =   315
      Index           =   0
      Left            =   240
      TabIndex        =   8
      Text            =   "DropDownComboArray"
      Top             =   3480
      Visible         =   0   'False
      Width           =   2055
   End
   Begin VB.ListBox ListBoxArray 
      Height          =   255
      Index           =   0
      Left            =   240
      TabIndex        =   7
      Top             =   4080
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.ComboBox DropDownListArray 
      Height          =   315
      Index           =   0
      Left            =   240
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   2880
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.OptionButton OptionButtonArray 
      Caption         =   "OptionButtonArray"
      Height          =   195
      Index           =   0
      Left            =   240
      TabIndex        =   5
      Top             =   1800
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.CheckBox CheckBoxArray 
      Caption         =   "CheckBoxArray"
      Height          =   255
      Index           =   0
      Left            =   240
      TabIndex        =   4
      Top             =   1320
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.Frame FrameArray 
      Caption         =   "FrameArray"
      Height          =   375
      Index           =   0
      Left            =   2160
      TabIndex        =   3
      Top             =   120
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox TextBoxArray 
      Height          =   285
      Index           =   0
      Left            =   2280
      TabIndex        =   2
      Text            =   "TextBoxArray"
      Top             =   2280
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.CommandButton CommandButtonArray 
      Caption         =   "CommandButtonArray"
      Height          =   375
      Index           =   0
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin MSComCtl2.UpDown UpDownVerticalArray 
      Height          =   255
      Index           =   0
      Left            =   4320
      TabIndex        =   19
      Top             =   3000
      Visible         =   0   'False
      Width           =   240
      _ExtentX        =   423
      _ExtentY        =   450
      _Version        =   393216
      Enabled         =   -1  'True
   End
   Begin VB.Image ImageArray 
      Height          =   375
      Index           =   0
      Left            =   2160
      MousePointer    =   99  'Custom
      Top             =   720
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label LabelArray 
      Caption         =   "LabelArray"
      Height          =   255
      Index           =   0
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Visible         =   0   'False
      Width           =   1695
   End
End
Attribute VB_Name = "frmDialog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'----------------------------------------------------------------------------
' Copyright 2001-2004 Peter J.C. van der Klugt
'----------------------------------------------------------------------------
' This file is part of WshDialog.dll
'
' WshDialog.dll is free software; you can redistribute it and/or modify
' it under the terms of the GNU General Public License as published by
' the Free Software Foundation; either version 2 of the License, or
' (at your option) any later version.
'
' WshDialog.dll is distributed in the hope that it will be useful,
' but WITHOUT ANY WARRANTY; without even the implied warranty of
' MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
' GNU General Public License for more details.
'
' A copy of the GNU General Public License is included in the helpfile
' WshDialog.chm which you should have received along with the software.
' If not, you can write to the Free Software Foundation, Inc.,
' 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
'----------------------------------------------------------------------------

Option Explicit

'The parent of this form (used for callback purposes)
Private m_Parent As Kit

'Callback to the user's code or not (hides form directly)
Private m_CallBack As Boolean

'The name of the form (can't use the intrinsic Name property)
Private m_Id As String

'The last assigned TabIndex
Private m_TabIndex As Integer

'Some Window properties
Private m_TaskBar As Boolean
Private m_CloseBox As Boolean
Private m_MinBox As Boolean
Private m_UDMinBox As Boolean       'Last User Defined Setting

'Cancel Listview LabelEdit operation
Private m_CancelLabelEdit As Boolean

Friend Sub Init(ByVal sId As String, ByVal pParent As Kit)

    Dim X As Integer
    
    'Set the ID (name)
    m_Id = sId
    'Initialize the tabindex
    m_TabIndex = -1
    'Set the form's parent to me (aka "Callback") ...
    Set m_Parent = pParent
   
    'Save the current state of some Window properties
    m_TaskBar = Me.ShowInTaskbar
    m_CloseBox = Me.ControlBox
    m_MinBox = Me.MinButton
    m_UDMinBox = m_MinBox
    
    'Handle form keyboard events before control keyboard events
    KeyPreview = True
    
    'Initialize controlarrays
    For X = Me.Controls.Count - 1 To 0 Step -1
        Select Case ArrayIndex(X)
        Case Is < 1
            'Either not a controlarray (-1) or element(0)
            Select Case UCase(TypeName(Me.Controls(X)))
            Case "TIMER", "PICTUREBOX", "IMAGELIST", "COMMONDIALOG"
                'Can't set these properties for these controls
            Case Else
                Me.Controls(X).Visible = False
                Me.Controls(X).Left = -20000
                Me.Controls(X).Top = -20000
            End Select
        Case Else
        End Select
    Next

End Sub

Public Sub Clear()
    'Unload (= remove) all added controlarray elements and the form itself
        
    Dim X As Integer, oCtl As Control
        
    For X = Me.Controls.Count - 1 To 0 Step -1
        If ArrayIndex(X) > 0 Then
            Set oCtl = Me.Controls(X)
            On Error Resume Next
                Unload oCtl
            On Error GoTo 0
        End If
    Next X
    
    'Reset the tabindex
    m_TabIndex = -1
    
    'Unloading the form will trigger the Form_Unload event
    'Make sure m_Parent.BtnClickEvent doesn't callback to the user
    m_CallBack = False
    Unload Me

End Sub

Private Sub Form_Activate()

    'Ignore if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    m_Parent.ClickEvent Me, "*ACTIVATE", True

End Sub

Private Sub Form_UnLoad(Cancel As Integer)
    
    'Closebox, Alt+F4 or Unload used to close the form
    m_Parent.ClickEvent Me, "*CLOSE", m_CallBack
    
    'Set Cancel to -1 so the form won't be unloaded as yet
    Cancel = -1
    
End Sub

Private Sub Form_KeyUp(keycode As Integer, shift As Integer)
    
    Dim bShiftDown As Boolean, bAltDown As Boolean, bCtrlDown As Boolean
    
    'Ignore if m_CallBack disabled
    If Not m_CallBack Then Exit Sub
   
    bShiftDown = (shift And vbShiftMask) > 0
    bAltDown = (shift And vbAltMask) > 0
    bCtrlDown = (shift And vbCtrlMask) > 0
    
    'Ignore shifted keystates for now
    If bShiftDown Or bAltDown Or bCtrlDown Then Exit Sub
    
    Select Case keycode
    Case vbKeyF1 To vbKeyF12
        m_Parent.ClickEvent Me, "*F" & Trim(CStr(keycode - vbKeyF1 + 1)), True
    Case Else
    End Select
       
End Sub

Private Sub CommandButtonArray_Click(Index As Integer)

    'Always sink commandbuttons events, with or without callback
    m_Parent.ClickEvent Me, StripTag(CommandButtonArray(Index).Tag), m_CallBack
    
End Sub

Private Sub CheckBoxArray_Click(Index As Integer)

    'Ignore checkbox clicks if m_CallBack disabled
    If Not m_CallBack Then Exit Sub
    
    m_Parent.ClickEvent Me, StripTag(CheckBoxArray(Index).Tag), True
    
End Sub

Private Sub OptionButtonArray_Click(Index As Integer)

    'Ignore optionbutton clicks if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    m_Parent.ClickEvent Me, StripTag(OptionButtonArray(Index).Tag), True
    
End Sub

Private Sub DropDownListArray_Click(Index As Integer)

    'Ignore dropdown clicks if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    m_Parent.ClickEvent Me, StripTag(DropDownListArray(Index).Tag), True
    
End Sub

Private Sub DropDownComboArray_Click(Index As Integer)

    'Ignore dropdown clicks if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    m_Parent.ClickEvent Me, StripTag(DropDownComboArray(Index).Tag), True
    
End Sub

Private Sub ListBoxArray_Click(Index As Integer)

    'Ignore listbox clicks if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    m_Parent.ClickEvent Me, StripTag(ListBoxArray(Index).Tag), True
    
End Sub

Private Sub ImageArray_Click(Index As Integer)

    'Ignore image clicks if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    m_Parent.ClickEvent Me, StripTag(ImageArray(Index).Tag), True
    
End Sub

Private Sub SliderArray_Change(Index As Integer)

    'Ignore slider clicks if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    m_Parent.ClickEvent Me, StripTag(SliderArray(Index).Tag), True
    
End Sub

Private Sub TimerArray_Timer(Index As Integer)
    
    Dim nTarget As Integer, nCount As Integer
    Dim aParts As Variant
        
    'The Tag format is <timername>0<target>0<count>
    
    'Split into components
    aParts = Split(TimerArray(Index).Tag, Chr(0))
    If UBound(aParts) > 0 Then nTarget = Val(aParts(1)) Else nTarget = 1
    If UBound(aParts) > 1 Then nCount = Val(aParts(2)) Else nCount = 0
    
    'Increase count and fire event only when target reached
    nCount = nCount + 1
    If nCount >= nTarget Then
        'Sink timer events only if m_CallBack is enabled
        If m_CallBack Then m_Parent.ClickEvent Me, aParts(0), True
        nCount = 0
    End If
    'Write back with modified count
    aParts(1) = Trim(CStr(nTarget))
    aParts(2) = Trim(CStr(nCount))
    TimerArray(Index).Tag = Join(aParts, Chr(0))
    
End Sub

Private Sub CalendarArray_AfterUpdate(Index As Integer)
    'We use AfterUpdate because it receives both keyboard and mouse events
    
    'The KeyUp/Down events do not when the arrow keys are used by themselves
    'but only in combination with the Ctrl key. When using AfterUpdate we do
    'not need the Click event
    
    'Ignore calendar events if m_CallBack disabled
    If Not m_CallBack Then Exit Sub
    
    m_Parent.ClickEvent Me, StripTag(CalendarArray(Index).Tag), True
    
End Sub

Private Sub DriveListBoxArray_Change(Index As Integer)

    'Ignore drive changes if m_CallBack disabled
    If Not m_CallBack Then Exit Sub
    
    m_Parent.ClickEvent Me, StripTag(DriveListBoxArray(Index).Tag), True

End Sub

Private Sub DirListBoxArray_Change(Index As Integer)

    'Ignore directory changes if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    ChDir DirListBoxArray(Index).List(DirListBoxArray(Index).ListIndex)

    m_Parent.ClickEvent Me, StripTag(DirListBoxArray(Index).Tag), True

End Sub

Private Sub DirListBoxArray_Click(Index As Integer)

    'Ignore directory changes if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    ChDir DirListBoxArray(Index).List(DirListBoxArray(Index).ListIndex)

    m_Parent.ClickEvent Me, StripTag(DirListBoxArray(Index).Tag), True

End Sub

Private Sub DirListBoxArray_KeyUp(Index As Integer, keycode As Integer, shift As Integer)
    
    If (shift And vbShiftMask) > 0 Then Exit Sub
    If (shift And vbAltMask) > 0 Then Exit Sub
    If (shift And vbCtrlMask) > 0 Then Exit Sub
    
    Select Case keycode
    Case vbKeyLeft, vbKeyRight, vbKeyUp, vbKeyDown, vbKeyHome, vbKeyEnd, vbKeyPageUp, vbKeyPageDown
        If Not m_CallBack Then Exit Sub
        'Make the cursor keys behave like a change/click event
        m_Parent.ClickEvent Me, StripTag(DirListBoxArray(Index).Tag), True
    Case vbKeyReturn
        'Make the Enter key behave like a double-click (generates a Change event)
        DirListBoxArray(Index).Path = DirListBoxArray(Index).List(DirListBoxArray(Index).ListIndex)
    Case Else
    End Select
    
End Sub

Private Sub FileListBoxArray_DblClick(Index As Integer)

    'Ignore file changes if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    m_Parent.ClickEvent Me, StripTag(FileListBoxArray(Index).Tag), True

End Sub

Private Sub ListViewArray_BeforeLabelEdit(Index As Integer, Cancel As Integer)
    'Initialisation at start of labelediting operation

    m_CancelLabelEdit = False
    
End Sub

Private Sub ListViewArray_AfterLabelEdit(Index As Integer, Cancel As Integer, NewString As String)

    Dim sEvent As String

    'Ignore listview double-clicks if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    'Pass the Eventname and NewString in addition to the Control's tag
    sEvent = StripTag(ListViewArray(Index).Tag)
    sEvent = sEvent & Chr(0) & "AfterLabelEdit"
    sEvent = sEvent & Chr(0) & NewString
    m_Parent.ClickEvent Me, sEvent, True
    
    If m_CancelLabelEdit Then Cancel = True

End Sub

Private Sub ListViewArray_ColumnClick(Index As Integer, ByVal ColumnHeader As ColumnHeader)
    
    If ListViewArray(Index).SortKey = ColumnHeader.Index - 1 Then
        If ListViewArray(Index).SortOrder = lvwAscending Then
            ListViewArray(Index).SortOrder = lvwDescending
        Else
            ListViewArray(Index).SortOrder = lvwAscending
        End If
    Else
        ListViewArray(Index).SortKey = ColumnHeader.Index - 1
        ListViewArray(Index).SortOrder = lvwAscending
    End If

End Sub

Private Sub ListViewArray_DblClick(Index As Integer)

    'Ignore listview double-clicks if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    'This is the default event, pass only the Control's name (tag)
    m_Parent.ClickEvent Me, StripTag(ListViewArray(Index).Tag), True

End Sub

Private Sub ListViewArray_KeyPress(Index As Integer, keyascii As Integer)

    'Ignore listview enter key if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    'Make the Enter key behave like a double-click event
    If keyascii = 13 Then
        'This is the default event, pass only the Control's name (tag)
        m_Parent.ClickEvent Me, StripTag(ListViewArray(Index).Tag), True
        keyascii = 0
    End If

End Sub

Private Sub ListViewArray_KeyUp(Index As Integer, keycode As Integer, shift As Integer)

    Dim sEvent As String
    
    'Ignore if m_CallBack disabled
    If Not m_CallBack Then Exit Sub
    
    If (shift And vbShiftMask) > 0 Then Exit Sub
    If (shift And vbAltMask) > 0 Then Exit Sub
    If (shift And vbCtrlMask) > 0 Then Exit Sub
    
    Select Case keycode
    Case vbKeyBack
        sEvent = StripTag(ListViewArray(Index).Tag) & Chr(0) & "KeyBack"
        m_Parent.ClickEvent Me, sEvent, True
    Case vbKeyInsert
        sEvent = StripTag(ListViewArray(Index).Tag) & Chr(0) & "KeyInsert"
        m_Parent.ClickEvent Me, sEvent, True
    Case vbKeyDelete
        sEvent = StripTag(ListViewArray(Index).Tag) & Chr(0) & "KeyDelete"
        m_Parent.ClickEvent Me, sEvent, True
    Case Else
    End Select

End Sub

Private Sub ListViewArray_ItemClick(Index As Integer, ByVal oItem As ListItem)

    Dim sEvent As String
    
    'Ignore listview item-clicks if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    'Pass the Eventname and Listitem index in addition to the Control's tag
    sEvent = StripTag(ListViewArray(Index).Tag)
    sEvent = sEvent & Chr(0) & "ItemClick"
    sEvent = sEvent & Chr(0) & Trim(CStr(oItem.Index))
    m_Parent.ClickEvent Me, sEvent, True

End Sub

Private Sub ListViewArray_ItemCheck(Index As Integer, ByVal oItem As ListItem)

    Dim sEvent As String
    
    'Ignore listview item-clicks if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    'Pass the Eventname and Listitem index in addition to the Control's tag
    sEvent = StripTag(ListViewArray(Index).Tag)
    sEvent = sEvent & Chr(0) & "ItemCheck"
    sEvent = sEvent & Chr(0) & Trim(CStr(oItem.Index))
    m_Parent.ClickEvent Me, sEvent, True

End Sub

Private Sub UpDownVerticalArray_Change(Index As Integer)

    'Ignore dropdown clicks if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    m_Parent.ClickEvent Me, StripTag(UpDownVerticalArray(Index).Tag), True
    
End Sub

Private Sub UpDownHorizontalArray_Change(Index As Integer)

    'Ignore dropdown clicks if m_CallBack disabled
    If Not m_CallBack Then Exit Sub

    m_Parent.ClickEvent Me, StripTag(UpDownHorizontalArray(Index).Tag), True
    
End Sub

Public Sub CancelLabelEdit()
    'Cancel the current labelediting operation
    
    m_CancelLabelEdit = True
    
End Sub

Public Sub LoadIcon(ByVal sIcon As String)
    'This routine is supplied only for backward compatibility
    'It is superseded by the more generic LoadPic function
    
    On Error Resume Next
        Set Me.Icon = LoadPicture(sIcon)
    On Error GoTo 0
    
End Sub

Public Function Ctl(ByVal sName As String) As Object
    'Returns a reference to a specific control
    
    Dim X As Integer
    
    Set Ctl = Nothing
    X = ControlIndex(sName)
    If X > 0 Then Set Ctl = Me.Controls(X)
    
End Function

Public Function NewFrame(ByVal sName As String, ByVal nLeft As Integer, _
                         ByVal nTop As Integer, ByVal nWidth As Integer, _
                         ByVal nHeight As Integer, _
                         Optional ByVal sCaption As String = "", _
                         Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded frame has index 0
    Dim X As Integer
    X = Me.FrameArray.Count
    Load Me.FrameArray(X)
    
    Set NewFrame = Me.FrameArray(X)
    With NewFrame
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Caption = sCaption: .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
                      
End Function

Public Function NewLabel(ByVal sName As String, ByVal nLeft As Integer, _
                         ByVal nTop As Integer, ByVal nWidth As Integer, _
                         ByVal nHeight As Integer, ByVal sCaption As String, _
                         Optional ByVal sContainer As String = "") As Object
   
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded label has index 0
    Dim X As Integer
    X = Me.LabelArray.Count
    Load Me.LabelArray(X)
    
    Set NewLabel = Me.LabelArray(X)
    With NewLabel
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Caption = sCaption: .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
                  
End Function

Public Function NewButton(ByVal sName As String, ByVal nLeft As Integer, _
                          ByVal nTop As Integer, ByVal nWidth As Integer, _
                          ByVal nHeight As Integer, ByVal sCaption As String, _
                          Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded commandbutton has index 0
    Dim X As Integer
    X = Me.CommandButtonArray.Count
    Load Me.CommandButtonArray(X)
    
    Set NewButton = Me.CommandButtonArray(X)
    With NewButton
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Caption = sCaption: .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
      
End Function

Public Function NewTextBox(ByVal sName As String, ByVal nLeft As Integer, _
                           ByVal nTop As Integer, ByVal nWidth As Integer, _
                           ByVal nHeight As Integer, _
                           Optional ByVal sText As String = "", _
                           Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded textbox has index 0
    Dim X As Integer
    X = Me.TextBoxArray.Count
    Load Me.TextBoxArray(X)
    
    Set NewTextBox = Me.TextBoxArray(X)
    With NewTextBox
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Text = sText: .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewMultiLineTextBox(ByVal sName As String, ByVal nLeft As Integer, _
                                    ByVal nTop As Integer, ByVal nWidth As Integer, _
                                    ByVal nHeight As Integer, _
                                    Optional ByVal sText As String = "", _
                                    Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded textbox has index 0
    Dim X As Integer
    X = Me.MultiLineTextBoxArray.Count
    Load Me.MultiLineTextBoxArray(X)
    
    Set NewMultiLineTextBox = Me.MultiLineTextBoxArray(X)
    With NewMultiLineTextBox
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Text = sText: .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewCheckBox(ByVal sName As String, ByVal nLeft As Integer, _
                            ByVal nTop As Integer, ByVal nWidth As Integer, _
                            ByVal nHeight As Integer, ByVal sCaption As String, _
                            Optional ByVal nValue As Integer = 0, _
                            Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded checkbox has index 0
    Dim X As Integer
    X = Me.CheckBoxArray.Count
    Load Me.CheckBoxArray(X)
    
    Set NewCheckBox = Me.CheckBoxArray(X)
    With NewCheckBox
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Caption = sCaption: .Value = nValue
        .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewOptionButton(ByVal sName As String, ByVal nLeft As Integer, _
                                ByVal nTop As Integer, ByVal nWidth As Integer, _
                                ByVal nHeight As Integer, ByVal sCaption As String, _
                                Optional ByVal bValue As Boolean = False, _
                                Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded checkbox has index 0
    Dim X As Integer
    X = Me.OptionButtonArray.Count
    Load Me.OptionButtonArray(X)
    
    Set NewOptionButton = Me.OptionButtonArray(X)
    With NewOptionButton
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Caption = sCaption: .Value = bValue
        .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewDropdownList(ByVal sName As String, ByVal nLeft As Integer, _
                                ByVal nTop As Integer, ByVal nWidth As Integer, _
                                Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded dropdownlist has index 0
    Dim X As Integer
    X = Me.DropDownListArray.Count
    Load Me.DropDownListArray(X)
    
    Set NewDropdownList = Me.DropDownListArray(X)
    With NewDropdownList
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth)   '.Height is read-only
        .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewDropdownCombo(ByVal sName As String, ByVal nLeft As Integer, _
                                 ByVal nTop As Integer, ByVal nWidth As Integer, _
                                 Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded dropdowncombo has index 0
    Dim X As Integer
    X = Me.DropDownComboArray.Count
    Load Me.DropDownComboArray(X)
    
    Set NewDropdownCombo = Me.DropDownComboArray(X)
    With NewDropdownCombo
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth)   '.Height is read-only
        .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewListbox(ByVal sName As String, ByVal nLeft As Integer, _
                           ByVal nTop As Integer, ByVal nWidth As Integer, _
                           ByVal nHeight As Integer, _
                           Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded listbox has index 0
    Dim X As Integer
    X = Me.ListBoxArray.Count
    Load Me.ListBoxArray(X)
    
    Set NewListbox = Me.ListBoxArray(X)
    With NewListbox
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewImage(ByVal sName As String, ByVal nLeft As Integer, _
                         ByVal nTop As Integer, ByVal nWidth As Integer, _
                         ByVal nHeight As Integer, ByVal sImage As String, _
                         Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded image has index 0
    Dim X As Integer
    X = Me.ImageArray.Count
    Load Me.ImageArray(X)
    
    Set NewImage = Me.ImageArray(X)
    With NewImage
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        'Stretch image it either width or height > 0
        If nWidth > 0 Then
             .Width = CInt(nWidth): .Stretch = True
        End If
        If nHeight > 0 Then
             .Height = CInt(nHeight): .Stretch = True
        End If
        On Error Resume Next
            Set .Picture = m_Parent.LoadPic(sImage)
        On Error GoTo 0
        .Visible = True: .ZOrder
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewTimer(ByVal sName As String, ByVal nSeconds As Long) As Object
     
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded timer has index 0
    Dim X As Integer
    X = Me.TimerArray.Count
    Load Me.TimerArray(X)
    
    Set NewTimer = Me.TimerArray(X)
       
    NewTimer.Tag = sName
    SetTimerInterval NewTimer, nSeconds
    
End Function

Public Function NewTimerInterval(ByVal sName As String, ByVal nSeconds As Long) As Object

    Set NewTimerInterval = Ctl(sName)
    
    Select Case UCase(TypeName(NewTimerInterval))
    Case "TIMER"
        NewTimerInterval.Tag = sName
        SetTimerInterval NewTimerInterval, nSeconds
    Case Else
        Set NewTimerInterval = Nothing
    End Select

End Function

Private Sub SetTimerInterval(ByVal oTimer As Object, ByVal nSeconds As Long)

    Dim nRest As Long, nTarget As Long, nInterval As Long
    
    'Since the maximum interval is 65535 (milliseconds) we need to calculate
    'some optimum number of iterations of an interval below 66 seconds
    'to reach nSeconds if this is above 65 seconds
    
    If nSeconds < 0 Then nSeconds = 0
    
    'Calculate the number of times the maximum interval (65 seconds)
    'fits into nSeconds and add 1 if there is a remainder
    nRest = nSeconds Mod CLng(65)
    If nRest > 0 Then nRest = 1
    nTarget = (nSeconds \ CLng(65)) + nRest
    
    'Calculate the interval based on the calculated iterations (target)
    nInterval = (nSeconds * CLng(1000)) \ nTarget
    
    'Expand the Tag property to <timername>0<target>0<count>
    'This will be handled by the TimerArray_Timer function
    'We can't just countdown to 0 (must retain the target)
    oTimer.Tag = oTimer.Tag & Chr(0) & Trim(CStr(nTarget)) & Chr(0) & "0"
    oTimer.Interval = nInterval

End Sub

Public Function NewProgressBar(ByVal sName As String, ByVal nLeft As Integer, _
                               ByVal nTop As Integer, ByVal nWidth As Integer, _
                               ByVal nHeight As Integer, ByVal nMinimum As Integer, _
                               ByVal nMaximum As Integer, _
                               Optional ByVal nValue As Integer = 0, _
                               Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded progressbar has index 0
    Dim X As Integer
    X = Me.ProgressBarArray.Count
    Load Me.ProgressBarArray(X)
    
    Set NewProgressBar = Me.ProgressBarArray(X)
    With NewProgressBar
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Min = CInt(nMinimum): .Max = CInt(nMaximum)
        If nValue >= .Min And nValue <= .Max Then .Value = nValue Else .Value = .Min
        .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewSlider(ByVal sName As String, ByVal nLeft As Integer, _
                          ByVal nTop As Integer, ByVal nWidth As Integer, _
                          ByVal nHeight As Integer, ByVal nMinimum As Integer, _
                          ByVal nMaximum As Integer, Optional ByVal nValue = 0, _
                          Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded slider has index 0
    Dim X As Integer
    X = Me.SliderArray.Count
    Load Me.SliderArray(X)
    
    Set NewSlider = Me.SliderArray(X)
    With NewSlider
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Min = CInt(nMinimum): .Max = CInt(nMaximum)
         .Value = nValue: .SmallChange = 1
        .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewCalendar(ByVal sName As String, ByVal nLeft As Integer, _
                            ByVal nTop As Integer, ByVal nWidth As Integer, _
                            ByVal nHeight As Integer, Optional ByVal nDay As Variant, _
                            Optional ByVal nMonth As Variant, Optional ByVal nYear As Variant, _
                            Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded calendar has index 0
    Dim X As Integer
    X = Me.CalendarArray.Count
    Load Me.CalendarArray(X)
    
    Set NewCalendar = Me.CalendarArray(X)
    With NewCalendar
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Day = Day(Now): .Month = Month(Now): .Year = Year(Now)
        If Not IsMissing(nDay) And IsNumeric(nDay) Then .Day = CInt(nDay)
        If Not IsMissing(nMonth) And IsNumeric(nMonth) Then .Month = CInt(nMonth)
        If Not IsMissing(nYear) And IsNumeric(nYear) Then .Year = CInt(nYear)
        .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewMaskedEditBox(ByVal sName As String, ByVal nLeft As Integer, _
                                 ByVal nTop As Integer, ByVal nWidth As Integer, _
                                 ByVal nHeight As Integer, _
                                 Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded maskededitbox has index 0
    Dim X As Integer
    X = Me.MaskedEditBoxArray.Count
    Load Me.MaskedEditBoxArray(X)
    
    Set NewMaskedEditBox = Me.MaskedEditBoxArray(X)
    With NewMaskedEditBox
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewDriveListBox(ByVal sName As String, ByVal nLeft As Integer, _
                                ByVal nTop As Integer, ByVal nWidth As Integer, _
                                Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded drivelistbox has index 0
    Dim X As Integer
    X = Me.DriveListBoxArray.Count
    Load Me.DriveListBoxArray(X)
    
    Set NewDriveListBox = Me.DriveListBoxArray(X)
    With NewDriveListBox
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewDirListBox(ByVal sName As String, ByVal nLeft As Integer, _
                              ByVal nTop As Integer, ByVal nWidth As Integer, _
                              ByVal nHeight As Integer, _
                              Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded dirlistbox has index 0
    Dim X As Integer
    X = Me.DirListBoxArray.Count
    Load Me.DirListBoxArray(X)
    
    Set NewDirListBox = Me.DirListBoxArray(X)
    With NewDirListBox
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewFileListBox(ByVal sName As String, ByVal nLeft As Integer, _
                               ByVal nTop As Integer, ByVal nWidth As Integer, _
                               ByVal nHeight As Integer, _
                               Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded filelistbox has index 0
    Dim X As Integer
    X = Me.FileListBoxArray.Count
    Load Me.FileListBoxArray(X)
    
    Set NewFileListBox = Me.FileListBoxArray(X)
    With NewFileListBox
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewTabs(ByVal sName As String, ByVal nLeft As Integer, _
                        ByVal nTop As Integer, ByVal nWidth As Integer, _
                        ByVal nHeight As Integer, _
                        Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded SSTab control has index 0
    Dim X As Integer
    X = Me.SSTabArray.Count
    Load Me.SSTabArray(X)
    
    Set NewTabs = Me.SSTabArray(X)
    With NewTabs
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewUpDown(ByVal sName As String, ByVal nLeft As Integer, _
                          ByVal nTop As Integer, ByVal nWidth As Integer, _
                          ByVal nHeight As Integer, Optional ByVal bHorizontal As Boolean = False, _
                          Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded UpDown control has index 0
    Dim X As Integer
    
    If bHorizontal Then
        X = Me.UpDownHorizontalArray.Count
        Load Me.UpDownHorizontalArray(X)
        Set NewUpDown = Me.UpDownHorizontalArray(X)
    Else
        X = Me.UpDownVerticalArray.Count
        Load Me.UpDownVerticalArray(X)
        Set NewUpDown = Me.UpDownVerticalArray(X)
    End If
    
    With NewUpDown
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewImageList(ByVal sName As String, _
                             ByVal nWidth As Integer, ByVal nHeight As Integer)

    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded ImageList control has index 0
    Dim X As Integer
    X = Me.ImageListArray.Count
    Load Me.ImageListArray(X)
    
    Set NewImageList = Me.ImageListArray(X)
    With NewImageList
        .Tag = sName
        .ImageWidth = CInt(nWidth): .ImageHeight = CInt(nHeight)
        .MaskColor = frmShared.IconLarge.BackColor
    End With
    
End Function

Public Function NewImageListPicture(ByVal ImgList As ImageList, ByVal oPic As Picture, ByVal sKey As String) As Long

    'Add a picture to the specified image list (only if it does not exist already)

    Dim X As Integer

    'See if an icon with the specified key is already present
    For X = 1 To ImgList.ListImages.Count
        If ImgList.ListImages(X).Key = sKey Then
            NewImageListPicture = X
            Exit Function
        End If
    Next X
  
    'Key not found, add icon to imagelist (might cause insufficient memory errors)
    On Error GoTo ErrorHandler
    ImgList.ListImages.Add , sKey, oPic
    NewImageListPicture = ImgList.ListImages.Item(sKey).Index
    
ErrorHandler:
        
End Function

Public Function NewListView(ByVal sName As String, ByVal nLeft As Integer, _
                            ByVal nTop As Integer, ByVal nWidth As Integer, _
                            ByVal nHeight As Integer, _
                            Optional ByVal sContainer As String = "") As Object
    
    If Not ValidControlName(sName) Then Exit Function
    
    'First preloaded Listview control has index 0
    Dim X As Integer
    X = Me.ListViewArray.Count
    Load Me.ListViewArray(X)
    
    Set NewListView = Me.ListViewArray(X)
    With NewListView
        .Tag = sName
        .Left = CInt(nLeft): .Top = CInt(nTop)
        .Width = CInt(nWidth): .Height = CInt(nHeight)
        .Visible = True: .ZOrder
        m_TabIndex = m_TabIndex + 1: .TabIndex = m_TabIndex
        Set .Container = Container(sContainer)
    End With
    
End Function

Public Function NewListViewFileItem(ByVal oListView As ListView, ByVal sFile As String, Optional ByVal oImgListSmall As Object = Nothing, Optional ByVal oImgListLarge As Object = Nothing) As ListItem

    Dim sIconKey As String, nSmallIndex As Integer, nLargeIndex As Integer
    
    If UCase(sFile) = "*INIT" Then
        'Clear imagelists?
        If TypeName(oImgListSmall) <> "Nothing" Then
            oListView.SmallIcons = Nothing
            oImgListSmall.ListImages.Clear
        End If
        If TypeName(oImgListLarge) <> "Nothing" Then
            oListView.Icons = Nothing
            oImgListLarge.ListImages.Clear
        End If
        Exit Function
    End If
    
    sIconKey = m_Parent.GetAssociatedIconKey(sFile)
   
    If TypeName(oImgListSmall) <> "Nothing" Then
        m_Parent.GetAssociatedIcon sFile, True, oListView.BackColor 'frmShared.IconSmall.BackColor
        nSmallIndex = NewImageListPicture(oImgListSmall, frmShared.IconSmall.Image, sIconKey)
        oListView.SmallIcons = oImgListSmall
    End If
    
    If TypeName(oImgListLarge) <> "Nothing" Then
        m_Parent.GetAssociatedIcon sFile, False, oListView.BackColor
        nLargeIndex = NewImageListPicture(oImgListLarge, frmShared.IconLarge.Image, sIconKey)
        oListView.Icons = oImgListLarge
    End If
    
    Set NewListViewFileItem = oListView.ListItems.Add(, , oFso.GetFilename(sFile), nLargeIndex, nSmallIndex)

End Function

Private Function ValidControlName(ByVal sName As String) As Boolean

    ValidControlName = False
    
    'The name may not be empty or start with an asterisk
    If sName = "" Or Left(sName, 1) = "*" Then Exit Function
    
    'Check if the name is already used
    If ControlIndex(sName) >= 0 Then Exit Function
    
    ValidControlName = True
    
End Function

Public Function GetOptionButton(Optional ByVal sContainer As String = "") As String
    'Return the name (tag) of the selected optionbutton in a container

    Dim X As Integer, oContainer As Object

    For X = 0 To Me.Controls.Count - 1
        If "OPTIONBUTTON" = UCase(TypeName(Me.Controls(X))) Then
            If ArrayIndex(X) > 0 Then
                Set oContainer = Me.Controls(X).Container
                If UCase(StripTag(oContainer.Tag)) = UCase(sContainer) Then
                    If Me.Controls(X).Value Then
                        GetOptionButton = StripTag(Me.Controls(X).Tag)
                        Exit For
                    End If
                End If
            End If
        End If
    Next

End Function

Private Function Container(ByVal sCtl As String) As Object
    'Return a reference to a control's container (or the form itself)
    
    Dim X As Integer
    
    X = ControlIndex(sCtl)
    
    If X >= 0 Then
        Set Container = Me.Controls(X)
    Else
        Set Container = Me
    End If

End Function

Private Function ControlIndex(ByVal sTag As String) As Integer
    'Returns the index of the specified control or -1
    'Ignores control array elements with indexes < 1
    
    Dim X As Integer

    ControlIndex = -1    'Indicates NOT found
    
    For X = 0 To Me.Controls.Count - 1
        If ArrayIndex(X) > 0 Then
            If UCase(StripTag(Me.Controls(X).Tag)) = UCase(sTag) Then
                ControlIndex = X: Exit Function
            End If
        End If
    Next

End Function

Private Function ArrayIndex(ByVal nControlIndex As Integer) As Integer
    'Returns the index of a control or -1
    
    ArrayIndex = -1     'Indicates NOT used
    
    'We need On Error because we cannot read the Index
    'property if a control isn't part of an array
    
    On Error Resume Next
        ArrayIndex = Me.Controls(nControlIndex).Index
    On Error GoTo 0

End Function

Private Function StripTag(ByVal sTag As String) As String
    'Strip additional info (after ASCIIZ) from Tag property

    Dim X As Integer
    
    StripTag = sTag
    X = InStr(sTag, Chr(0)) - 1
    If X > 0 Then StripTag = Left(sTag, X)
    
End Function

Public Sub AutoSize(Optional ByVal bWidth As Boolean = True, _
                    Optional ByVal bHeight As Boolean = True)
    
    Dim X As Integer, bInUse As Boolean, oContainer As Object
    Dim nLeft As Long, nTop As Long, nRight As Long, nBottom As Long
    Dim CRect As RECT, WRect As RECT, nNCHeight
    
    'Calculate heigth of non-client area
    GetClientRect Me.hWnd, CRect
    GetWindowRect Me.hWnd, WRect
    nNCHeight = (WRect.Bottom - CRect.Bottom) * Screen.TwipsPerPixelY
    
    nLeft = -1: nTop = -1: nRight = -1: nBottom = -1
    
    For X = 0 To Me.Controls.Count - 1
        'Can't use visible property (always False if the form isn't shown)
        bInUse = True
        'Exclude all control array elements < 1
        If ArrayIndex(X) < 1 Then bInUse = False
        'Exclude timer and imagelist controls
        Select Case UCase(TypeName(Me.Controls(X)))
        Case "TIMER", "IMAGELIST", "COMMONDIALOG"
            bInUse = False
        Case Else
        End Select
        If bInUse Then
            If Me.Controls(X).Container.Name <> Me.Name Then
                'Use the positions of the outermost container (if not the form itself)
                Set oContainer = Me.Controls(X).Container
                Do Until oContainer.Name = Me.Name
                    If nLeft = -1 Or oContainer.Left < nLeft Then nLeft = oContainer.Left
                    If nTop = -1 Or oContainer.Top < nTop Then nTop = oContainer.Top
                    If nRight = -1 Or oContainer.Left + oContainer.Width > nRight Then
                       nRight = oContainer.Left + oContainer.Width
                    End If
                    If nBottom = -1 Or oContainer.Top + oContainer.Height > nBottom Then
                       nBottom = oContainer.Top + oContainer.Height
                    End If
                    Set oContainer = oContainer.Container
                Loop
            Else
                'Use the positions of the control itself
                If nLeft = -1 Or Me.Controls(X).Left < nLeft Then nLeft = Me.Controls(X).Left
                If nTop = -1 Or Me.Controls(X).Top < nTop Then nTop = Me.Controls(X).Top
                If nRight = -1 Or Me.Controls(X).Left + Me.Controls(X).Width > nRight Then
                   nRight = Me.Controls(X).Left + Me.Controls(X).Width
                End If
                If nBottom = -1 Or Me.Controls(X).Top + Me.Controls(X).Height > nBottom Then
                   nBottom = Me.Controls(X).Top + Me.Controls(X).Height
                End If
            End If
        End If
    Next
        
    If bWidth Then
        'Use calculated width plus 90 for borders
        Me.Width = nLeft + nRight + 90
    End If
    
    If bHeight Then
        'Use calculated height plus non-client height for caption and borders
        Me.Height = nTop + nBottom + nNCHeight + 90
    End If
    
End Sub

Friend Property Get Id() As String
    'Return the name of the form
    
    Id = m_Id
  
End Property

Public Property Let CallBack(ByVal bCallback As Boolean)
    
    m_CallBack = bCallback
  
End Property

Public Property Let TaskBar(ByVal bState As Boolean)
   
' --- discussion (SteveMcMahon [at] http:vbAccelerator.com) ----------
' Set the Show In Taskbar property at run time
'
' VB provides a ShowInTaskbar property for forms which allows you to
' choose whether a form is shown in the Alt-Tab sequence and the
' shell's task bar. However there are two limitations to this:
'   - The property can't be set at run-time.
'   - it doesn 't seem to work at all for modal forms under NT4.0
'
' Often it is rather handy to put a modal form in the task bar,
' - say for example a login dialog which shows before your main form -
' otherwise the user can 'loose' this window behind other ones.
'
' The rules the taskbar uses to decide whether a button should be shown
' for a window aren't very well documented. Here is how it is done:
' When you create a window, the taskbar examines the window’s extended
' style to see if either the WS_EX_APPWINDOW (&H40000) or WS_EX_TOOLWINDOW
' (defined as &H80) style is turned on. If WS_EX_APPWINDOW is turned on,
' the taskbar shows a button for the window, and if WS_EX_ TOOLWINDOW
' is turned on, the taskbar does not show a button for the window.
' A window should never have both of these extended styles. If the
' window doesn't have either of these styles, the taskbar decides to
' create a button if the window is unowned and does not create a button
' if the window is owned.  Incidentally, VB forms seem to have neither
' of these extended styles.
'
' Here is some code which allows you to set the WS_EX_APPWINDOW style
' at run time.  You should call this code once your window has a valid
' hWnd and is visible, for example, in the Form_Activate event.
' --- end of discussion ----------------------------------

' Remark added by Peter van der Klugt :
' Leave the standard ShowInTaskbar property False or this will fail !

    Dim ls As Long
    
    m_TaskBar = bState
    
    ls = GetWindowLong(Me.hWnd, GWL_EXSTYLE)
    If (m_TaskBar) Then
        ls = ls Or WS_EX_APPWINDOW
        ls = ls And Not WS_EX_TOOLWINDOW
    Else
        ls = ls And Not WS_EX_APPWINDOW
    End If
    SetWindowLong Me.hWnd, GWL_EXSTYLE, ls
    
    'These properties are reset to the form's default by SetWindowLong
    'So we'll have to set them again
    Me.CloseBox = m_CloseBox
    Me.MinBox = m_UDMinBox
    
End Property

Public Property Let CloseBox(ByVal bState As Boolean)
    
    'You must compile with the Controlbox initially enabled,
    'or the Form_Unload event will never be called at all
    
    Dim ls As Long
    
    m_CloseBox = bState
  
    ls = GetWindowLong(Me.hWnd, GWL_STYLE)
    If (m_CloseBox) Then
        ls = ls Or GWL_CLOSEBOX
    Else
        ls = ls And Not GWL_CLOSEBOX
    End If
    SetWindowLong Me.hWnd, GWL_STYLE, ls
    
    'Make the change take effect immediately
    SetWindowPos Me.hWnd, 0, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE Or SWP_NOZORDER Or SWP_FRAMECHANGED
    
    'When CloseBox is changed, MinBox must be re-evaluated also
    Me.MinBox = m_UDMinBox
  
End Property
 
Public Property Let MinBox(ByVal bState As Boolean)
    
    Dim ls As Long
    
    m_MinBox = bState: m_UDMinBox = bState
    
    'MinBox can't exist without CloseBox and is not allowed without Taskbar
    If Not m_CloseBox Then m_MinBox = False
    If Not m_TaskBar Then m_MinBox = False
    
    ls = GetWindowLong(Me.hWnd, GWL_STYLE)
    If (m_MinBox) Then
        ls = ls Or GWL_MINBOX
    Else
        ls = ls And Not GWL_MINBOX
    End If
    SetWindowLong Me.hWnd, GWL_STYLE, ls
    
    'Make the change take effect immediately
    SetWindowPos Me.hWnd, 0, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE Or SWP_NOZORDER Or SWP_FRAMECHANGED
    
End Property

Public Property Let StayOnTop(ByVal bState As Boolean)

    If bState Then
        SetWindowPos Me.hWnd, HWND_TOPMOST, 0&, 0&, 0&, 0&, SWP_NOSIZE Or SWP_NOMOVE Or SWP_FRAMECHANGED
    Else
        SetWindowPos Me.hWnd, HWND_NOTOPMOST, 0&, 0&, 0&, 0&, SWP_NOSIZE Or SWP_NOMOVE Or SWP_FRAMECHANGED
    End If

End Property

Public Property Let CaptionEx(ByVal sCaption As String)

    'After changing the Caption property the CloseBox and MinBox
    'are returned to their original state as defined in frmDialog.frm
    'CaptionEx retains the User defined CloseBox and MinBox settings
    
    Me.Caption = sCaption
    Me.CloseBox = m_CloseBox
    Me.MinBox = m_UDMinBox

End Property

