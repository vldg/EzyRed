unit Controller.AccountingYear;

interface

uses
  Generics.Collections,
  Aurelius.Engine.ObjectManager,
  Aurelius.Linq,
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

    function GetAll(const RE_ID: Integer = -1): TList<TAccountingYear>;
  end;


implementation

{ TAccountingYearController }

procedure TAccountingYearController.Delete(AAccountingYear: TAccountingYear);
begin
  if not FManager.IsAttached(AAccountingYear) then
    AAccountingYear := FManager.Find<TAccountingYear>(AAccountingYear.ID);
  FManager.Remove(AAccountingYear);
end;

function TAccountingYearController.GetAll(const RE_ID: Integer = -1): TList<TAccountingYear>;
begin
  if FOwnManager then
    FManager.Clear;

  if (RE_ID = -1) then
  begin
    Result := FManager.Find<TAccountingYear>.List;
  end
  else
  begin
    Result := FManager.Find<TAccountingYear>
              .Where(Linq['RE_ID'] = RE_ID)
              .OrderBy('Date')
              .List;
  end;

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
