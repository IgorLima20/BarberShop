object DmAgendamento: TDmAgendamento
  OldCreateOrder = False
  Height = 218
  Width = 301
  object QryAgendamento: TFDQuery
    OnCalcFields = QryAgendamentoCalcFields
    Connection = DmServer.Connection
    SQL.Strings = (
      'SELECT A.*, C.Nome AS NomeCliente FROM AGENDAMENTO A'
      'INNER JOIN CLIENTE C ON C.IDCLIENTE = A.IDCLIENTE'
      'WHERE A.IDAGENDAMENTO = :IDAGENDAMENTO')
    Left = 56
    Top = 48
    ParamData = <
      item
        Name = 'IDAGENDAMENTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QryAgendamentoIdAgendamento: TFDAutoIncField
      FieldName = 'IdAgendamento'
      Origin = 'IdAgendamento'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryAgendamentoIdCliente: TLongWordField
      FieldName = 'IdCliente'
      Origin = 'IdCliente'
      Required = True
    end
    object QryAgendamentoDataAgendamento: TDateTimeField
      DisplayLabel = 'Data Agendamento'
      FieldName = 'DataAgendamento'
      Origin = 'DataAgendamento'
      Required = True
    end
    object QryAgendamentoNomeCliente: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      FieldName = 'NomeCliente'
      Origin = 'Nome'
      ProviderFlags = []
      Size = 60
    end
    object QryAgendamentoValorTotal: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'ValorTotal'
    end
  end
  object QryServicoAgendamento: TFDQuery
    OnCalcFields = QryServicoAgendamentoCalcFields
    Connection = DmServer.Connection
    SQL.Strings = (
      'SELECT SA.*, SE.Descricao FROM SERVICOAGENDAMENTO SA'
      'INNER JOIN SERVICO SE ON SE.IDSERVICO = SA.IDSERVICO'
      'WHERE SA.IDSERVICOAGENDAMENTO = :IDSERVICOAGENDAMENTO ')
    Left = 184
    Top = 56
    ParamData = <
      item
        Name = 'IDSERVICOAGENDAMENTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QryServicoAgendamentoIdServicoAgendamento: TFDAutoIncField
      FieldName = 'IdServicoAgendamento'
      Origin = 'IdServicoAgendamento'
      ReadOnly = True
    end
    object QryServicoAgendamentoIdAgendamento: TLongWordField
      FieldName = 'IdAgendamento'
      Origin = 'IdAgendamento'
      Required = True
    end
    object QryServicoAgendamentoIdServico: TLongWordField
      FieldName = 'IdServico'
      Origin = 'IdServico'
      Required = True
    end
    object QryServicoAgendamentoQtde: TLongWordField
      DisplayLabel = 'Quantidade'
      FieldName = 'Qtde'
      Origin = 'Qtde'
      Required = True
    end
    object QryServicoAgendamentoPreco: TBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'Preco'
      Origin = 'Preco'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object QryServicoAgendamentoObservacao: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'Observacao'
      Origin = 'Observacao'
      Size = 300
    end
    object QryServicoAgendamentoDescricao: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'Descricao'
      Origin = 'Descricao'
      ProviderFlags = []
      Size = 100
    end
    object QryServicoAgendamentoValorTotal: TCurrencyField
      DisplayLabel = 'Valor Total'
      FieldKind = fkInternalCalc
      FieldName = 'ValorTotal'
      ProviderFlags = []
    end
  end
  object QryAgendamentoList: TFDQuery
    OnCalcFields = QryAgendamentoListCalcFields
    Connection = DmServer.Connection
    SQL.Strings = (
      'SELECT A.*, C.Nome AS NomeCliente FROM AGENDAMENTO A'
      'INNER JOIN CLIENTE C ON C.IDCLIENTE = A.IDCLIENTE')
    Left = 56
    Top = 120
    object QryAgendamentoListIdAgendamento: TFDAutoIncField
      DisplayLabel = 'Id'
      FieldName = 'IdAgendamento'
      Origin = 'IdAgendamento'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryAgendamentoListIdCliente: TLongWordField
      DisplayLabel = 'Id'
      FieldName = 'IdCliente'
      Origin = 'IdCliente'
      Required = True
    end
    object QryAgendamentoListDataAgendamento: TDateTimeField
      DisplayLabel = 'Data de Agendamento'
      FieldName = 'DataAgendamento'
      Origin = 'DataAgendamento'
      Required = True
    end
    object QryAgendamentoListNomeCliente: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      FieldName = 'NomeCliente'
      Origin = 'Nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QryAgendamentoListValorTotal: TCurrencyField
      DisplayLabel = 'Valor Total'
      FieldKind = fkInternalCalc
      FieldName = 'ValorTotal'
    end
  end
  object QryServicoAgendamentoList: TFDQuery
    OnCalcFields = QryServicoAgendamentoListCalcFields
    Connection = DmServer.Connection
    SQL.Strings = (
      'SELECT SA.*, SE.Descricao FROM SERVICOAGENDAMENTO SA'
      'INNER JOIN SERVICO SE ON SE.IDSERVICO = SA.IDSERVICO'
      'WHERE SA.IDAGENDAMENTO = :IDAGENDAMENTO')
    Left = 184
    Top = 120
    ParamData = <
      item
        Name = 'IDAGENDAMENTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QryServicoAgendamentoListIdServicoAgendamento: TFDAutoIncField
      DisplayLabel = 'Id Servi'#231'o Agendamento'
      FieldName = 'IdServicoAgendamento'
      Origin = 'IdServicoAgendamento'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryServicoAgendamentoListIdAgendamento: TLongWordField
      DisplayLabel = 'Id Agendamento'
      FieldName = 'IdAgendamento'
      Origin = 'IdAgendamento'
      Required = True
    end
    object QryServicoAgendamentoListIdServico: TLongWordField
      DisplayLabel = 'Id Servi'#231'o'
      FieldName = 'IdServico'
      Origin = 'IdServico'
      Required = True
    end
    object QryServicoAgendamentoListQtde: TLongWordField
      DisplayLabel = 'Quantidade'
      FieldName = 'Qtde'
      Origin = 'Qtde'
      Required = True
    end
    object QryServicoAgendamentoListPreco: TBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'Preco'
      Origin = 'Preco'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object QryServicoAgendamentoListObservacao: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'Observacao'
      Origin = 'Observacao'
      Size = 300
    end
    object QryServicoAgendamentoListDescricao: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Origin = 'Descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QryServicoAgendamentoListValorTotal: TCurrencyField
      DisplayLabel = 'Valor Total'
      FieldKind = fkInternalCalc
      FieldName = 'ValorTotal'
      ProviderFlags = []
    end
  end
end
