object frmCopyOutputToWinUAE: TfrmCopyOutputToWinUAE
  Left = 244
  Top = 251
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Copy Output File to WinUAE Virtual Hard Disk'
  ClientHeight = 174
  ClientWidth = 815
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 273
    Height = 25
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Amiga-SWOS Grafs folder of WinUAE Virtual Hard Disk '
  end
  object Label2: TLabel
    Left = 288
    Top = 56
    Width = 433
    Height = 25
    AutoSize = False
    Caption = '( Example: D:\swos_tp\dev_swostp\winuae\CUSTOM\GFX_SETS\04\ )'
  end
  object edtPath: TEdit
    Left = 288
    Top = 28
    Width = 449
    Height = 21
    ImeName = 'Microsoft Office IME 2007'
    ReadOnly = True
    TabOrder = 0
  end
  object btnSelectQuakePath: TButton
    Left = 744
    Top = 29
    Width = 41
    Height = 20
    Caption = '...'
    TabOrder = 1
    OnClick = btnSelectQuakePathClick
  end
  object btnOK: TButton
    Left = 184
    Top = 120
    Width = 121
    Height = 33
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 488
    Top = 120
    Width = 121
    Height = 33
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object chkCopyToAllPitch: TCheckBox
    Left = 288
    Top = 80
    Width = 449
    Height = 17
    Caption = 'Copy SWCPICHn.MAP to SWCPICH1~5.MAP'
    TabOrder = 4
  end
end
