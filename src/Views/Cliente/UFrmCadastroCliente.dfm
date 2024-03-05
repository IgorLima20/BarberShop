inherited FrmCadastroCliente: TFrmCadastroCliente
  Caption = 'Cadastro de Cliente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlGeral: TPanel
    object Label1: TLabel
      Left = 20
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 20
      Top = 72
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 307
      Top = 24
      Width = 28
      Height = 13
      Caption = 'Bairro'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 383
      Top = 72
      Width = 19
      Height = 13
      Caption = 'Cep'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 20
      Top = 125
      Width = 42
      Height = 13
      Caption = 'Telefone'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 136
      Top = 125
      Width = 33
      Height = 13
      Caption = 'Celular'
      FocusControl = DBEdit6
    end
    object DBEdit1: TDBEdit
      Left = 20
      Top = 40
      Width = 265
      Height = 21
      DataField = 'Nome'
      DataSource = Dts
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 20
      Top = 91
      Width = 349
      Height = 21
      DataField = 'Endereco'
      DataSource = Dts
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 307
      Top = 40
      Width = 198
      Height = 21
      DataField = 'Bairro'
      DataSource = Dts
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 383
      Top = 91
      Width = 122
      Height = 21
      DataField = 'Cep'
      DataSource = Dts
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 20
      Top = 144
      Width = 100
      Height = 21
      DataField = 'Telefone'
      DataSource = Dts
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 136
      Top = 144
      Width = 100
      Height = 21
      DataField = 'Celular'
      DataSource = Dts
      TabOrder = 5
    end
    object DBCheckBox1: TDBCheckBox
      Left = 272
      Top = 146
      Width = 41
      Height = 17
      Caption = 'Ativo'
      DataField = 'Ativo'
      DataSource = Dts
      TabOrder = 6
    end
  end
  inherited Actions: TActionList
    Left = 328
    Top = 185
  end
  inherited Dts: TDataSource
    DataSet = DmCliente.QryCliente
    Left = 392
    Top = 185
  end
end
