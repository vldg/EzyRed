unit Controller.Title;

interface

uses
  Generics.Collections,
  Aurelius.Engine.ObjectManager,
  Controller.CoreObject,
  Core.Title;

type
  TTitleController = class(TCoreObjectController)
  private
    FTitle: TTitle;
  public
    procedure Delete(ATitle: TTitle);
    procedure Save(ATitle: TTitle);
    procedure Load(AId: Variant);

    function GetAll: TList<TTitle>;
  end;

implementation

{ TTitleController }

procedure TTitleController.Delete(ATitle: TTitle);
begin
  if not FManager.IsAttached(ATitle) then
    ATitle := FManager.Find<TTitle>(ATitle.ID);
  FManager.Remove(ATitle);
end;

function TTitleController.GetAll: TList<TTitle>;
begin
  if FOwnManager then
    FManager.Clear;
  Result := FManager.FindAll<TTitle>;
end;

procedure TTitleController.Load(AId: Variant);
begin
  if not FManager.IsAttached(FTitle) then
    FTitle.Free;
  FTitle := FManager.Find<TTitle>(AId);
end;

procedure TTitleController.Save(ATitle: TTitle);
begin
  if not FManager.IsAttached(ATitle) then
    FManager.SaveOrUpdate(ATitle);
end;

end.
