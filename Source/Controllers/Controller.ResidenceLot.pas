unit Controller.ResidenceLot;

interface

uses
  Generics.Collections,
  Aurelius.Engine.ObjectManager,
  Aurelius.Linq,
  Controller.CoreObject,
  Core.ResidenceLot;

type
  TResidenceLotController = class(TCoreObjectController)
  private
    FResidenceLot: TResidenceLot;
  public
    procedure Delete(AResidenceLot: TResidenceLot);
    procedure Save(AResidenceLot: TResidenceLot);
    procedure Load(AId: Variant);

    function GetAll(const RE_ID: Integer = -1): TList<TResidenceLot>;
  end;


implementation

{ TResidenceLotController }

uses SysUtils;

procedure TResidenceLotController.Delete(AResidenceLot: TResidenceLot);
begin
  if not FManager.IsAttached(AResidenceLot) then
    AResidenceLot := FManager.Find<TResidenceLot>(AResidenceLot.ID);
  FManager.Remove(AResidenceLot);
end;

function TResidenceLotController.GetAll(const RE_ID: Integer = -1): TList<TResidenceLot>;
begin
  if FOwnManager then
    FManager.Clear;

  if (RE_ID = -1) then
  begin
    Result := FManager.CreateCriteria<TResidenceLot>
            .OrderBy('Number')
            .List;
  end
  else
  begin
    Result := FManager.CreateCriteria<TResidenceLot>
            .OrderBy('Number')
            .CreateAlias('RESIDENCE_ADDRESS', 'REA')
            .Where(Linq.Sql('{REA.RE_ID} = ' + IntToStr(RE_ID)))
            .List;
  end;
end;

procedure TResidenceLotController.Load(AId: Variant);
begin
  if not FManager.IsAttached(FResidenceLot) then
    FResidenceLot.Free;
  FResidenceLot := FManager.Find<TResidenceLot>(AId);
end;

procedure TResidenceLotController.Save(AResidenceLot: TResidenceLot);
begin
  if not FManager.IsAttached(AResidenceLot) then
    FManager.SaveOrUpdate(AResidenceLot);
end;

end.
