VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Kit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
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

'The name of this class will be used to form the ProgID
'<projectname>.<classname> : WshDialog.Kit

'----------------------------------------------------------------------------

Option Explicit

'System image list icon sizes
Private m_LargeIconWidth As Long
Private m_LargeIconHeight As Long
Private m_SmallIconWidth As Long
Private m_SmallIconHeight As Long

'Name of the control that was last "clicked"
Private m_Clicked As String

'Declaration of event sink
Public Event ClickHandler(ByVal sFrm As String, ByVal sCtl As String)

Public Function DLL() As Object
    
    'Expose the App object
    
    Set DLL = App
    
End Function

Public Function Frm(Optional ByVal sForm As String = "") As Object
    
    'Expose a Form object
        
    Set Frm = GetForm(sForm)
    
End Function

Public Property Get Clicked() As String

    Clicked = m_Clicked

End Property

Public Function ClearForms()
    
    'Clear all forms (apparently they cannot be removed completely)
    
    Dim pForm As Form, pDlg As frmDialog
    
    For Each pForm In Forms
        On Error Resume Next
            'Must cast to frmDialog to call Clear method
            Set pDlg = pForm
            pDlg.Clear
        On Error GoTo 0
    Next

End Function

Public Function NewForm(Optional ByVal sForm As String = "") As Object
    
    Dim pForm As frmDialog
   
    Select Case UCase(sForm)
    Case "*", "FRMDIALOG", "FRMSHARED"
        Set pForm = Nothing
    Case ""
        frmDialog.Init sForm, Me
        Set pForm = frmDialog
    Case Else
        Set pForm = GetForm(sForm)
        If TypeName(pForm) = "Nothing" Then       'Create a new Form
            Set pForm = New frmDialog
            pForm.Init sForm, Me
        End If
    End Select
    
    Set NewForm = pForm
    
End Function

Private Function GetForm(ByVal sForm As String) As frmDialog
    
    Dim sId As String, pForm As Form, pDlg As frmDialog
    
    Set GetForm = Nothing
    
    For Each pForm In Forms
        sId = ""
        On Error Resume Next
            'Must cast to frmDialog to get Id property
            Set pDlg = pForm
            sId = pDlg.Id
        On Error GoTo 0
        If UCase(sId) = UCase(sForm) Then
            Set GetForm = pForm
            Exit For
        End If
    Next
        
End Function
    
Friend Sub ClickEvent(ByVal pForm As frmDialog, ByVal sCtlName As String, ByVal bCallback As Boolean)
   
    m_Clicked = sCtlName
    
    If bCallback Then
        'CallBack (raise the main message event)
        RaiseEvent ClickHandler(pForm.Id, sCtlName)
    Else
        'Commandbutton or closebox clicked
        'No CallBack, hide form ourselves
        pForm.Hide
    End If

End Sub

Public Function LoadPic(ByVal sFile As String) As IPictureDisp

    'LoadPic is a replacement for the VBScript LoadPicture statement (WSH2 required)
    'VBScript's LoadPicture cannot load pictures from read-only files
    
    Dim nIndex As Integer
    
    nIndex = InternalImageIndex(sFile)
    
    On Error Resume Next
        If nIndex >= 0 Then
            Set LoadPic = frmShared.Controls(nIndex).Picture
        Else
            Set LoadPic = LoadPicture(sFile, vbLPLarge)
            'Set LoadPic = LoadPicture(sFile, vbLPCustom, vbLPColor, x, y)
        End If
    On Error GoTo 0
    
End Function

Private Function InternalImageIndex(ByVal sIcon As String) As Integer

    'Check for internal images on frmShared
    
    Dim X As Integer
    
    For X = frmShared.Controls.Count - 1 To 0 Step -1
        If UCase(TypeName(frmShared.Controls(X))) = "IMAGE" Then
            If UCase(frmShared.Controls(X).Name) = UCase(sIcon) Then
                InternalImageIndex = X: Exit Function
            End If
        End If
    Next

    'Not found
    InternalImageIndex = -1
    
End Function

Public Function CommonDialog() As Object
    
    'Return a reference to the Common Dialog control
        
    Set CommonDialog = frmShared.CommonDialog
    
End Function

Public Function GetAssociatedProgram(ByVal sFile As String) As String

    Dim szProgram As String * 128
    
    'Return values below 33 indicate an error
    If FindExecutable(sFile, "", szProgram) > 32 Then
        'Return string, excluding trailing ASCIIZ
        GetAssociatedProgram = Left(szProgram, InStr(szProgram, Chr(0)) - 1)
    End If
   
End Function

Public Function GetAssociatedIconKey(ByVal sFile As String) As String

    Dim oItem As Object
    
    'Determine the listimage key
    If HasIcon(sFile) Then
        'Internal icon, use filename itself as listimage key
        GetAssociatedIconKey = UCase(sFile)
    Else
        'Associated icon, use file/foldertype as listimage key
        If oFso.FileExists(sFile) Then
            Set oItem = oFso.GetFile(sFile)
            GetAssociatedIconKey = "*." & oItem.Type
        ElseIf oFso.FolderExists(sFile) Then
            Set oItem = oFso.GetFolder(sFile)
            GetAssociatedIconKey = "*." & oItem.Type
        Else
            GetAssociatedIconKey = "*." & "[Unknown]"
        End If
    End If

End Function

Public Function HasIcon(ByVal sFile As String) As Boolean

    Dim szFile As String * 255, hIcon As Long
    
    szFile = sFile
    hIcon = ExtractIcon(App.hInstance, szFile, 0&)
    
    Select Case hIcon
    Case 0, 1 'No internal icons (0) or not an executable, DLL, or icon file (1)
        HasIcon = False
    Case Else 'Handle to internal icon
        HasIcon = True
    End Select
    
    DestroyIcon hIcon
  
End Function

Public Function GetIcon(ByVal sFile As String, Optional ByVal bSmallIcon As Boolean = False, Optional ByVal nIndex As Long = 0, Optional ByVal nBackColor As Long = &H8000000F) As IPictureDisp

    Dim nIcons As Long, ahLargeIcons() As Long, ahSmallIcons() As Long
    
    'Initialize icon sizes
    If m_SmallIconWidth = 0 Then GetIconSizes
    
    'Get the total number of Icons in the file
    'nIcons = ExtractIconEx(sFile, -1, 0, 0, 0)

    'Dimension the arrays (we need only a single icon)
    ReDim ahLargeIcons(0): ReDim ahSmallIcons(0)
    
    'Get the handle of the icon indicated by nIndex
    ExtractIconEx sFile, nIndex, ahLargeIcons(0), ahSmallIcons(0), 1

    'Draw the icon to respective picturebox control and return it
    If bSmallIcon Then
        With frmShared.IconSmall
            Set .Picture = LoadPicture("")
            .BackColor = nBackColor
            .AutoRedraw = True
            DrawIconEx .hdc, 0, 0, ahSmallIcons(0), m_SmallIconWidth, m_SmallIconHeight, 0, 0, DI_NORMAL
            .Refresh
        End With
        Set GetIcon = frmShared.IconSmall.Image
    Else
        With frmShared.IconLarge
            Set .Picture = LoadPicture("")
            .BackColor = nBackColor
            .AutoRedraw = True
            DrawIconEx .hdc, 0, 0, ahLargeIcons(0), m_LargeIconWidth, m_LargeIconHeight, 0, 0, DI_NORMAL
            .Refresh
        End With
        Set GetIcon = frmShared.IconLarge.Image
    End If

    'Clean up
    DestroyIcon ahSmallIcons(0)
    DestroyIcon ahLargeIcons(0)

End Function
        
Public Function GetAssociatedIcon(ByVal sFile As String, Optional ByVal bSmallIcon As Boolean = False, Optional ByVal nBackColor As Long = &H8000000F) As IPictureDisp

    'Initialize icon sizes
    If m_SmallIconWidth = 0 Then GetIconSizes

    If bSmallIcon Then
        frmShared.IconSmall.BackColor = nBackColor
        ShowFileIcon sFile, SHGFI_SMALLICON, frmShared.IconSmall
        Set GetAssociatedIcon = frmShared.IconSmall.Image
    Else
        frmShared.IconLarge.BackColor = nBackColor
        ShowFileIcon sFile, SHGFI_LARGEICON, frmShared.IconLarge
        Set GetAssociatedIcon = frmShared.IconLarge.Image
    End If
        
End Function

Private Sub ShowFileIcon(ByVal sFile As String, ByVal nFlags As Long, ByRef oPic As PictureBox)
  
'-- This code was taken from the SHGetFileInfo demo program by Brad Martinez
'   ( btmtz@email.msn.com, http://www.mvps.org/btmtz )
  
    Dim shfi As SHFILEINFO

    'Clear previous icon
    oPic.Cls
  
    SHGetFileInfo ByVal sFile, 0&, shfi, Len(shfi), SHGFI_ICON Or nFlags
  
    'DrawIconEx() will shrink or stretch an icon per it's cxWidth & cyWidth params
    If nFlags And SHGFI_SMALLICON Then
        DrawIconEx oPic.hdc, 0, 0, shfi.hIcon, _
                   m_SmallIconWidth, m_SmallIconHeight, 0, 0, DI_NORMAL
    Else
        DrawIconEx oPic.hdc, 0, 0, shfi.hIcon, _
                   m_LargeIconWidth, m_LargeIconHeight, 0, 0, DI_NORMAL
    End If
    
    oPic.Refresh
  
    'Clean up! -16x16 icons = 380 bytes, 32x32 icons = 1184 bytes
    DestroyIcon shfi.hIcon
  
End Sub

Private Sub GetIconSizes()

    m_LargeIconWidth = GetSystemMetrics(SM_CXICON)
    m_LargeIconHeight = GetSystemMetrics(SM_CYICON)
    m_SmallIconWidth = GetSystemMetrics(SM_CXSMICON)
    m_SmallIconHeight = GetSystemMetrics(SM_CYSMICON)

End Sub

