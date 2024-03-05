object DmServico: TDmServico
  OldCreateOrder = False
  Height = 200
  Width = 247
  object QryServico: TFDQuery
    Connection = DmServer.Connection
    SQL.Strings = (
      'SELECT * FROM SERVICO'
      'WHERE IDSERVICO = :IDSERVICO')
    Left = 56
    Top = 72
    ParamData = <
      item
        Name = 'IDSERVICO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QryServicoIdServico: TFDAutoIncField
      DisplayLabel = 'Id'
      FieldName = 'IdServico'
      Origin = 'IdServico'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QryServicoDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Required = True
      Size = 100
    end
    object QryServicoPreco: TBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'Preco'
      Origin = 'Preco'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
  end
  object QryServicoList: TFDQuery
    Connection = DmServer.Connection
    SQL.Strings = (
      'SELECT * FROM SERVICO')
    Left = 152
    Top = 72
    object QryServicoListIdServico: TFDAutoIncField
      DisplayLabel = 'Id'
      FieldName = 'IdServico'
      Origin = 'IdServico'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QryServicoListDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Required = True
      Size = 100
    end
    object QryServicoListPreco: TBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'Preco'
      Origin = 'Preco'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
  end
end
