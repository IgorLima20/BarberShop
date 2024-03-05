inherited FrmPesquisaUsuario: TFrmPesquisaUsuario
  Caption = 'Pesquisa Usu'#225'rio'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlGeral: TPanel
    inherited DbGrid: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'IdUsuario'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeUsuario'
          Width = 400
          Visible = True
        end>
    end
  end
  inherited Dts: TDataSource
    DataSet = DmUsuario.QryUsuarioList
  end
end
