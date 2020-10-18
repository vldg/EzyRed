unit Controller.CoreObject;

interface

uses
  Generics.Collections,
  Aurelius.Engine.ObjectManager;

type
  TCoreObjectController = class
  protected
    FManager: TObjectManager;
    FOwnManager: Boolean;
  public
    constructor Create; overload;
    constructor Create(AManager: TObjectManager); overload;
    destructor Destroy; override;

    procedure Flush;
  end;

implementation

uses
  DBConnection;

{ TCoreObjectController }

constructor TCoreObjectController.Create;
begin
  FManager := TDBConnection.GetInstance.CreateObjectManager;
  FOwnManager := True;
end;

constructor TCoreObjectController.Create(AManager: TObjectManager);
begin
  FManager := AManager;
  FOwnManager := False;
end;

destructor TCoreObjectController.Destroy;
begin
  if FOwnManager then
    FManager.Free;
  inherited;
end;

procedure TCoreObjectController.Flush;
begin
  FManager.Flush;
end;

end.
