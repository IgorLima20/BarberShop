object DmUsuario: TDmUsuario
  OldCreateOrder = False
  Height = 196
  Width = 235
  object QryUsuario: TFDQuery
    AfterInsert = QryUsuarioAfterInsert
    AfterEdit = QryUsuarioAfterEdit
    AfterGetRecord = QryUsuarioAfterGetRecord
    Connection = DmServer.Connection
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint]
    UpdateOptions.FetchGeneratorsPoint = gpNone
    SQL.Strings = (
      'SELECT * FROM USUARIO'
      'WHERE IDUSUARIO = :IDUSUARIO')
    Left = 48
    Top = 80
    ParamData = <
      item
        Name = 'IDUSUARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QryUsuarioIdUsuario: TFDAutoIncField
      DisplayLabel = 'Id'
      FieldName = 'IdUsuario'
      Origin = 'IdUsuario'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryUsuarioNomeUsuario: TStringField
      DisplayLabel = 'Nome de Usu'#225'rio'
      FieldName = 'NomeUsuario'
      Origin = 'NomeUsuario'
      Required = True
      Size = 50
    end
    object QryUsuarioSenhaUsuario: TStringField
      FieldName = 'SenhaUsuario'
      Origin = 'SenhaUsuario'
      Required = True
      Size = 100
    end
    object QryUsuarioNomeGravacao: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NomeGravacao'
      ProviderFlags = []
      Required = True
      Size = 50
    end
    object QryUsuarioSenhaGravacao: TStringField
      DisplayLabel = 'Senha'
      FieldKind = fkInternalCalc
      FieldName = 'SenhaGravacao'
      ProviderFlags = []
      Size = 100
    end
  end
  object QryUsuarioList: TFDQuery
    Connection = DmServer.Connection
    SQL.Strings = (
      'SELECT * FROM USUARIO')
    Left = 152
    Top = 80
    object QryUsuarioListIdUsuario: TFDAutoIncField
      DisplayLabel = 'Id'
      FieldName = 'IdUsuario'
      Origin = 'IdUsuario'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryUsuarioListNomeUsuario: TStringField
      DisplayLabel = 'Nome de Usu'#225'rio'
      FieldName = 'NomeUsuario'
      Origin = 'NomeUsuario'
      Required = True
      Size = 50
    end
  end
end
