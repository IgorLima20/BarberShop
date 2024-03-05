unit UFrmPesquisaAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmBasePesquisa, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, UDmAgendamento;

type
  TFrmPesquisaAgendamento = class(TFrmBasePesquisa)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesquisaAgendamento: TFrmPesquisaAgendamento;

implementation

{$R *.dfm}

end.
