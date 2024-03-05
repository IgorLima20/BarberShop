unit UDmUsuario;

interface

uses
  System.SysUtils, System.Classes, UDmServer, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Forms,
  Winapi.Windows;

type
  TDmUsuario = class(TDataModule)
    QryUsuario: TFDQuery;
    QryUsuarioIdUsuario: TFDAutoIncField;
    QryUsuarioNomeUsuario: TStringField;
    QryUsuarioSenhaUsuario: TStringField;
    QryUsuarioList: TFDQuery;
    QryUsuarioListIdUsuario: TFDAutoIncField;
    QryUsuarioListNomeUsuario: TStringField;
    QryUsuarioSenhaGravacao: TStringField;
    QryUsuarioNomeGravacao: TStringField;
    procedure QryUsuarioAfterEdit(DataSet: TDataSet);
    procedure QryUsuarioAfterInsert(DataSet: TDataSet);
    procedure QryUsuarioAfterGetRecord(DataSet: TFDDataSet);
  private
    { Private declarations }
  public
    function validaNomeExistente(Nome: string): Boolean;
  end;

var
  DmUsuario: TDmUsuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmUsuario }

procedure TDmUsuario.QryUsuarioAfterEdit(DataSet: TDataSet);
begin
  QryUsuarioSenhaGravacao.Required := False;
end;

procedure TDmUsuario.QryUsuarioAfterGetRecord(DataSet: TFDDataSet);
begin
  if QryUsuarioNomeUsuario.AsString <> '' then
    QryUsuarioNomeGravacao.AsString := QryUsuarioNomeUsuario.AsString;
end;

procedure TDmUsuario.QryUsuarioAfterInsert(DataSet: TDataSet);
begin
  QryUsuarioSenhaGravacao.Required := True;
end;

function TDmUsuario.validaNomeExistente(Nome: string): Boolean;
var
  QryAux: TFDQuery;
begin
  Result := False;
  QryAux := TFDQuery.Create(nil);
  try
    QryAux.Connection := DmServer.Connection;
    QryAux.SQL.Clear;
    QryAux.SQL.Add('SELECT * FROM USUARIO WHERE NOMEUSUARIO = :NOMEUSUARIO');
    QryAux.ParamByName('NOMEUSUARIO').AsString := Nome;
    QryAux.Open;

    if not QryAux.IsEmpty then
      Result := True;
  finally
    QryAux.Close;
    FreeAndNil(QryAux);
  end;
end;

end.
