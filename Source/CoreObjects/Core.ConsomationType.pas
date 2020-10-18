unit Core.ConsomationType;

interface

uses
  SysUtils, Generics.Collections,
  Aurelius.Mapping.Attributes,
  Aurelius.Types.Blob,
  Aurelius.Types.DynamicProperties,
  Aurelius.Types.Nullable,
  Aurelius.Types.Proxy,
  Aurelius.Criteria.Dictionary;

type
  [Entity]
  [Table('CONSOMATION_TYPE')]
  [Sequence('GEN_CONSOMATION_TYPE_ID')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  TConsomationType = class
  private
    [Column('COT_ID', [TColumnProp.Required])]
    FID: integer;

    [Column('COT_NAME', [], 40)]
    FName: Nullable<string>;

    [Column('COT_CODE', [], 5)]
    FCode: Nullable<string>;
  public
    constructor Create;
    destructor Destroy; override;
    property ID: integer read FID write FID;
    property Name: Nullable<string> read FName write FName;
    property Code: Nullable<string> read FCode write FCode;
  end;

implementation

{ TConsomationType}

constructor TConsomationType.Create;
begin
end;

destructor TConsomationType.Destroy;
begin
  inherited;
end;

end.
