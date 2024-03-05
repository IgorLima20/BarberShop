unit UDmServer;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, System.IniFiles, Vcl.Forms, Winapi.Windows,
  System.ImageList, Vcl.ImgList, Vcl.Controls, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, BCrypt;

type
  TDmServer = class(TDataModule)
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    DriverMySQL: TFDPhysMySQLDriverLink;
    Connection: TFDConnection;
    ImgList32: TImageList;
    QryLogin: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure ConnectionBeforeConnect(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FIdUsuário: Integer;
    FNomeUsuario: string;
  public
    function EfetuarLogin(Usuario, Senha: string): Boolean;

    property IdUsuarios: Integer read FIdUsuário write FIdUsuário;
    property NomeUsuario: string read FNomeUsuario write FNomeUsuario;
  end;

var
  DmServer: TDmServer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmServer.ConnectionBeforeConnect(Sender: TObject);
var
  Ini: TIniFile;
  FileStr: string;
begin
  FileStr := ExtractFilePath(Application.ExeName) + 'Config.ini';
  if not FileExists(FileStr) then
    raise Exception.Create('Arquivo de configuração não localizado!!');

  Ini := TIniFile.Create(FileStr);
  try
    Connection.Params.Clear;
    Connection.Params.Add('User_Name=' + Ini.ReadString('BANCO', 'USER', ''));
    Connection.Params.Add('Password='  + Ini.ReadString('BANCO', 'PASS', ''));
    Connection.Params.Add('Server='    + Ini.ReadString('BANCO', 'SERVER', ''));
    Connection.Params.Add('Database='  + Ini.ReadString('BANCO', 'DATABASE', ''));
    Connection.Params.Add('Port='      + Ini.ReadString('BANCO', 'PORT', ''));
    Connection.Params.Add('DriverID=MySQL');
    // DriverMySQL
    DriverMySQL.VendorLib := Ini.ReadString('BANCO', 'DLL', '');
  finally
    FreeAndNil(Ini);
  end;
end;

procedure TDmServer.DataModuleCreate(Sender: TObject);
begin
  try
    Connection.Connected := True;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Falha na Conexão', MB_OK + MB_ICONERROR);
      Application.Terminate;
    end;
  end;
end;

procedure TDmServer.DataModuleDestroy(Sender: TObject);
begin
  Connection.Connected := False;
end;

function TDmServer.EfetuarLogin(Usuario, Senha: string): Boolean;
begin
  try
    Result := False;
    QryLogin.ParamByName('NOMEUSUARIO').AsString := Usuario;
    QryLogin.Open;

    if QryLogin.IsEmpty then
      raise Exception.Create('Usuário informado não localizado!!');

    if not TBCrypt.CompareHash(Senha, QryLogin.FieldByName('SENHAUSUARIO').AsString) then
      raise Exception.Create('Senha informada é inválida!!')
    else
    begin
      Result := True;
      FIdUsuário := QryLogin.FieldByName('IDUSUARIO').AsInteger;
      FNomeUsuario := QryLogin.FieldByName('NOMEUSUARIO').AsString;
    end;
  finally
    QryLogin.Close;
  end;
end;

end.
