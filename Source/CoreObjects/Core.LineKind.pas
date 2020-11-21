unit Core.LineKind;

interface

uses
  SysUtils, Generics.Collections,
  Aurelius.Mapping.Attributes,
  Aurelius.Types.Blob,
  Aurelius.Types.DynamicProperties,
  Aurelius.Types.Nullable,
  Aurelius.Types.Proxy,
  Aurelius.Criteria.Dictionary,
  Core.Residence,
  Core.ResidenceAddress;

type
  [Entity]
  [Description('Type de Ligne')]
  [Table('LINE_KIND')]
  [Sequence('GEN_LINE_KIND_ID')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  TLineKind = class
  private
    [Column('LK_ID', [TColumnProp.Required])]
    FID: integer;

    [Column('LK_NAME', [], 30)]
    FName: Nullable<string>;

    [Column('LK_CODE', [], 5)]
    FCode: Nullable<string>;

    [Column('LK_TYPE', [TColumnProp.Required])]
    FType: Integer;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('RE_ID', [TColumnProp.Required], 'RE_ID')]
    FRE_ID: Proxy<TResidence>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAllButRemove)]
    [JoinColumn('REA_ID', [TColumnProp.Required], 'REA_ID')]
    FREA_ID: Proxy<TResidenceAddress>;

    function GetRE_ID: TResidence;
    procedure SetRE_ID(const Value: TResidence);
    function GetREA_ID: TResidenceAddress;
    procedure SetREA_ID(const Value: TResidenceAddress);
  public
    property ID: integer read FID write FID;
    property Name: Nullable<string> read FName write FName;
    property Code: Nullable<string> read FCode write FCode;
    property Type_: Integer read FType write FType;
    property RE_ID: TResidence read GetRE_ID write SetRE_ID;
    property REA_ID: TResidenceAddress read GetREA_ID write SetREA_ID;
  end;

implementation

{ TLineKind }

function TLineKind.GetREA_ID: TResidenceAddress;
begin
  Result := FREA_ID.Value;
end;

function TLineKind.GetRE_ID: TResidence;
begin
  Result := FRE_ID.Value;
end;

procedure TLineKind.SetREA_ID(const Value: TResidenceAddress);
begin
  FREA_ID.Value := Value;
end;

procedure TLineKind.SetRE_ID(const Value: TResidence);
begin
  FRE_ID.Value := Value;
end;

end.
