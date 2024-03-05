unit UFrmBaseCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmBase, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, UDmServer, Data.DB, Vcl.DBCtrls, System.Masks;

type
  TFrmBaseCadastro = class(TFrmBase)
    Actions: TActionList;
    AcSalvar: TAction;
    AcCancel: TAction;
    AcExcluir: TAction;
    BtnNovoSalvar: TButton;
    BtnEditarCancel: TButton;
    BtnDelete: TButton;
    Dts: TDataSource;
    AcNovo: TAction;
    AcEditar: TAction;
    BtnPesquisar: TButton;
    AcPesquisar: TAction;
    procedure AcSalvarExecute(Sender: TObject);
    procedure AcNovoExecute(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure AcCancelExecute(Sender: TObject);
    procedure AcExcluirExecute(Sender: TObject);
    procedure DtsStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AcPesquisarExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  protected
    FMsgDeletePadrao: Boolean;
    procedure ShowSearch; virtual;
    procedure StatusBarChange; virtual;
    procedure StatusButtonChange(DataSource: TDataSource = nil); virtual;
    procedure validInputRequired(Field: TField); virtual;
    procedure validInputMask(Field: TField); virtual;
  end;

var
  FrmBaseCadastro: TFrmBaseCadastro;

implementation

uses
  ULibForms, UConstantes;

{$R *.dfm}

procedure TFrmBaseCadastro.AcCancelExecute(Sender: TObject);
begin
  Dts.DataSet.Cancel;
  StatusBarChange;
  StatusButtonChange;
end;

procedure TFrmBaseCadastro.AcEditarExecute(Sender: TObject);
begin
  Dts.DataSet.Edit;
  StatusBarChange;
  StatusButtonChange;
end;

procedure TFrmBaseCadastro.AcExcluirExecute(Sender: TObject);
begin
  if FMsgDeletePadrao then
    if Application.MessageBox('Deseja realmente excluir o registro selecionado?', 'Excluir Registro!', MB_OKCANCEL + MB_ICONINFORMATION) = IDCANCEL then
      Exit;
  Dts.DataSet.Delete;
  StatusBarChange;
  StatusButtonChange;
end;

procedure TFrmBaseCadastro.AcNovoExecute(Sender: TObject);
begin
  Dts.DataSet.Append;
  StatusBarChange;
  StatusButtonChange;
end;

procedure TFrmBaseCadastro.AcPesquisarExecute(Sender: TObject);
begin
  ShowSearch;
end;

procedure TFrmBaseCadastro.AcSalvarExecute(Sender: TObject);
var
  I: Integer;
  Msg: string;
begin
  try
    try
      for I := 0 to Dts.DataSet.FieldCount - 1 do
      begin
        validInputRequired(Dts.DataSet.Fields[i]);
        validInputMask(Dts.DataSet.Fields[i]);
      end;
        
      if Dts.DataSet.State = dsInsert then
        Msg := 'Cadastro realizado com sucessso!!'
      else
        Msg := 'Alterações realizadas com sucesso!!';

      Dts.DataSet.Post;
      Application.MessageBox(PChar(Msg), 'Concluído', MB_OK + MB_ICONINFORMATION);
    except
      on E: exception do
        Application.MessageBox(PChar(E.Message), 'Falha no Processo', MB_OK + MB_ICONERROR);
    end;
  finally
    StatusBarChange;
    StatusButtonChange;
  end;
end;

procedure TFrmBaseCadastro.DtsStateChange(Sender: TObject);
begin
  inherited;
  if Dts.DataSet.State in [dsInsert, dsEdit] then
    Self.SelectFirst;
end;

procedure TFrmBaseCadastro.FormCreate(Sender: TObject);
begin
  FMsgDeletePadrao := True;
end;

procedure TFrmBaseCadastro.FormDestroy(Sender: TObject);
begin
  Dts.DataSet.Close;
end;

procedure TFrmBaseCadastro.FormShow(Sender: TObject);
begin
  Dts.DataSet.Open;
  StatusBarChange;
  StatusButtonChange;
end;

procedure TFrmBaseCadastro.ShowSearch;
begin
  StatusBarChange;
  StatusButtonChange;
end;

procedure TFrmBaseCadastro.StatusBarChange;
var
  statusBar: Boolean;
begin
  statusBar := not (Dts.DataSet.State in [dsEdit, dsInsert]);
  if statusBar then
  begin
    BtnNovoSalvar.Action := AcNovo;
    BtnEditarCancel.Action := AcEditar;
  end
  else
  begin
    BtnNovoSalvar.Action := AcSalvar;
    BtnEditarCancel.Action := AcCancel;
  end;

  AcNovo.Enabled := statusBar;
  AcEditar.Enabled := statusBar and (not Dts.DataSet.IsEmpty);
  AcSalvar.Enabled := not statusBar;
  AcCancel.Enabled := not statusBar;
  AcExcluir.Enabled := statusBar and (not Dts.DataSet.IsEmpty);
end;

procedure TFrmBaseCadastro.StatusButtonChange(DataSource: TDataSource = nil);
var
  I: Integer;
begin
  if DataSource = nil then
    DataSource := Dts;

  for I := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
    begin
      if TDBEdit(Components[i]).DataSource = DataSource then
      begin
        if DataSource.DataSet.State in [dsEdit, dsInsert] then
          EnableFieldDBEdit(TDBEdit(Components[i]), True)
        else
          EnableFieldDBEdit(TDBEdit(Components[i]), False);
      end;
    end
    else if Components[i] is TDBMemo then
    begin
      if TDBMemo(Components[i]).DataSource = DataSource then
      begin
        if DataSource.DataSet.State in [dsEdit, dsInsert] then
          EnableFieldDBMemo(TDBMemo(Components[i]), True)
        else
          EnableFieldDBMemo(TDBMemo(Components[i]), False);
      end;
    end;
  end;
end;

procedure TFrmBaseCadastro.validInputMask(Field: TField);
var
  Valid: Boolean;
begin
  if not (Field.IsNull) or (trim(Field.AsString) <> '') then
  begin
    Valid := True;
    if Field.EditMask <> '' then
    begin
      if Field.EditMask = maskCep then
        Valid :=  (Length(StringReplace(Field.AsString, ' ', '', [rfReplaceAll])) = carcCep)
      else if Field.EditMask = maskTel then
        Valid := (Length(StringReplace(Field.AsString, ' ', '', [rfReplaceAll])) = carcTel)
      else if Field.EditMask = maskCel then
        Valid := (Length(StringReplace(Field.AsString, ' ', '', [rfReplaceAll])) = carcCel);
    end;

    if Valid then
      Exit;

    Field.FocusControl;
    raise Exception.CreateFmt('Campo "%s" não atende ao formato solicitado!!', [Field.DisplayLabel]);
  end;
end;

procedure TFrmBaseCadastro.validInputRequired(Field: TField);
begin
  if Field.Required then
  begin
    if (Field.IsNull) or (trim(Field.AsString) = '') then
    begin
      Field.FocusControl;
      raise Exception.CreateFmt('Campo Obrigatório, informe o valor do(a): %s', [Field.DisplayLabel]);
    end;
  end;
end;

end.
