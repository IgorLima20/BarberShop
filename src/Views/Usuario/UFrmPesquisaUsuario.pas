unit UFrmPesquisaUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmBasePesquisa, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, UDmUsuario;

type
  TFrmPesquisaUsuario = class(TFrmBasePesquisa)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesquisaUsuario: TFrmPesquisaUsuario;

implementation

{$R *.dfm}

end.
