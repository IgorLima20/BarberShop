unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmBase, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, System.Actions, Vcl.ActnList, Vcl.ToolWin, Vcl.ComCtrls,
  Vcl.Menus;

type
  TFrmPrincipal = class(TFrmBase)
    Actions: TActionList;
    AcServicos: TAction;
    AcClientes: TAction;
    AcUsuarios: TAction;
    AcAgendamento: TAction;
    BtnUsuarios: TButton;
    BtnClientes: TButton;
    BtnServicos: TButton;
    BtnAgendamento: TButton;
    StatusBar: TStatusBar;
    Timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure AcUsuariosExecute(Sender: TObject);
    procedure AcServicosExecute(Sender: TObject);
    procedure AcClientesExecute(Sender: TObject);
    procedure AcAgendamentoExecute(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  UFrmCadastroCliente, UFrmLogin, UFrmCadastroUsuario, UFrmCadastroServico, UFrmCadastroAgendamento, UDmServer;

{$R *.dfm}

procedure TFrmPrincipal.AcAgendamentoExecute(Sender: TObject);
begin
  FrmCadastroAgendamento := TFrmCadastroAgendamento.Create(Self);
  try
    FrmCadastroAgendamento.ShowModal;
  finally
    FreeAndNil(FrmCadastroAgendamento);
  end;
end;

procedure TFrmPrincipal.AcClientesExecute(Sender: TObject);
begin
  FrmCadastroCliente := TFrmCadastroCliente.Create(Self);
  try
    FrmCadastroCliente.ShowModal;
  finally
    FreeAndNil(FrmCadastroCliente);
  end;
end;

procedure TFrmPrincipal.AcServicosExecute(Sender: TObject);
begin
  FrmCadastroServico := TFrmCadastroServico.Create(Self);
  try
    FrmCadastroServico.ShowModal;
  finally
    FreeAndNil(FrmCadastroServico);
  end;
end;

procedure TFrmPrincipal.AcUsuariosExecute(Sender: TObject);
begin
  FrmCadastroUsuario := TFrmCadastroUsuario.Create(Self);
  try
    FrmCadastroUsuario.ShowModal;
  finally
    FreeAndNil(FrmCadastroUsuario);
  end;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  FrmLogin := TFrmLogin.Create(Self);
  try
    if FrmLogin.ShowModal <> mrOk then
      Application.Terminate;
  finally
    FreeAndNil(FrmLogin);
  end;
end;

procedure TFrmPrincipal.FormResize(Sender: TObject);
begin
  if not IsZoomed(FrmPrincipal.Handle) then
  begin
    FrmPrincipal.left := ( Screen.Width div 2 ) - ( FrmPrincipal.Width div 2 );
    FrmPrincipal.Top := ( Screen.Height div 2 ) - ( FrmPrincipal.height div 2 );
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  Timer.Enabled := True;
end;

procedure TFrmPrincipal.TimerTimer(Sender: TObject);
begin
  StatusBar.Panels[0].Text := 'Data Atual: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
  StatusBar.Panels[1].Text := 'Nome de Usuário: ' + DmServer.NomeUsuario;
end;

end.
