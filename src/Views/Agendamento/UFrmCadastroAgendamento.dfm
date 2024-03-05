inherited FrmCadastroAgendamento: TFrmCadastroAgendamento
  Caption = 'Cadastro de Agendamento'
  ClientHeight = 432
  ClientWidth = 659
  ExplicitWidth = 665
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlGeral: TPanel
    Width = 659
    Height = 365
    ExplicitWidth = 659
    ExplicitHeight = 365
    object Label1: TLabel
      Left = 40
      Top = 21
      Width = 93
      Height = 13
      Caption = 'Data Agendamento'
    end
    object Label2: TLabel
      Left = 228
      Top = 21
      Width = 33
      Height = 13
      Caption = 'Cliente'
      FocusControl = DBEdit1
    end
    object BtnClientePesquisar: TSpeedButton
      Left = 582
      Top = 39
      Width = 42
      Height = 22
      OnClick = BtnClientePesquisarClick
    end
    object DbValorTotal: TDBText
      Left = 512
      Top = 74
      Width = 112
      Height = 26
      DataField = 'ValorTotal'
      DataSource = Dts
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DateAgendamento: TDateTimePicker
      Left = 40
      Top = 40
      Width = 105
      Height = 21
      Date = 45349.639025439810000000
      Time = 45349.639025439810000000
      Color = cl3DLight
      Enabled = False
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 228
      Top = 40
      Width = 348
      Height = 21
      DataField = 'NomeCliente'
      DataSource = Dts
      ReadOnly = True
      TabOrder = 1
    end
    object PageControlServicos: TPageControl
      Left = 0
      Top = 99
      Width = 659
      Height = 266
      ActivePage = PgServicos
      Align = alBottom
      TabOrder = 2
      object PgServicos: TTabSheet
        Caption = 'Servi'#231'os'
        object Label3: TLabel
          Left = 32
          Top = 0
          Width = 35
          Height = 13
          Caption = 'Servi'#231'o'
          FocusControl = DBEdit2
        end
        object Label4: TLabel
          Left = 32
          Top = 48
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          FocusControl = DBEdit3
        end
        object Label5: TLabel
          Left = 184
          Top = 48
          Width = 27
          Height = 13
          Caption = 'Pre'#231'o'
          FocusControl = DBEdit4
        end
        object Label6: TLabel
          Left = 32
          Top = 97
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
        end
        object Label7: TLabel
          Left = 347
          Top = 48
          Width = 51
          Height = 13
          Caption = 'Valor Total'
          FocusControl = DBEdit5
        end
        object BtnServicoPesquisa: TSpeedButton
          Left = 578
          Top = 16
          Width = 42
          Height = 21
          OnClick = BtnServicoPesquisaClick
        end
        object PnlActionsServicos: TPanel
          Left = 0
          Top = 181
          Width = 651
          Height = 57
          Align = alBottom
          BevelOuter = bvNone
          Color = 4933959
          ParentBackground = False
          TabOrder = 0
          object btnNovoSalvarSer: TButton
            Left = 7
            Top = 0
            Width = 46
            Height = 57
            Action = AcNovoSer
            Align = alCustom
            ImageAlignment = iaCenter
            Images = DmServer.ImgList32
            Style = bsCommandLink
            TabOrder = 0
          end
          object btnEditarCancelSer: TButton
            Left = 59
            Top = 0
            Width = 46
            Height = 57
            Action = AcEditarSer
            Align = alCustom
            ImageAlignment = iaCenter
            Images = DmServer.ImgList32
            Style = bsCommandLink
            TabOrder = 1
          end
          object btnDeletarSer: TButton
            Left = 111
            Top = 0
            Width = 46
            Height = 57
            Action = AcExcluirSer
            Align = alCustom
            ImageAlignment = iaCenter
            Images = DmServer.ImgList32
            Style = bsCommandLink
            TabOrder = 2
          end
        end
        object DBEdit2: TDBEdit
          Left = 32
          Top = 16
          Width = 540
          Height = 21
          DataField = 'Descricao'
          DataSource = DtsServico
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 32
          Top = 67
          Width = 134
          Height = 21
          DataField = 'Qtde'
          DataSource = DtsServico
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 184
          Top = 67
          Width = 147
          Height = 21
          DataField = 'Preco'
          DataSource = DtsServico
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 347
          Top = 67
          Width = 147
          Height = 21
          DataField = 'ValorTotal'
          DataSource = DtsServico
          ReadOnly = True
          TabOrder = 4
        end
        object DBMemo1: TDBMemo
          Left = 32
          Top = 116
          Width = 588
          Height = 53
          DataField = 'Observacao'
          DataSource = DtsServico
          TabOrder = 5
        end
      end
      object PgServicosList: TTabSheet
        Caption = 'Lista de Servi'#231'os'
        ImageIndex = 1
        object DBGridServicos: TDBGrid
          Left = 0
          Top = 0
          Width = 651
          Height = 238
          Align = alClient
          DataSource = DtsServicoList
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = DBGridServicosDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'IdServicoAgendamento'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'IdAgendamento'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'IdServico'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Width = 350
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Qtde'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Preco'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Observacao'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ValorTotal'
              Width = 80
              Visible = True
            end>
        end
      end
    end
    object TimeAgendamento: TDateTimePicker
      Left = 148
      Top = 40
      Width = 66
      Height = 21
      Date = 45349.641026180560000000
      Time = 45349.641026180560000000
      Color = cl3DLight
      Enabled = False
      Kind = dtkTime
      TabOrder = 3
    end
  end
  inherited PnlHeader: TPanel
    Width = 659
    ExplicitWidth = 659
    inherited BtnPesquisar: TButton
      Left = 600
      ExplicitLeft = 600
    end
  end
  inherited PnlRodape: TPanel
    Top = 422
    Width = 659
    ExplicitTop = 422
    ExplicitWidth = 659
  end
  inherited Actions: TActionList
    Left = 432
    Top = 57
    object AcNovoSer: TAction
      ImageIndex = 195
      OnExecute = AcNovoSerExecute
    end
    object AcSalvarSer: TAction
      Caption = 'AcSalvarSer'
      ImageIndex = 192
      OnExecute = AcSalvarSerExecute
    end
    object AcEditarSer: TAction
      Caption = 'AcEditarSer'
      ImageIndex = 191
      OnExecute = AcEditarSerExecute
    end
    object AcExcluirSer: TAction
      Caption = 'AcExcluirSer'
      ImageIndex = 194
      OnExecute = AcExcluirSerExecute
    end
    object AcCancelSer: TAction
      Caption = 'AcCancelSer'
      ImageIndex = 193
      OnExecute = AcCancelSerExecute
    end
  end
  inherited Dts: TDataSource
    DataSet = DmAgendamento.QryAgendamento
    Left = 488
    Top = 57
  end
  object DtsServico: TDataSource
    DataSet = DmAgendamento.QryServicoAgendamento
    Left = 520
    Top = 225
  end
  object DtsServicoList: TDataSource
    DataSet = DmAgendamento.QryServicoAgendamentoList
    Left = 592
    Top = 225
  end
end
