unit UFrmBasePesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmBase, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmBasePesquisa = class(TFrmBase)
    Dts: TDataSource;
    DbGrid: TDBGrid;
    procedure DbGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

  public

  end;

var
  FrmBasePesquisa: TFrmBasePesquisa;

implementation

{$R *.dfm}

procedure TFrmBasePesquisa.DbGridDblClick(Sender: TObject);
begin
  if Dts.DataSet.IsEmpty then
    Exit;

  ModalResult := mrOk;
end;

procedure TFrmBasePesquisa.FormDestroy(Sender: TObject);
begin
  Dts.DataSet.Close;
end;

procedure TFrmBasePesquisa.FormShow(Sender: TObject);
begin
  Dts.DataSet.Open;
end;

end.
