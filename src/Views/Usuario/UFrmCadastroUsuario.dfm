inherited FrmCadastroUsuario: TFrmCadastroUsuario
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 240
  ClientWidth = 415
  ExplicitWidth = 421
  ExplicitHeight = 269
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlGeral: TPanel
    Width = 415
    Height = 173
    ExplicitWidth = 415
    ExplicitHeight = 173
    object Label1: TLabel
      Left = 63
      Top = 24
      Width = 81
      Height = 13
      Caption = 'Nome de Usu'#225'rio'
      FocusControl = DBEditNomeUsuario
    end
    object Label2: TLabel
      Left = 63
      Top = 88
      Width = 30
      Height = 13
      Caption = 'Senha'
      FocusControl = DBEditSenha
    end
    object DBEditNomeUsuario: TDBEdit
      Left = 63
      Top = 40
      Width = 298
      Height = 21
      DataField = 'NomeGravacao'
      DataSource = Dts
      TabOrder = 0
    end
    object DBEditSenha: TDBEdit
      Left = 63
      Top = 104
      Width = 298
      Height = 21
      DataField = 'SenhaGravacao'
      DataSource = Dts
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  inherited PnlHeader: TPanel
    Width = 415
    ExplicitWidth = 415
    inherited BtnPesquisar: TButton
      Left = 356
      ExplicitLeft = 356
    end
  end
  inherited PnlRodape: TPanel
    Top = 230
    Width = 415
    ExplicitTop = 230
    ExplicitWidth = 415
  end
  inherited Actions: TActionList
    Left = 296
    Top = 121
  end
  inherited Dts: TDataSource
    DataSet = DmUsuario.QryUsuario
    Left = 352
    Top = 121
  end
end
