unit UDmServico;

interface

uses
  System.SysUtils, System.Classes, UDmServer, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDmServico = class(TDataModule)
    QryServico: TFDQuery;
    QryServicoList: TFDQuery;
    QryServicoIdServico: TFDAutoIncField;
    QryServicoDescricao: TStringField;
    QryServicoPreco: TBCDField;
    QryServicoListIdServico: TFDAutoIncField;
    QryServicoListDescricao: TStringField;
    QryServicoListPreco: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmServico: TDmServico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
