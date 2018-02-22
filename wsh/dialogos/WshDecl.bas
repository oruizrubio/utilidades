Attribute VB_Name = "modDeclares"
Option Explicit

'FileSystemObject
Public oFso As Object

'API function declarations

Public Declare Function GetClientRect Lib "user32" (ByVal hWnd As Long, lpRect As RECT) As Long
Public Declare Function GetWindowRect Lib "user32" (ByVal hWnd As Long, lpRect As RECT) As Long
Public Declare Function GetSystemMetrics Lib "user32" (ByVal nIndex As Long) As Long

Public Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" _
    (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" _
    (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, _
     ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, _
     ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" _
    (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, _
     lParam As Any) As Long

Public Declare Function ExtractIconEx Lib "shell32.dll" Alias "ExtractIconExA" _
    (ByVal lpszExeFileName As String, ByVal nIconIndex As Long, _
     phIconLarge As Long, phIconSmall As Long, ByVal nIcons As Long) As Long
Public Declare Function ExtractIcon Lib "shell32.dll" Alias "ExtractIconA" _
    (ByVal hInst As Long, ByVal lpszExeFileName As String, _
     ByVal nIconIndex As Long) As Long
Public Declare Function ExtractAssociatedIcon Lib "shell32.dll" _
     Alias "ExtractAssociatedIconA" (ByVal hInst As Long, _
     ByVal lpIconPath As String, ByRef lpiIconIndex As Long) As Long
Public Declare Function DrawIconEx Lib "user32" _
    (ByVal hdc As Long, ByVal xLeft As Long, ByVal yTop As Long, _
     ByVal hIcon As Long, ByVal cxWidth As Long, ByVal cyWidth As Long, _
     ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As Long, _
     ByVal diFlags As Long) As Boolean
Public Declare Function DestroyIcon Lib "user32" (ByVal hIcon As Long) As Long

Public Declare Function SHGetFileInfo Lib "Shell32" Alias "SHGetFileInfoA" _
    (ByVal pszPath As Any, ByVal dwFileAttributes As Long, _
     psfi As SHFILEINFO, ByVal cbFileInfo As Long, _
     ByVal uFlags As Long) As Long
     
Declare Function FindExecutable Lib "shell32.dll" Alias "FindExecutableA" _
     (ByVal lpFile As String, ByVal lpDirectory As String, _
      ByVal lpResult As String) As Long

'Constants for API functions

Public Const GWL_STYLE = (-16)
Public Const GWL_MINBOX = &H20000
Public Const GWL_CLOSEBOX = &H80000
Public Const GWL_HWNDPARENT = (-8)
Public Const GWL_EXSTYLE = (-20)

Public Const HWND_TOPMOST = -1&
Public Const HWND_NOTOPMOST = -2&

Public Const SWP_NOSIZE = &H1
Public Const SWP_NOMOVE = &H2
Public Const SWP_NOZORDER = &H4
Public Const SWP_FRAMECHANGED = &H20

Public Const WS_EX_APPWINDOW = &H40000
Public Const WS_EX_TOOLWINDOW = &H80&

'GetSystemMetrics flags
Public Const SM_CXICON = 11
Public Const SM_CYICON = 12
Public Const SM_CXSMICON = 49
Public Const SM_CYSMICON = 50

'DrawIconEx() diFlags
Public Const DI_MASK = &H1
Public Const DI_IMAGE = &H2
Public Const DI_NORMAL = &H3
Public Const DI_COMPAT = &H4
Public Const DI_DEFAULTSIZE = &H8

Public Type RECT
   Left As Long
   Top As Long
   Right As Long
   Bottom As Long
End Type

'SHGetFileInfo type and uflags
Public Type SHFILEINFO
    hIcon As Long
    iIcon As Long
    dwAttributes As Long
    szDisplayName As String * 260
    szTypeName As String * 80
End Type

Public Const SHGFI_LARGEICON = &H0
Public Const SHGFI_SMALLICON = &H1
Public Const SHGFI_ICON = &H100
Public Const SHGFI_DISPLAYNAME = &H200
Public Const SHGFI_TYPENAME = &H400
Public Const SHGFI_SYSICONINDEX = &H4000
Public Const SHGFI_SELECTED = &H10000

Sub Main()

    'Initialize FileSystemObject
    If TypeName(oFso) = "Nothing" Then
        Set oFso = CreateObject("Scripting.FileSystemObject")
    End If

End Sub

