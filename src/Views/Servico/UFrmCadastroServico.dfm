inherited FrmCadastroServico: TFrmCadastroServico
  Caption = 'Cadastro de Servi'#231'o'
  ClientHeight = 239
  ClientWidth = 436
  ExplicitWidth = 442
  ExplicitHeight = 268
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlGeral: TPanel
    Width = 436
    Height = 172
    ExplicitTop = 59
    ExplicitWidth = 436
    ExplicitHeight = 172
    object Label1: TLabel
      Left = 40
      Top = 32
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 40
      Top = 88
      Width = 27
      Height = 13
      Caption = 'Pre'#231'o'
      FocusControl = DBEdit2
    end
    object DBEdit1: TDBEdit
      Left = 40
      Top = 48
      Width = 353
      Height = 21
      DataField = 'Descricao'
      DataSource = Dts
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 40
      Top = 104
      Width = 147
      Height = 21
      DataField = 'Preco'
      DataSource = Dts
      TabOrder = 1
    end
  end
  inherited PnlHeader: TPanel
    Width = 436
    ExplicitWidth = 436
    inherited BtnPesquisar: TButton
      Left = 377
      ExplicitLeft = 377
    end
  end
  inherited PnlRodape: TPanel
    Top = 229
    Width = 436
    ExplicitTop = 229
    ExplicitWidth = 436
  end
  inherited Dts: TDataSource
    DataSet = DmServico.QryServico
  end
end
