unit UFrmPesquisaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmBasePesquisa, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, UDmCliente;

type
  TFrmPesquisaCliente = class(TFrmBasePesquisa)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesquisaCliente: TFrmPesquisaCliente;

implementation

{$R *.dfm}

end.
