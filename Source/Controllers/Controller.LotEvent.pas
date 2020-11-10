unit Controller.LotEvent;

interface

uses
  Generics.Collections,
  Aurelius.Engine.ObjectManager,
  Aurelius.Linq,
  Controller.CoreObject,
  Core.LotEvent;

type
  TLotEventController = class(TCoreObjectController)
  private
    FLotEvent: TLotEvent;
  public
    procedure Delete(ALotEvent: TLotEvent);
    procedure Save(ALotEvent: TLotEvent);
    procedure Load(AId: Variant);

    function GetAll(const RE_ID: Integer = -1): TList<TLotEvent>;
    function GetAllEvent(const REL_ID: Integer): TList<TLotEvent>;
  end;


implementation

{ TLotEventController }

procedure TLotEventController.Delete(ALotEvent: TLotEvent);
begin
  if not FManager.IsAttached(ALotEvent) then
    ALotEvent := FManager.Find<TLotEvent>(ALotEvent.ID);
  FManager.Remove(ALotEvent);
end;

function TLotEventController.GetAll(const RE_ID: Integer): TList<TLotEvent>;
begin
  if FOwnManager then
    FManager.Clear;

  if (RE_ID = -1) then
  begin
    Result := FManager.CreateCriteria<TLotEvent>
            .OrderBy('Number')
            .List;
  end
  else
  begin
    Result := FManager.Find<TLotEvent>
              .SubCriteria('REL_ID')
                .SubCriteria('REA_ID')
                  .SubCriteria('RE_ID')
                    .Where(Linq['ID'] = RE_ID)
                      .List<TLotEvent>;
  end;
end;

function TLotEventController.GetAllEvent(const REL_ID: Integer): TList<TLotEvent>;
begin
  if FOwnManager then
    FManager.Clear;

  Result := FManager.Find<TLotEvent>
           .Where(Linq['REL_ID'] = REL_ID)
            .List;
end;

procedure TLotEventController.Load(AId: Variant);
begin
  if not FManager.IsAttached(FLotEvent) then
    FLotEvent.Free;
  FLotEvent := FManager.Find<TLotEvent>(AId);
end;

procedure TLotEventController.Save(ALotEvent: TLotEvent);
begin
  if not FManager.IsAttached(ALotEvent) then
    FManager.SaveOrUpdate(ALotEvent);
end;

end.
