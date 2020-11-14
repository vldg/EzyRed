unit Controller.BankAccountLine;

interface

uses
  Generics.Collections,
  Aurelius.Engine.ObjectManager,
  Aurelius.Linq,
  Controller.CoreObject,
  Core.BankAccountLine;

type
  TBankAccountLineController = class(TCoreObjectController)
  private
    FBankAccountLine: TBankAccountLine;
  public
    procedure Delete(ABankAccountLine: TBankAccountLine);
    procedure Save(ABankAccountLine: TBankAccountLine);
    procedure Load(AId: Variant);

    function GetAll(const RE_ID: Integer = -1): TList<TBankAccountLine>;
  end;

implementation

{ TLotEventController }

procedure TBankAccountLineController.Delete(ABankAccountLine: TBankAccountLine);
begin
  if not FManager.IsAttached(ABankAccountLine) then
    ABankAccountLine := FManager.Find<TBankAccountLine>(ABankAccountLine.ID);
  FManager.Remove(ABankAccountLine);
end;

function TBankAccountLineController.GetAll(
  const RE_ID: Integer): TList<TBankAccountLine>;
begin
  if FOwnManager then
    FManager.Clear;

  if (RE_ID = -1) then
  begin
    Result := FManager.CreateCriteria<TBankAccountLine>
            .OrderBy('Date')
            .List;
  end
  else
  begin
    Result := FManager.Find<TBankAccountLine>
              .Where(Linq['RE_ID'] = RE_ID)
            .OrderBy('Date')
            .List;
  end;

end;

procedure TBankAccountLineController.Load(AId: Variant);
begin
  if not FManager.IsAttached(FBankAccountLine) then
    FBankAccountLine.Free;
  FBankAccountLine := FManager.Find<TBankAccountLine>(AId);
end;

procedure TBankAccountLineController.Save(ABankAccountLine: TBankAccountLine);
begin
  if not FManager.IsAttached(ABankAccountLine) then
    FManager.SaveOrUpdate(ABankAccountLine);
end;

end.
