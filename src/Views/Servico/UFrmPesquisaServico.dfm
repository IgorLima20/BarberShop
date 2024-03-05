inherited FrmPesquisaServico: TFrmPesquisaServico
  Caption = 'Pesquisa Servi'#231'o'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlGeral: TPanel
    inherited DbGrid: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'IdServico'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Preco'
          Width = 110
          Visible = True
        end>
    end
  end
  inherited Dts: TDataSource
    DataSet = DmServico.QryServicoList
  end
end
