unit UFrmPesquisaServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmBasePesquisa, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, UDmServico;

type
  TFrmPesquisaServico = class(TFrmBasePesquisa)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesquisaServico: TFrmPesquisaServico;

implementation

{$R *.dfm}

end.
