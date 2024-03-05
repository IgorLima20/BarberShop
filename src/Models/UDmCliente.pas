unit UDmCliente;

interface

uses
  System.SysUtils, System.Classes, UDmServer, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDmCliente = class(TDataModule)
    QryClienteList: TFDQuery;
    QryCliente: TFDQuery;
    QryClienteIdCliente: TFDAutoIncField;
    QryClienteNome: TStringField;
    QryClienteEndereco: TStringField;
    QryClienteBairro: TStringField;
    QryClienteCep: TStringField;
    QryClienteTelefone: TStringField;
    QryClienteCelular: TStringField;
    QryClienteAtivo: TBooleanField;
    QryClienteListIdCliente: TFDAutoIncField;
    QryClienteListNome: TStringField;
    QryClienteListEndereco: TStringField;
    QryClienteListBairro: TStringField;
    QryClienteListCep: TStringField;
    QryClienteListTelefone: TStringField;
    QryClienteListCelular: TStringField;
    QryClienteListAtivo: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmCliente: TDmCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
