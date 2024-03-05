inherited FrmPesquisaCliente: TFrmPesquisaCliente
  Caption = 'Pesquisa Cliente'
  ClientHeight = 290
  ClientWidth = 541
  ExplicitWidth = 547
  ExplicitHeight = 319
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlGeral: TPanel
    Width = 541
    Height = 223
    inherited DbGrid: TDBGrid
      Width = 541
      Height = 223
      Columns = <
        item
          Expanded = False
          FieldName = 'IdCliente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Endereco'
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Bairro'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cep'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Telefone'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Celular'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Ativo'
          Visible = True
        end>
    end
  end
  inherited PnlHeader: TPanel
    Width = 541
  end
  inherited PnlRodape: TPanel
    Top = 280
    Width = 541
  end
  inherited Dts: TDataSource
    DataSet = DmCliente.QryClienteList
  end
end
