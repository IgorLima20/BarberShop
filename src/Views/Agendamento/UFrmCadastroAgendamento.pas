unit UFrmCadastroAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmBaseCadastro, Data.DB,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, UDmAgendamento,
  Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, FireDAC.Comp.Client,
  FireDAC.Stan.Param, UDmServer, Vcl.Grids, Vcl.DBGrids;

type
  TFrmCadastroAgendamento = class(TFrmBaseCadastro)
    Label1: TLabel;
    DateAgendamento: TDateTimePicker;
    TimeAgendamento: TDateTimePicker;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    BtnClientePesquisar: TSpeedButton;
    PageControlServicos: TPageControl;
    PgServicos: TTabSheet;
    PnlActionsServicos: TPanel;
    btnNovoSalvarSer: TButton;
    btnEditarCancelSer: TButton;
    btnDeletarSer: TButton;
    AcNovoSer: TAction;
    AcEditarSer: TAction;
    AcExcluirSer: TAction;
    AcCancelSer: TAction;
    AcSalvarSer: TAction;
    DtsServico: TDataSource;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    BtnServicoPesquisa: TSpeedButton;
    PgServicosList: TTabSheet;
    DBGridServicos: TDBGrid;
    DtsServicoList: TDataSource;
    DbValorTotal: TDBText;
    procedure BtnClientePesquisarClick(Sender: TObject);
    procedure AcSalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AcNovoSerExecute(Sender: TObject);
    procedure AcEditarSerExecute(Sender: TObject);
    procedure AcSalvarSerExecute(Sender: TObject);
    procedure AcExcluirSerExecute(Sender: TObject);
    procedure AcCancelSerExecute(Sender: TObject);
    procedure BtnServicoPesquisaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AcNovoExecute(Sender: TObject);
    procedure AcPesquisarExecute(Sender: TObject);
    procedure DBGridServicosDblClick(Sender: TObject);
    procedure AcExcluirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CarregaListServicos;
    procedure DefineDataHora;
    procedure StatusBarChangeServicos;
    procedure MonitoraServicoChange;
    procedure ShowService;
  protected
    procedure StatusBarChange; override;
    procedure StatusButtonChange(DataSource: TDataSource = nil); override;
  end;

var
  FrmCadastroAgendamento: TFrmCadastroAgendamento;

implementation

uses
  UFrmPesquisaCliente, UFrmPesquisaServico, UFrmPesquisaAgendamento, ULibForms;

{$R *.dfm}

procedure TFrmCadastroAgendamento.AcCancelSerExecute(Sender: TObject);
begin
  DtsServico.DataSet.Cancel;
  MonitoraServicoChange;
end;

procedure TFrmCadastroAgendamento.AcEditarSerExecute(Sender: TObject);
begin
  DtsServico.DataSet.Edit;
  MonitoraServicoChange;
end;

procedure TFrmCadastroAgendamento.AcExcluirExecute(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir o registro selecionado?', 'Excluir Registro!', MB_OKCANCEL + MB_ICONINFORMATION) = IDCANCEL then
    Exit;

  with DmServer do
  begin
    Connection.StartTransaction;
    try
      DtsServicoList.DataSet.First;
      while not DtsServicoList.DataSet.Eof do
        DtsServicoList.DataSet.Delete;
      inherited;
      Connection.Commit;
      ShowService;
    except
      on E: exception do
      begin

        Connection.Rollback;
        DtsServicoList.DataSet.Refresh;
        Application.MessageBox(PChar(E.Message), 'Falha no Processo', MB_OK + MB_ICONERROR);
      end;
    end;
  end;
end;

procedure TFrmCadastroAgendamento.AcExcluirSerExecute(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir o registro selecionado?', 'Excluir Registro!', MB_OKCANCEL + MB_ICONINFORMATION) = IDOK then
  begin
    DtsServico.DataSet.Delete;
    Dts.DataSet.Refresh;
    DtsServicoList.DataSet.Refresh;
    MonitoraServicoChange;
  end;
end;

procedure TFrmCadastroAgendamento.AcNovoExecute(Sender: TObject);
begin
  inherited;
  ShowService;
end;

procedure TFrmCadastroAgendamento.AcNovoSerExecute(Sender: TObject);
begin
  DtsServico.DataSet.Append;
  if Dts.DataSet.IsEmpty then
    DmAgendamento.QryServicoAgendamentoIdAgendamento.AsInteger := 0
  else
    DmAgendamento.QryServicoAgendamentoIdAgendamento.AsInteger := DmAgendamento.
      QryAgendamentoIdAgendamento.AsInteger;

  MonitoraServicoChange;
end;

procedure TFrmCadastroAgendamento.AcPesquisarExecute(Sender: TObject);
begin
  FrmPesquisaAgendamento := TFrmPesquisaAgendamento.Create(Self);
  try
    if FrmPesquisaAgendamento.ShowModal = mrOk then
    begin
      Dts.DataSet.Close;
      TFDQuery(Dts.DataSet).ParamByName('IDAGENDAMENTO').AsInteger := FrmPesquisaAgendamento.Dts.DataSet.FieldByName('IDAGENDAMENTO').AsInteger;
      Dts.DataSet.Open;
      CarregaListServicos;
      FrmPesquisaAgendamento.Close;
      MonitoraServicoChange;
      inherited;
    end;
  finally
    FreeAndNil(FrmPesquisaAgendamento);
  end;
end;

procedure TFrmCadastroAgendamento.AcSalvarExecute(Sender: TObject);
var
  Data: string;
begin
  data := DateToStr(DateAgendamento.Date) + ' ' + TimeToStr(TimeAgendamento.Time);
  DmAgendamento.QryAgendamentoDataAgendamento.AsDateTime := StrToDateTime(data);
  inherited;
end;

procedure TFrmCadastroAgendamento.AcSalvarSerExecute(Sender: TObject);
var
  I: Integer;
  Msg: string;
begin
  try
    try
      for I := 0 to DtsServico.DataSet.FieldCount - 1 do
      begin
        validInputRequired(DtsServico.DataSet.Fields[i]);
        validInputMask(DtsServico.DataSet.Fields[i]);
      end;

      if DtsServico.DataSet.State = dsInsert then
        Msg := 'Cadastro realizado com sucessso!!'
      else
        Msg := 'Alterações realizadas com sucesso!!';

      DtsServico.DataSet.Post;
      Dts.DataSet.Refresh;
      DtsServicoList.DataSet.Refresh;
      Application.MessageBox(PChar(Msg), 'Concluído', MB_OK + MB_ICONINFORMATION);
    except
      on E: exception do
        Application.MessageBox(PChar(E.Message), 'Falha no Processo', MB_OK + MB_ICONERROR);
    end;
  finally
    MonitoraServicoChange;
  end;
end;

procedure TFrmCadastroAgendamento.BtnClientePesquisarClick(Sender: TObject);
begin
  FrmPesquisaCliente := TFrmPesquisaCliente.Create(Self);
  try
    if FrmPesquisaCliente.ShowModal = mrOk then
    begin
      with FrmPesquisaCliente.Dts.DataSet do
      begin
        DmAgendamento.QryAgendamentoIdCliente.AsInteger := FieldByName('IDCLIENTE').AsInteger;
        DmAgendamento.QryAgendamentoNomeCliente.AsString := FieldByName('NOME').AsString;
      end;
    end;
  finally
    FreeAndNil(FrmPesquisaCliente);
  end;
end;

procedure TFrmCadastroAgendamento.BtnServicoPesquisaClick(Sender: TObject);
begin
  FrmPesquisaServico := TFrmPesquisaServico.Create(Self);
  try
    if FrmPesquisaServico.ShowModal = mrOk then
    begin
      with FrmPesquisaServico.Dts.DataSet do
      begin
        DmAgendamento.QryServicoAgendamentoIdServico.AsInteger := FieldByName('IDSERVICO').AsInteger;
        DmAgendamento.QryServicoAgendamentoDescricao.AsString := FieldByName('DESCRICAO').AsString;
        DmAgendamento.QryServicoAgendamentoPreco.AsCurrency := FieldByName('PRECO').AsCurrency;
      end;
    end;
  finally
    FreeAndNil(FrmPesquisaServico);
  end;

end;

procedure TFrmCadastroAgendamento.CarregaListServicos;
begin
  DtsServicoList.DataSet.Close;
  if not (Dts.DataSet.State = dsInsert) and (not Dts.DataSet.IsEmpty) then
  begin
    TFDQuery(DtsServicoList.DataSet).ParamByName('IDAGENDAMENTO').AsInteger :=
      DmAgendamento.QryAgendamentoIdAgendamento.AsInteger;
    DtsServicoList.DataSet.Open;
  end
  else
  begin
    TFDQuery(DtsServicoList.DataSet).ParamByName('IDAGENDAMENTO').AsInteger := 0;
    DtsServicoList.DataSet.Open;
  end;
end;

procedure TFrmCadastroAgendamento.DBGridServicosDblClick(Sender: TObject);
begin
  DtsServico.DataSet.Close;
  TFDQuery(DtsServico.DataSet).ParamByName('IDSERVICOAGENDAMENTO').AsInteger := DtsServicoList.DataSet.FieldByName('IDSERVICOAGENDAMENTO').AsInteger;
  DtsServico.DataSet.Open;
  Dts.DataSet.Refresh;
  PageControlServicos.ActivePage := PgServicos;
  MonitoraServicoChange;
end;

procedure TFrmCadastroAgendamento.DefineDataHora;
begin
  if not (Dts.DataSet.State = dsInsert) and (not Dts.DataSet.IsEmpty) then
  begin
    DateAgendamento.DateTime := DmAgendamento.QryAgendamentoDataAgendamento.AsDateTime;
    TimeAgendamento.DateTime := DmAgendamento.QryAgendamentoDataAgendamento.AsDateTime;
  end
  else
  begin
    DateAgendamento.DateTime := Now;
    TimeAgendamento.DateTime := Now;
  end;
end;

procedure TFrmCadastroAgendamento.FormCreate(Sender: TObject);
begin
  FMsgDeletePadrao := False;
end;

procedure TFrmCadastroAgendamento.FormDestroy(Sender: TObject);
begin
  inherited;
  DtsServico.DataSet.Close;
  DtsServicoList.DataSet.Close;
end;

procedure TFrmCadastroAgendamento.FormShow(Sender: TObject);
begin
  PageControlServicos.ActivePage := PgServicos;
  TFDQuery(Dts.DataSet).ParamByName('IDAGENDAMENTO').Value := 0;
  inherited;
  ShowService;
end;

procedure TFrmCadastroAgendamento.MonitoraServicoChange;
begin
  StatusBarChangeServicos;
  StatusButtonChange(DtsServico);
end;

procedure TFrmCadastroAgendamento.ShowService;
begin
  DtsServico.DataSet.Close;
  TFDQuery(DtsServico.DataSet).ParamByName('IDSERVICOAGENDAMENTO').Value := 0;
  DtsServico.DataSet.Open;
  MonitoraServicoChange;
end;

procedure TFrmCadastroAgendamento.StatusBarChange;
begin
  inherited;
  DefineDataHora;
  CarregaListServicos;
  StatusBarChangeServicos;
end;

procedure TFrmCadastroAgendamento.StatusBarChangeServicos;
var
  statusBar: Boolean;
  statusBarSer: Boolean;
begin
  statusBar := (not Dts.DataSet.IsEmpty) and not (Dts.DataSet.State in [dsEdit, dsInsert]);;
  statusBarSer := not (DtsServico.DataSet.State in [dsEdit, dsInsert]);
  if statusBarSer then
  begin
    btnNovoSalvarSer.Action := AcNovoSer;
    btnEditarCancelSer.Action := AcEditarSer;
  end
  else
  begin
    btnNovoSalvarSer.Action := AcSalvarSer;
    btnEditarCancelSer.Action := AcCancelSer;
  end;

  AcNovoSer.Enabled := statusBar and statusBarSer;
  AcEditarSer.Enabled := statusBar and statusBarSer and (not DtsServico.DataSet.IsEmpty);
  AcSalvarSer.Enabled := statusBar and (not statusBarSer);
  AcCancelSer.Enabled := statusBar and (not statusBarSer);
  AcExcluirSer.Enabled := statusBar and statusBarSer and (not DtsServico.DataSet.IsEmpty);
end;

procedure TFrmCadastroAgendamento.StatusButtonChange(DataSource: TDataSource);
begin
  inherited;
  if not Assigned(DataSource) then
  begin
    if Dts.DataSet.State in [dsEdit, dsInsert] then
    begin
      EnableButtonSpeedButton(BtnClientePesquisar, True);
      EnableFieldDateTimePicker(DateAgendamento, True);
      EnableFieldDateTimePicker(TimeAgendamento, True);
    end
    else
    begin
      EnableButtonSpeedButton(BtnClientePesquisar, False);
      EnableFieldDateTimePicker(DateAgendamento, False);
      EnableFieldDateTimePicker(TimeAgendamento, False);
    end;
  end;
end;

end.
