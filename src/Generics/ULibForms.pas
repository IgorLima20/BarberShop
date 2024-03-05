unit ULibForms;

interface

uses Vcl.DBCtrls, Vcl.Graphics, Vcl.ComCtrls, Vcl.Buttons;

  procedure EnableFieldDBEdit(Field: TDBEdit; Enable: Boolean);
  procedure EnableFieldDBMemo(Field: TDBMemo; Enable: Boolean);
  procedure EnableFieldDateTimePicker(Field: TDateTimePicker; Enable: Boolean);

  procedure EnableButtonSpeedButton(Button: TSpeedButton; Enable: Boolean);

implementation

procedure EnableFieldDBEdit(Field: TDBEdit; Enable: Boolean);
begin
  if Enable then
  begin
    if Field.ReadOnly then
    begin
      Field.ReadOnly := True;
      Field.Color := clWindow;
      Field.TabStop := False;
    end
    else
    begin
      Field.Enabled := True;
      Field.Color := clWindow;
      Field.TabStop := True;
    end;
  end
  else
  begin
     Field.Enabled := False;
     Field.Color := cl3DLight;
     Field.TabStop := False;
  end;
end;

procedure EnableFieldDBMemo(Field: TDBMemo; Enable: Boolean);
begin
  if Enable then
  begin
    if Field.ReadOnly then
    begin
      Field.ReadOnly := True;
      Field.Color := clWindow;
      Field.TabStop := False;
    end
    else
    begin
      Field.Enabled := True;
      Field.Color := clWindow;
      Field.TabStop := True;
    end;
  end
  else
  begin
     Field.Enabled := False;
     Field.Color := cl3DLight;
     Field.TabStop := False;
  end;
end;

procedure EnableFieldDateTimePicker(Field: TDateTimePicker; Enable: Boolean);
begin
  if Enable then
  begin
    Field.Enabled := True;
    Field.Color := clWindow;
    Field.TabStop := True;
  end
  else
  begin
     Field.Enabled := False;
     Field.Color := cl3DLight;
     Field.TabStop := False;
  end;
end;

procedure EnableButtonSpeedButton(Button: TSpeedButton; Enable: Boolean);
begin
  if Enable then
  begin
    Button.Enabled := True
  end
  else
    Button.Enabled := False;
end;

end.
