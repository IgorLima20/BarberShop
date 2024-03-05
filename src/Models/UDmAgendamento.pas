unit UDmAgendamento;

interface

uses
  System.SysUtils, System.Classes, UDmServer, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDmAgendamento = class(TDataModule)
    QryAgendamento: TFDQuery;
    QryAgendamentoIdCliente: TLongWordField;
    QryAgendamentoDataAgendamento: TDateTimeField;
    QryAgendamentoNomeCliente: TStringField;
    QryAgendamentoIdAgendamento: TFDAutoIncField;
    QryServicoAgendamento: TFDQuery;
    QryServicoAgendamentoIdServicoAgendamento: TFDAutoIncField;
    QryServicoAgendamentoIdAgendamento: TLongWordField;
    QryServicoAgendamentoIdServico: TLongWordField;
    QryServicoAgendamentoQtde: TLongWordField;
    QryServicoAgendamentoPreco: TBCDField;
    QryServicoAgendamentoObservacao: TStringField;
    QryServicoAgendamentoDescricao: TStringField;
    QryServicoAgendamentoValorTotal: TCurrencyField;
    QryAgendamentoList: TFDQuery;
    QryAgendamentoListIdAgendamento: TFDAutoIncField;
    QryAgendamentoListIdCliente: TLongWordField;
    QryAgendamentoListDataAgendamento: TDateTimeField;
    QryAgendamentoListNomeCliente: TStringField;
    QryServicoAgendamentoList: TFDQuery;
    QryServicoAgendamentoListIdServicoAgendamento: TFDAutoIncField;
    QryServicoAgendamentoListIdAgendamento: TLongWordField;
    QryServicoAgendamentoListIdServico: TLongWordField;
    QryServicoAgendamentoListQtde: TLongWordField;
    QryServicoAgendamentoListPreco: TBCDField;
    QryServicoAgendamentoListObservacao: TStringField;
    QryServicoAgendamentoListDescricao: TStringField;
    QryAgendamentoValorTotal: TCurrencyField;
    QryAgendamentoListValorTotal: TCurrencyField;
    QryServicoAgendamentoListValorTotal: TCurrencyField;
    procedure QryServicoAgendamentoCalcFields(DataSet: TDataSet);
    procedure QryAgendamentoCalcFields(DataSet: TDataSet);
    procedure QryAgendamentoListCalcFields(DataSet: TDataSet);
    procedure QryServicoAgendamentoListCalcFields(DataSet: TDataSet);
  public
    function CarregaValorTotal(IdAgendamento: Integer): Currency;
  end;

var
  DmAgendamento: TDmAgendamento;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDmAgendamento.CarregaValorTotal(IdAgendamento: Integer): Currency;
var
  QryAux: TFDQuery;
begin
  Result := 0;
  QryAux := TFDQuery.Create(nil);
  try
    if IdAgendamento > 0 then
    begin
      QryAux.Connection := DmServer.Connection;
      QryAux.SQL.Clear;
      QryAux.SQL.Add('SELECT SUM(SA.PRECO * SA.QTDE) FROM SERVICOAGENDAMENTO SA');
      QryAux.SQL.Add('WHERE SA.IDAGENDAMENTO = :IDAGENDAMENTO');
      QryAux.ParamByName('IDAGENDAMENTO').AsInteger := IdAgendamento;
      QryAux.Open;

      if not QryAux.IsEmpty then
        Result := QryAux.Fields[0].AsCurrency;
    end;
  finally
    QryAux.Close;
    FreeAndNil(QryAux);
  end;
end;

procedure TDmAgendamento.QryAgendamentoCalcFields(DataSet: TDataSet);
begin
  QryAgendamentoValorTotal.AsCurrency := CarregaValorTotal(QryAgendamentoIdAgendamento.AsInteger);
end;

procedure TDmAgendamento.QryAgendamentoListCalcFields(DataSet: TDataSet);
begin
  QryAgendamentoListValorTotal.AsCurrency := CarregaValorTotal(QryAgendamentoListIdAgendamento.AsInteger);
end;

procedure TDmAgendamento.QryServicoAgendamentoCalcFields(DataSet: TDataSet);
begin
  QryServicoAgendamentoValorTotal.AsCurrency := QryServicoAgendamentoPreco.AsCurrency
                                              * QryServicoAgendamentoQtde.AsInteger;
end;

procedure TDmAgendamento.QryServicoAgendamentoListCalcFields(DataSet: TDataSet);
begin
  QryServicoAgendamentoListValorTotal.AsCurrency := QryServicoAgendamentoListPreco.AsCurrency
                                                  * QryServicoAgendamentoListQtde.AsInteger;
end;

end.
