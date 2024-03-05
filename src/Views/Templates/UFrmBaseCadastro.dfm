inherited FrmBaseCadastro: TFrmBaseCadastro
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'FrmBaseCadastro'
  ClientHeight = 287
  ClientWidth = 518
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 524
  ExplicitHeight = 316
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlGeral: TPanel
    Width = 518
    Height = 220
    ExplicitWidth = 518
    ExplicitHeight = 220
  end
  inherited PnlHeader: TPanel
    Width = 518
    ExplicitWidth = 518
    DesignSize = (
      518
      57)
    object BtnNovoSalvar: TButton
      Left = 11
      Top = -1
      Width = 46
      Height = 57
      Action = AcNovo
      Align = alCustom
      ImageAlignment = iaCenter
      Images = DmServer.ImgList32
      Style = bsCommandLink
      TabOrder = 0
    end
    object BtnEditarCancel: TButton
      Left = 63
      Top = -1
      Width = 46
      Height = 57
      Action = AcEditar
      Align = alCustom
      ImageAlignment = iaCenter
      Images = DmServer.ImgList32
      Style = bsCommandLink
      TabOrder = 1
    end
    object BtnDelete: TButton
      Left = 115
      Top = -1
      Width = 46
      Height = 57
      Action = AcExcluir
      Align = alCustom
      ImageAlignment = iaCenter
      Images = DmServer.ImgList32
      ParentShowHint = False
      ShowHint = False
      Style = bsCommandLink
      TabOrder = 2
    end
    object BtnPesquisar: TButton
      Left = 459
      Top = 0
      Width = 46
      Height = 57
      Action = AcPesquisar
      Anchors = [akTop, akRight]
      Images = DmServer.ImgList32
      Style = bsCommandLink
      TabOrder = 3
    end
  end
  inherited PnlRodape: TPanel
    Top = 277
    Width = 518
    ExplicitTop = 277
    ExplicitWidth = 518
  end
  object Actions: TActionList
    Images = DmServer.ImgList32
    Left = 312
    Top = 129
    object AcSalvar: TAction
      ImageIndex = 50
      OnExecute = AcSalvarExecute
    end
    object AcCancel: TAction
      ImageIndex = 75
      OnExecute = AcCancelExecute
    end
    object AcExcluir: TAction
      ImageIndex = 234
      OnExecute = AcExcluirExecute
    end
    object AcNovo: TAction
      ImageIndex = 86
      OnExecute = AcNovoExecute
    end
    object AcEditar: TAction
      Caption = 'AcEditar'
      ImageIndex = 77
      OnExecute = AcEditarExecute
    end
    object AcPesquisar: TAction
      Caption = 'AcPesquisar'
      ImageIndex = 243
      OnExecute = AcPesquisarExecute
    end
  end
  object Dts: TDataSource
    AutoEdit = False
    OnStateChange = DtsStateChange
    Left = 384
    Top = 129
  end
end
