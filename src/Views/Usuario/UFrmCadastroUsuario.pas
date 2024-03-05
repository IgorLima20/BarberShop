unit UFrmCadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmBaseCadastro, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, UDmUsuario,
  Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param, BCrypt,
  Vcl.AppEvnts;

type
  TFrmCadastroUsuario = class(TFrmBaseCadastro)
    Label1: TLabel;
    DBEditNomeUsuario: TDBEdit;
    Label2: TLabel;
    DBEditSenha: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure AcSalvarExecute(Sender: TObject);
  protected
    procedure ShowSearch; override;
    procedure StatusButtonChange(DataSource: TDataSource = nil); override;
  end;

var
  FrmCadastroUsuario: TFrmCadastroUsuario;

implementation

uses
  UFrmPesquisaUsuario;

{$R *.dfm}

procedure TFrmCadastroUsuario.AcSalvarExecute(Sender: TObject);
begin
  try
    with DmUsuario do
    begin
      if Dts.DataSet.State = dsEdit then
      begin
        if (QryUsuarioNomeGravacao.AsString <> QryUsuarioNomeUsuario.AsString) then
          if validaNomeExistente(QryUsuarioNomeGravacao.AsString) then
            raise Exception.Create('Nome de usuário já cadastrado!!')
          else
            QryUsuarioNomeUsuario.AsString := QryUsuarioNomeGravacao.AsString;

        if (QryUsuarioSenhaGravacao.AsString <> '') and
          not (TBCrypt.CompareHash(QryUsuarioSenhaGravacao.AsString, QryUsuarioSenhaUsuario.AsString)) then
          QryUsuarioSenhaUsuario.AsString := TBCrypt.GenerateHash(QryUsuarioSenhaGravacao.AsString);
      end
      else
      begin
        if validaNomeExistente(QryUsuarioNomeGravacao.AsString) then
            raise Exception.Create('Nome de usuário já cadastrado!!')
        else
          QryUsuarioNomeUsuario.AsString := QryUsuarioNomeGravacao.AsString;

        QryUsuarioSenhaUsuario.AsString := TBCrypt.GenerateHash(QryUsuarioSenhaGravacao.AsString);
      end;
    end;
  except
    on E: exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Falha no Processo', MB_OK + MB_ICONERROR);
      Abort;
    end;
  end;
  inherited;
end;

procedure TFrmCadastroUsuario.FormShow(Sender: TObject);
begin
  TFDQuery(Dts.DataSet).ParamByName('IDUSUARIO').Value := 0;
  inherited;
end;

procedure TFrmCadastroUsuario.ShowSearch;
begin
  FrmPesquisaUsuario := TFrmPesquisaUsuario.Create(Self);
  try
    if FrmPesquisaUsuario.ShowModal = mrOk then
    begin
      Dts.DataSet.Close;
      TFDQuery(Dts.DataSet).ParamByName('IDUSUARIO').Value := FrmPesquisaUsuario.Dts.DataSet.FieldByName('IDUSUARIO').AsInteger;
      Dts.DataSet.Open;
      FrmPesquisaUsuario.Close;
      inherited;
    end;
  finally
    FreeAndNil(FrmPesquisaUsuario);
  end;
end;

procedure TFrmCadastroUsuario.StatusButtonChange(DataSource: TDataSource);
begin
  inherited;
  if Dts.DataSet.State in [dsEdit, dsInsert] then
  begin
    DBEditSenha.Enabled := True;
    DBEditSenha.Color := clWindow;
    DBEditSenha.TabStop := True;
  end
  else
  begin
    DBEditSenha.Enabled := False;
    DBEditSenha.Color := cl3DLight;
    DBEditSenha.TabStop := False;
  end;
end;

end.
