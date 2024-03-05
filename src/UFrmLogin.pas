unit UFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Data.DB, FireDAC.Stan.Param, UDmServer;

type
  TFrmLogin = class(TForm)
    PnlGeral: TPanel;
    edtNome: TEdit;
    edtSenha: TEdit;
    btnEntrar: TSpeedButton;
    btnFechar: TSpeedButton;
    ImgUser: TImage;
    procedure btnFecharClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

procedure TFrmLogin.btnEntrarClick(Sender: TObject);
begin
  try
    if Trim(edtNome.Text) = '' then
    begin
      edtNome.SetFocus;
      raise Exception.Create('Informe o nome de usuário!!');
    end
    else if Trim(edtSenha.Text) = '' then
    begin
      edtSenha.SetFocus;
      raise Exception.Create('Informe a senha de usuário!!');
    end;

    if DmServer.EfetuarLogin(edtNome.Text, edtSenha.Text) then
      ModalResult := mrOk;
  except
    on E: exception do
      Application.MessageBox(PChar(E.Message), 'Falha no Login', MB_OK + MB_ICONERROR);
  end;
end;

procedure TFrmLogin.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
