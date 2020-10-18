
unit UI.VCL.Form;

interface

uses
  Forms, Controls, StdCtrls, Classes, Windows;

type
  TCoreForm = class (TForm)
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Loaded; override;
  end;

implementation

{ TCoreForm }

procedure TCoreForm.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if not ((ActiveControl is TComboBox) and TComboBox(ActiveControl).DroppedDown) then
    begin
      ModalResult := mrCancel;
    end;
  end;
  inherited;
end;

procedure TCoreForm.Loaded;
begin
  inherited;
  KeyPreview := True;
end;

end.
