unit UFrmCadastroServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmBaseCadastro, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, UDmServico,
  Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TFrmCadastroServico = class(TFrmBaseCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormShow(Sender: TObject);
  protected
    procedure ShowSearch; override;
  end;

var
  FrmCadastroServico: TFrmCadastroServico;

implementation

uses
  UFrmPesquisaServico;

{$R *.dfm}

procedure TFrmCadastroServico.FormShow(Sender: TObject);
begin
  TFDQuery(Dts.DataSet).ParamByName('IDSERVICO').Value := 0;
  inherited;
end;

procedure TFrmCadastroServico.ShowSearch;
begin
  FrmPesquisaServico := TFrmPesquisaServico.Create(Self);
  try
    if FrmPesquisaServico.ShowModal = mrOk then
    begin
      Dts.DataSet.Close;
      TFDQuery(Dts.DataSet).ParamByName('IDSERVICO').Value := FrmPesquisaServico.Dts.DataSet.FieldByName('IDSERVICO').AsInteger;
      Dts.DataSet.Open;
      FrmPesquisaServico.Close;
      inherited;
    end;
  finally
    FreeAndNil(FrmPesquisaServico);
  end;
end;

end.
