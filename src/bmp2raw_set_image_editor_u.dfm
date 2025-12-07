object frmSetImageEditor: TfrmSetImageEditor
  Left = 356
  Top = 187
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Set image editor'
  ClientHeight = 163
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lblDownloadGIMP: TLabel
    Left = 16
    Top = 136
    Width = 441
    Height = 25
    Cursor = crHandPoint
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'GIMP is recommended for editing graphics. Click here to download' +
      ' and install it.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lblDownloadGIMPClick
  end
  object panEditorName: TPanel
    Left = 32
    Top = 32
    Width = 337
    Height = 30
    BevelInner = bvSpace
    BevelOuter = bvSpace
    BorderStyle = bsSingle
    TabOrder = 0
  end
  object btnSetEditor: TButton
    Left = 384
    Top = 32
    Width = 57
    Height = 25
    Caption = '...'
    TabOrder = 1
    OnClick = btnSetEditorClick
  end
  object btnOk: TButton
    Left = 96
    Top = 88
    Width = 97
    Height = 30
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 272
    Top = 88
    Width = 97
    Height = 30
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
