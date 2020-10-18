unit Controller.Residence;

interface

uses
  Generics.Collections,
  Aurelius.Engine.ObjectManager,
  Controller.CoreObject,
  Core.Residence;

type
  TResidenceController = class(TCoreObjectController)
  private
    FResidence: TResidence;
  public
    procedure Delete(AResidence: TResidence);
    procedure Save(AResidence: TResidence);
    procedure Load(AId: Variant);

    function GetAll: TList<TResidence>;
    function GetOne(AId: Variant): TResidence;
    class function Get(AId: Variant): TResidence;
  end;

implementation

{ TResidenceController }

procedure TResidenceController.Delete(AResidence: TResidence);
begin
  if not FManager.IsAttached(AResidence) then
    AResidence := FManager.Find<TResidence>(AResidence.ID);
  FManager.Remove(AResidence);
end;

class function TResidenceController.Get(AId: Variant): TResidence;
var
  AController: TResidenceController;
begin
  AController := TResidenceController.Create;
  try
    Result := AController.GetOne(AId);
    AController.FManager.Evict(Result);
  finally
    AController.Free
  end;
end;

function TResidenceController.GetAll: TList<TResidence>;
begin
  if FOwnManager then
    FManager.Clear;
  Result := FManager.FindAll<TResidence>;
end;

function TResidenceController.GetOne(AId: Variant): TResidence;
begin
  Result := FManager.Find<TResidence>(AId);
end;

procedure TResidenceController.Load(AId: Variant);
begin
  if not FManager.IsAttached(FResidence) then
    FResidence.Free;
  FResidence := FManager.Find<TResidence>(AId);
end;

procedure TResidenceController.Save(AResidence: TResidence);
begin
  if not FManager.IsAttached(AResidence) then
    FManager.SaveOrUpdate(AResidence);
end;

end.
