unit Controller.LineKindLot;

interface

uses
  Generics.Collections,
  Aurelius.Engine.ObjectManager,
  Aurelius.Linq,
  Controller.CoreObject,
  Core.LineKindLot;

type
  TLineKindLotController = class(TCoreObjectController)
  private
    FLineKindLot: TLineKindLot;
  public
    procedure Delete(ALineKindLot: TLineKindLot);
    procedure Save(ALineKindLot: TLineKindLot);
    procedure Load(AId: Variant);

    function GetAll(const RE_ID: Integer = -1): TList<TLineKindLot>;
  end;

implementation

{ TLineKindLotController }

procedure TLineKindLotController.Delete(ALineKindLot: TLineKindLot);
begin
  if not FManager.IsAttached(ALineKindLot) then
    ALineKindLot := FManager.Find<TLineKindLot>(ALineKindLot.ID);
  FManager.Remove(ALineKindLot);
end;

function TLineKindLotController.GetAll(
  const RE_ID: Integer): TList<TLineKindLot>;
begin
  if FOwnManager then
    FManager.Clear;
  Result := FManager.Find<TLineKindLot>.List;
end;

procedure TLineKindLotController.Load(AId: Variant);
begin
  if not FManager.IsAttached(FLineKindLot) then
    FLineKindLot.Free;
  FLineKindLot := FManager.Find<TLineKindLot>(AId);
end;

procedure TLineKindLotController.Save(ALineKindLot: TLineKindLot);
begin
  if not FManager.IsAttached(ALineKindLot) then
    FManager.SaveOrUpdate(ALineKindLot);
end;

end.
