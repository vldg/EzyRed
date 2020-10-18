unit Controller.Country;

interface

uses
  Generics.Collections,
  Aurelius.Engine.ObjectManager,
  Controller.CoreObject,
  Core.Country;

type
  TCountryController = class(TCoreObjectController)
  private
    FCountry: TCountry;
  public
    procedure Delete(ACountry: TCountry);
    procedure Save(ACountry: TCountry);
    procedure Load(AId: Variant);

    function GetAll: TList<TCountry>;
  end;

implementation

{ TCountryController }

procedure TCountryController.Delete(ACountry: TCountry);
begin
  if not FManager.IsAttached(ACountry) then
    ACountry := FManager.Find<TCountry>(ACountry.ID);
  FManager.Remove(ACountry);
end;

function TCountryController.GetAll: TList<TCountry>;
begin
  if FOwnManager then
    FManager.Clear;
  Result := FManager.FindAll<TCountry>;
end;

procedure TCountryController.Load(AId: Variant);
begin
  if not FManager.IsAttached(FCountry) then
    FCountry.Free;
  FCountry := FManager.Find<TCountry>(AId);
end;

procedure TCountryController.Save(ACountry: TCountry);
begin
  if not FManager.IsAttached(ACountry) then
    FManager.SaveOrUpdate(ACountry);
end;

end.
