inherited FrmPesquisaAgendamento: TFrmPesquisaAgendamento
  Caption = 'Pesquisa de Agendamentos'
  ClientHeight = 332
  ClientWidth = 568
  ExplicitWidth = 574
  ExplicitHeight = 361
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlGeral: TPanel
    Width = 568
    Height = 265
    ExplicitWidth = 568
    ExplicitHeight = 265
    inherited DbGrid: TDBGrid
      Width = 568
      Height = 265
      Columns = <
        item
          Expanded = False
          FieldName = 'IdAgendamento'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IdCliente'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DataAgendamento'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeCliente'
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorTotal'
          Width = 100
          Visible = True
        end>
    end
  end
  inherited PnlHeader: TPanel
    Width = 568
    ExplicitWidth = 568
  end
  inherited PnlRodape: TPanel
    Top = 322
    Width = 568
    ExplicitTop = 322
    ExplicitWidth = 568
  end
  inherited Dts: TDataSource
    DataSet = DmAgendamento.QryAgendamentoList
  end
end
