unit UFrmCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmBaseCadastro, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, UDmCliente,
  Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TFrmCadastroCliente = class(TFrmBaseCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure FormShow(Sender: TObject);
    procedure AcPesquisarExecute(Sender: TObject);
  end;

var
  FrmCadastroCliente: TFrmCadastroCliente;

implementation

uses
  UFrmPesquisaCliente;

{$R *.dfm}

procedure TFrmCadastroCliente.AcPesquisarExecute(Sender: TObject);
begin
  FrmPesquisaCliente := TFrmPesquisaCliente.Create(Self);
  try
    if FrmPesquisaCliente.ShowModal = mrOk then
    begin
      Dts.DataSet.Close;
      TFDQuery(Dts.DataSet).ParamByName('IDCLIENTE').Value := FrmPesquisaCliente.Dts.DataSet.FieldByName('IDCLIENTE').AsInteger;
      Dts.DataSet.Open;
      FrmPesquisaCliente.Close;
      inherited;
    end;
  finally
    FreeAndNil(FrmPesquisaCliente);
  end;
end;

procedure TFrmCadastroCliente.FormShow(Sender: TObject);
begin
  TFDQuery(Dts.DataSet).ParamByName('IDCLIENTE').Value := 0;
  inherited;
end;

end.
