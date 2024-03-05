object DmCliente: TDmCliente
  OldCreateOrder = False
  Height = 180
  Width = 247
  object QryClienteList: TFDQuery
    Connection = DmServer.Connection
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    Left = 152
    Top = 64
    object QryClienteListIdCliente: TFDAutoIncField
      DisplayLabel = 'Id'
      FieldName = 'IdCliente'
      Origin = 'IdCliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryClienteListNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 60
    end
    object QryClienteListEndereco: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'Endereco'
      Origin = 'Endereco'
      Size = 60
    end
    object QryClienteListBairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 50
    end
    object QryClienteListCep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Cep'
      Origin = 'Cep'
      EditMask = '!99999-999;0;_'
      FixedChar = True
      Size = 8
    end
    object QryClienteListTelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Telefone'
      Origin = 'Telefone'
      EditMask = '!\(99\)9999-9999;0;_'
    end
    object QryClienteListCelular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Celular'
      Origin = 'Celular'
      EditMask = '!\(99\)99999-9999;0;_'
    end
    object QryClienteListAtivo: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'Ativo'
      Origin = 'Ativo'
    end
  end
  object QryCliente: TFDQuery
    Connection = DmServer.Connection
    SQL.Strings = (
      'SELECT * FROM CLIENTE'
      'WHERE IDCLIENTE = :IDCLIENTE')
    Left = 56
    Top = 64
    ParamData = <
      item
        Name = 'IDCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QryClienteIdCliente: TFDAutoIncField
      DisplayLabel = 'Id'
      FieldName = 'IdCliente'
      Origin = 'IdCliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryClienteNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 60
    end
    object QryClienteEndereco: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'Endereco'
      Origin = 'Endereco'
      Size = 60
    end
    object QryClienteBairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 50
    end
    object QryClienteCep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Cep'
      Origin = 'Cep'
      EditMask = '!99999-999;0;_'
      FixedChar = True
      Size = 8
    end
    object QryClienteTelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Telefone'
      Origin = 'Telefone'
      EditMask = '!\(99\)9999-9999;0;_'
    end
    object QryClienteCelular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Celular'
      Origin = 'Celular'
      EditMask = '!\(99\)99999-9999;0;_'
    end
    object QryClienteAtivo: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'Ativo'
      Origin = 'Ativo'
    end
  end
end
