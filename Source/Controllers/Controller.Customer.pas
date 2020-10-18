unit Controller.Customer;

interface

uses
  Generics.Collections,
  Aurelius.Engine.ObjectManager,
  Aurelius.Criteria.Expression,
  Controller.CoreObject,
  Core.Customer;

type
  TCustomerController = class(TCoreObjectController)
  private
    FCustomer: TCustomer;
  public
    procedure Delete(ACustomer: TCustomer);
    procedure Save(ACustomer: TCustomer);
    procedure Load(AId: Variant);

    function GetAll: TList<TCustomer>;
  end;

implementation

procedure TCustomerController.Delete(ACustomer: TCustomer);
begin
  if not FManager.IsAttached(ACustomer) then
    ACustomer := FManager.Find<TCustomer>(ACustomer.ID);
  FManager.Remove(ACustomer);
end;

function TCustomerController.GetAll: TList<TCustomer>;
begin
  if FOwnManager then
    FManager.Clear;
//  Result := FManager.FindAll<TCustomer>.;
  Result := FManager.CreateCriteria<TCustomer>
         //   .Add(TExpression.Eq('Name', 'M%'))
            .OrderBy('Name')
            .List;
end;

procedure TCustomerController.Load(AId: Variant);
begin
  if not FManager.IsAttached(FCustomer) then
    FCustomer.Free;
  FCustomer := FManager.Find<TCustomer>(AId);
end;

procedure TCustomerController.Save(ACustomer: TCustomer);
begin
  if not FManager.IsAttached(ACustomer) then
    FManager.SaveOrUpdate(ACustomer);
end;

end.
