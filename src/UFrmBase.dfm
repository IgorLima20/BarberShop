object FrmBase: TFrmBase
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FrmBase'
  ClientHeight = 243
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object PnlGeral: TPanel
    Left = 0
    Top = 57
    Width = 466
    Height = 176
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
  end
  object PnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 466
    Height = 57
    Align = alTop
    Color = 4933959
    ParentBackground = False
    TabOrder = 1
  end
  object PnlRodape: TPanel
    Left = 0
    Top = 233
    Width = 466
    Height = 10
    Align = alBottom
    BevelOuter = bvNone
    Color = 4933959
    ParentBackground = False
    TabOrder = 2
  end
end
