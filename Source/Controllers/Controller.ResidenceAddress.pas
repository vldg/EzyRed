unit Controller.ResidenceAddress;

interface

uses
  Generics.Collections,
  Aurelius.Engine.ObjectManager,
  Controller.CoreObject,
  Core.ResidenceAddress;

type
  TResidenceAddressController = class(TCoreObjectController)
  private
    FResidenceAddress: TResidenceAddress;
  public
    procedure Delete(AResidenceAddress: TResidenceAddress);
    procedure Save(AResidenceAddress: TResidenceAddress);
    procedure Load(AId: Variant);

    function GetAll: TList<TResidenceAddress>;
  end;


implementation

{ TResidenceAddressController }

procedure TResidenceAddressController.Delete(AResidenceAddress: TResidenceAddress);
begin
  if not FManager.IsAttached(AResidenceAddress) then
    AResidenceAddress := FManager.Find<TResidenceAddress>(AResidenceAddress.ID);
  FManager.Remove(AResidenceAddress);
end;

function TResidenceAddressController.GetAll: TList<TResidenceAddress>;
begin
  if FOwnManager then
    FManager.Clear;
  Result := FManager.Find<TResidenceAddress>.List;

//  Result := FManager.Find<>
end;

procedure TResidenceAddressController.Load(AId: Variant);
begin
  if not FManager.IsAttached(FResidenceAddress) then
    FResidenceAddress.Free;
  FResidenceAddress := FManager.Find<TResidenceAddress>(AId);
end;

procedure TResidenceAddressController.Save(AResidenceAddress: TResidenceAddress);
begin
  if not FManager.IsAttached(AResidenceAddress) then
    FManager.SaveOrUpdate(AResidenceAddress);
end;

end.
