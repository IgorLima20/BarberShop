inherited FrmPrincipal: TFrmPrincipal
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'BarberShop'
  ClientHeight = 311
  ClientWidth = 551
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  ExplicitWidth = 557
  ExplicitHeight = 340
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlGeral: TPanel
    Width = 551
    Height = 244
    ExplicitWidth = 551
    ExplicitHeight = 244
    object StatusBar: TStatusBar
      Left = 0
      Top = 226
      Width = 551
      Height = 18
      Panels = <
        item
          Width = 180
        end
        item
          Width = 800
        end>
    end
  end
  inherited PnlHeader: TPanel
    Width = 551
    ExplicitWidth = 551
    object BtnUsuarios: TButton
      Left = 24
      Top = -1
      Width = 46
      Height = 57
      Action = AcUsuarios
      Align = alCustom
      Images = DmServer.ImgList32
      Style = bsCommandLink
      TabOrder = 0
    end
    object BtnClientes: TButton
      Left = 155
      Top = -1
      Width = 46
      Height = 57
      Action = AcServicos
      Align = alCustom
      Images = DmServer.ImgList32
      Style = bsCommandLink
      TabOrder = 1
    end
    object BtnServicos: TButton
      Left = 91
      Top = -1
      Width = 46
      Height = 57
      Action = AcClientes
      Align = alCustom
      Images = DmServer.ImgList32
      Style = bsCommandLink
      TabOrder = 2
    end
    object BtnAgendamento: TButton
      Left = 224
      Top = -1
      Width = 46
      Height = 57
      Action = AcAgendamento
      Align = alCustom
      Images = DmServer.ImgList32
      Style = bsCommandLink
      TabOrder = 3
    end
  end
  inherited PnlRodape: TPanel
    Top = 301
    Width = 551
    ExplicitTop = 301
    ExplicitWidth = 551
  end
  object Actions: TActionList
    Images = DmServer.ImgList32
    Left = 456
    Top = 161
    object AcUsuarios: TAction
      ImageIndex = 239
      OnExecute = AcUsuariosExecute
    end
    object AcClientes: TAction
      ImageIndex = 61
      OnExecute = AcClientesExecute
    end
    object AcServicos: TAction
      ImageIndex = 53
      OnExecute = AcServicosExecute
    end
    object AcAgendamento: TAction
      ImageIndex = 144
      OnExecute = AcAgendamentoExecute
    end
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 360
    Top = 161
  end
end
