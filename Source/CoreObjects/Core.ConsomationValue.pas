unit Core.ConsomationValue;

interface

uses
  SysUtils, Generics.Collections,
  Aurelius.Mapping.Attributes,
  Aurelius.Types.Blob,
  Aurelius.Types.DynamicProperties,
  Aurelius.Types.Nullable,
  Aurelius.Types.Proxy,
  Aurelius.Criteria.Dictionary,
  Core.ConsomationType,
  Core.ResidenceLot;

type
  [Entity]
  [Table('CONSOMATION_VALUE')]
  [Sequence('GEN_CONSOMATION_VALUE_ID')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  TConsomationValue = class
  private
    [Column('COV_ID', [TColumnProp.Required])]
    FID: integer;

    [Column('COV_DATE', [TColumnProp.Required])]
    FDate: TDateTime;

    [Column('COV_VALUE', [], 15, 2)]
    FValue: Nullable<double>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('COT_ID', [TColumnProp.Required], 'COT_ID')]
    FCOT_ID: Proxy<TConsomationType>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('REL_ID', [TColumnProp.Required], 'REL_ID')]
    FREL_ID: Proxy<TResidenceLot>;
    function GetCOT_ID: TConsomationType;
    procedure SetCOT_ID(const Value: TConsomationType);
    function GetREL_ID: TResidenceLot;
    procedure SetREL_ID(const Value: TResidenceLot);
  public
    property ID: integer read FID write FID;
    property Date: TDateTime read FDate write FDate;
    property Value: Nullable<double> read FValue write FValue;
    property COT_ID: TConsomationType read GetCOT_ID write SetCOT_ID;
    property REL_ID: TResidenceLot read GetREL_ID write SetREL_ID;
  end;

implementation

{ TConsomationValue}

function TConsomationValue.GetCOT_ID: TConsomationType;
begin
  result := FCOT_ID.Value;
end;

procedure TConsomationValue.SetCOT_ID(const Value: TConsomationType);
begin
  FCOT_ID.Value := Value;
end;

function TConsomationValue.GetREL_ID: TResidenceLot;
begin
  result := FREL_ID.Value;
end;

procedure TConsomationValue.SetREL_ID(const Value: TResidenceLot);
begin
  FREL_ID.Value := Value;
end;


end.
