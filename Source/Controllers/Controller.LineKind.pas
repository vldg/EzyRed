unit Controller.LineKind;

interface

uses
  Generics.Collections,
  Aurelius.Engine.ObjectManager,
  Controller.CoreObject,
  Core.LineKind;

type
  TLineKindController = class(TCoreObjectController)
  private
    FLineKind: TLineKind;
  public
    procedure Delete(ALineKind: TLineKind);
    procedure Save(ALineKind: TLineKind);
    procedure Load(AId: Variant);

    function GetAll: TList<TLineKind>;
  end;


implementation

{ TLineKindController }

procedure TLineKindController.Delete(ALineKind: TLineKind);
begin
  if not FManager.IsAttached(ALineKind) then
    ALineKind := FManager.Find<TLineKind>(ALineKind.ID);
  FManager.Remove(ALineKind);
end;

function TLineKindController.GetAll: TList<TLineKind>;
begin
  if FOwnManager then
    FManager.Clear;
  Result := FManager.Find<TLineKind>.List;
end;

procedure TLineKindController.Load(AId: Variant);
begin
  if not FManager.IsAttached(FLineKind) then
    FLineKind.Free;
  FLineKind := FManager.Find<TLineKind>(AId);
end;

procedure TLineKindController.Save(ALineKind: TLineKind);
begin
  if not FManager.IsAttached(ALineKind) then
    FManager.SaveOrUpdate(ALineKind);
end;

end.
