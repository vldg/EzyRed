unit Core.ResidenceAddress;

interface

uses
  SysUtils, Generics.Collections,
  Aurelius.Mapping.Attributes,
  Aurelius.Types.Blob,
  Aurelius.Types.DynamicProperties,
  Aurelius.Types.Nullable,
  Aurelius.Types.Proxy,
  Aurelius.Criteria.Dictionary,
  Core.Title,
  Core.Residence;

type
  [Entity]
  [Table('RESIDENCE_ADDRESS')]
  [Sequence('GEN_RESIDENCE_ADDRESS_ID')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  TResidenceAddress = class
  private
    [Column('REA_ID', [TColumnProp.Required])]
    FID: integer;

    [Column('REA_ADDRESS', [TColumnProp.Required], 50)]
    FAddress: string;

    [Column('REA_ZIP_CODE', [], 10)]
    FZipCode: Nullable<string>;

    [Column('REA_CITY', [], 30)]
    FCity: Nullable<string>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('RE_ID', [TColumnProp.Required], 'RE_ID')]
    FRE_ID: Proxy<TResidence>;
    function GetRE_ID: TResidence;
    procedure SetRE_ID(const Value: TResidence);
  public
    property ID: integer read FID write FID;
    property Address: string read FAddress write FAddress;
    property ZipCode: Nullable<string> read FZipCode write FZipCode;
    property City: Nullable<string> read FCity write FCity;
    property RE_ID: TResidence read GetRE_ID write SetRE_ID;
  end;

implementation

{ TResidenceAddress}

function TResidenceAddress.GetRE_ID: TResidence;
begin
  result := FRE_ID.Value;
end;

procedure TResidenceAddress.SetRE_ID(const Value: TResidence);
begin
  FRE_ID.Value := Value;
end;


end.
