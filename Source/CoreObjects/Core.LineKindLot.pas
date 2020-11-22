unit Core.LineKindLot;

interface

uses
  SysUtils, Generics.Collections,
  Aurelius.Mapping.Attributes,
  Aurelius.Types.Blob,
  Aurelius.Types.DynamicProperties,
  Aurelius.Types.Nullable,
  Aurelius.Types.Proxy,
  Aurelius.Criteria.Dictionary,
  Core.LineKind,
  Core.ResidenceLot;

type
  [Entity]
  [Table('LINE_KIND_LOT')]
  [Sequence('GEN_LINE_KIND_LOT_ID')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  TLineKindLot = class
  private
    [Column('LKL_ID', [TColumnProp.Required])]
    FID: integer;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('LK_ID', [TColumnProp.Required], 'LK_ID')]
    FLK_ID: Proxy<TLineKind>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('REL_ID', [TColumnProp.Required], 'REL_ID')]
    FREL_ID: Proxy<TResidenceLot>;

    function GetLK_ID: TLineKind;
    procedure SetLK_ID(const Value: TLineKind);
    function GetREL_ID: TResidenceLot;
    procedure SetREL_ID(const Value: TResidenceLot);
  public
    property ID: integer read FID write FID;
    property LK_ID: TLineKind read GetLK_ID write SetLK_ID;
    property REL_ID: TResidenceLot read GetREL_ID write SetREL_ID;
  end;

implementation

{ TTitle }

function TLineKindLot.GetLK_ID: TLineKind;
begin
  Result := FLK_ID.Value;
end;

function TLineKindLot.GetREL_ID: TResidenceLot;
begin
  Result := FREL_ID.Value;
end;

procedure TLineKindLot.SetLK_ID(const Value: TLineKind);
begin
  FLK_ID.Value := Value;
end;

procedure TLineKindLot.SetREL_ID(const Value: TResidenceLot);
begin
  FREL_ID.Value := Value;
end;

end.
