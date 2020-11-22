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

    function GetAll(const LK_ID: Integer = -1): TList<TLineKindLot>;
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
  const LK_ID: Integer): TList<TLineKindLot>;
begin
  if FOwnManager then
    FManager.Clear;
  if (LK_ID = -1) then
    Result := FManager.Find<TLineKindLot>.List
  else
    Result := FManager.Find<TLineKindLot>
             .Where(Linq['LK_ID'] = LK_ID)
             .List;
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
