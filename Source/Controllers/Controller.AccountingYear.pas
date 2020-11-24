unit Controller.AccountingYear;

interface

uses
  Generics.Collections,
  Aurelius.Engine.ObjectManager,
  Controller.CoreObject,
  Core.AccountingYear;

type
  TAccountingYearController = class(TCoreObjectController)
  private
    FAccountingYear: TAccountingYear;
  public
    procedure Delete(AAccountingYear: TAccountingYear);
    procedure Save(AAccountingYear: TAccountingYear);
    procedure Load(AId: Variant);

    function GetAll: TList<TAccountingYear>;
  end;


implementation

{ TAccountingYearController }

procedure TAccountingYearController.Delete(AAccountingYear: TAccountingYear);
begin
  if not FManager.IsAttached(AAccountingYear) then
    AAccountingYear := FManager.Find<TAccountingYear>(AAccountingYear.ID);
  FManager.Remove(AAccountingYear);
end;

function TAccountingYearController.GetAll: TList<TAccountingYear>;
begin
  if FOwnManager then
    FManager.Clear;
  Result := FManager.Find<TAccountingYear>.List;
end;

procedure TAccountingYearController.Load(AId: Variant);
begin
  if not FManager.IsAttached(FAccountingYear) then
    FAccountingYear.Free;
  FAccountingYear := FManager.Find<TAccountingYear>(AId);
end;

procedure TAccountingYearController.Save(AAccountingYear: TAccountingYear);
begin
  if not FManager.IsAttached(AAccountingYear) then
    FManager.SaveOrUpdate(AAccountingYear);
end;

end.
