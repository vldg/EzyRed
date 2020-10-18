unit Core.ResidenceLot;

interface

uses
  SysUtils, Generics.Collections,
  Aurelius.Mapping.Attributes,
  Aurelius.Types.Blob,
  Aurelius.Types.DynamicProperties,
  Aurelius.Types.Nullable,
  Aurelius.Types.Proxy,
  Aurelius.Criteria.Dictionary,
  Core.Customer,
  Core.ResidenceAddress;

type
  [Entity]
  [Table('RESIDENCE_LOT')]
  [Sequence('GEN_RESIDENCE_LOT_ID')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  TResidenceLot = class
  private
    [Column('REL_ID', [TColumnProp.Required])]
    FID: integer;

    [Column('REL_NUMBER', [], 12)]
    FNumber: Nullable<string>;

    [Column('REL_TYPE', [])]
    FType: Nullable<integer>;

    [Column('REL_FLOOR', [])]
    FFloor: Nullable<integer>;

    [Column('REL_WATER_METER', [TColumnProp.Required])]
    FWaterMeter: integer;
    [Column('REL_TANTIEME', [TColumnProp.Required])]
    FTantieme: Integer;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('REA_ID', [TColumnProp.Required], 'REA_ID')]
    FREA_ID: Proxy<TResidenceAddress>;
    function GetREA_ID: TResidenceAddress;
    procedure SetREA_ID(const Value: TResidenceAddress);
  public
    property ID: integer read FID write FID;
    property Number: Nullable<string> read FNumber write FNumber;
    property Type_: Nullable<integer> read FType write FType;
    property Floor: Nullable<integer> read FFloor write FFloor;
    property WaterMeter: integer read FWaterMeter write FWaterMeter;
    property Tantieme: Integer read FTantieme write FTantieme;
    property REA_ID: TResidenceAddress read GetREA_ID write SetREA_ID;
  end;

implementation

{ TResidenceLot}

function TResidenceLot.GetREA_ID: TResidenceAddress;
begin
  result := FREA_ID.Value;
end;

procedure TResidenceLot.SetREA_ID(const Value: TResidenceAddress);
begin
  FREA_ID.Value := Value;
end;


end.
