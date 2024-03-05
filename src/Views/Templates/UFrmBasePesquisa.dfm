inherited FrmBasePesquisa: TFrmBasePesquisa
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'FrmBasePesquisa'
  ClientHeight = 272
  ClientWidth = 514
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 520
  ExplicitHeight = 301
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlGeral: TPanel
    Width = 514
    Height = 205
    object DbGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 514
      Height = 205
      Align = alClient
      DataSource = Dts
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DbGridDblClick
    end
  end
  inherited PnlHeader: TPanel
    Width = 514
  end
  inherited PnlRodape: TPanel
    Top = 262
    Width = 514
  end
  object Dts: TDataSource
    Left = 376
    Top = 121
  end
end
