program BarberShop;

uses
  Vcl.Forms,
  UDmServer in 'src\Models\UDmServer.pas' {DmServer: TDataModule},
  UFrmBase in 'src\UFrmBase.pas' {FrmBase},
  UFrmPrincipal in 'src\UFrmPrincipal.pas' {FrmPrincipal},
  UFrmBaseCadastro in 'src\Views\Templates\UFrmBaseCadastro.pas' {FrmBaseCadastro},
  UFrmBasePesquisa in 'src\Views\Templates\UFrmBasePesquisa.pas' {FrmBasePesquisa},
  UFrmCadastroCliente in 'src\Views\Cliente\UFrmCadastroCliente.pas' {FrmCadastroCliente},
  UDmCliente in 'src\Models\UDmCliente.pas' {DmCliente: TDataModule},
  UFrmPesquisaCliente in 'src\Views\Cliente\UFrmPesquisaCliente.pas' {FrmPesquisaCliente},
  UFrmLogin in 'src\UFrmLogin.pas' {FrmLogin},
  UFrmCadastroUsuario in 'src\Views\Usuario\UFrmCadastroUsuario.pas' {FrmCadastroUsuario},
  UDmUsuario in 'src\Models\UDmUsuario.pas' {DmUsuario: TDataModule},
  UFrmPesquisaUsuario in 'src\Views\Usuario\UFrmPesquisaUsuario.pas' {FrmPesquisaUsuario},
  UFrmCadastroAgendamento in 'src\Views\Agendamento\UFrmCadastroAgendamento.pas' {FrmCadastroAgendamento},
  UFrmCadastroServico in 'src\Views\Servico\UFrmCadastroServico.pas' {FrmCadastroServico},
  UDmServico in 'src\Models\UDmServico.pas' {DmServico: TDataModule},
  UFrmPesquisaServico in 'src\Views\Servico\UFrmPesquisaServico.pas' {FrmPesquisaServico},
  UDmAgendamento in 'src\Models\UDmAgendamento.pas' {DmAgendamento: TDataModule},
  UFrmPesquisaAgendamento in 'src\Views\Agendamento\UFrmPesquisaAgendamento.pas' {FrmPesquisaAgendamento},
  ULibForms in 'src\Generics\ULibForms.pas',
  UConstantes in 'src\Generics\UConstantes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmServer, DmServer);
  Application.CreateForm(TDmServico, DmServico);
  Application.CreateForm(TDmUsuario, DmUsuario);
  Application.CreateForm(TDmCliente, DmCliente);
  Application.CreateForm(TDmAgendamento, DmAgendamento);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
