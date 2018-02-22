VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmShared 
   Caption         =   "frmShared"
   ClientHeight    =   840
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4170
   LinkTopic       =   "Form1"
   ScaleHeight     =   840
   ScaleWidth      =   4170
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin MSComDlg.CommonDialog CommonDialog 
      Left            =   3480
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.PictureBox IconSmall 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   3000
      ScaleHeight     =   16
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   16
      TabIndex        =   1
      Top             =   120
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.PictureBox IconLarge 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   480
      Left            =   2400
      ScaleHeight     =   32
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   32
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   120
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image IconCritical 
      Height          =   480
      Left            =   120
      Picture         =   "WshShared.frx":0000
      Top             =   120
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image IconQuestion 
      Height          =   480
      Left            =   600
      Picture         =   "WshShared.frx":0442
      Top             =   120
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image IconExclamation 
      Height          =   480
      Left            =   1080
      Picture         =   "WshShared.frx":0884
      Top             =   120
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image IconInformation 
      Height          =   480
      Left            =   1560
      Picture         =   "WshShared.frx":0CC6
      Top             =   120
      Visible         =   0   'False
      Width           =   480
   End
End
Attribute VB_Name = "frmShared"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
