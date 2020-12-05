unit Core.AccountingYear;

interface

uses
  SysUtils, Generics.Collections,
  Aurelius.Mapping.Attributes,
  Aurelius.Types.Blob,
  Aurelius.Types.DynamicProperties,
  Aurelius.Types.Nullable,
  Aurelius.Types.Proxy,
  Aurelius.Criteria.Dictionary,
  Core.Residence;

type
  [Entity]
  [Description('Accouting year')]
  [Table('ACCOUNTING_YEAR')]
  [Sequence('GEN_ACCOUNTING_YEAR_ID')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  TAccountingYear = class
  private
    [Column('AY_ID', [TColumnProp.Required])]
    FID: integer;

    [Column('AY_NAME', [], 20)]
    FName: Nullable<string>;

    [Column('AY_DATE', [])]
    FDate: TDateTime;

    [Column('AY_COV_DATE', [])]
    FConsoDate: Nullable<TDateTime>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('RE_ID', [TColumnProp.Required], 'RE_ID')]
    FRE_ID: Proxy<TResidence>;

    function GetRE_ID: TResidence;
    procedure SetRE_ID(const Value: TResidence);
  public
    property ID: integer read FID write FID;
    property Name: Nullable<string> read FName write FName;
    property Date: TDateTime read FDate write FDate;
    property ConsoDate: Nullable<TDateTime> read FConsoDate write FConsoDate;
    property RE_ID: TResidence read GetRE_ID write SetRE_ID;
  end;


implementation

{ TAccountingYear }

function TAccountingYear.GetRE_ID: TResidence;
begin
  Result := FRE_ID.Value;
end;

procedure TAccountingYear.SetRE_ID(const Value: TResidence);
begin
  FRE_ID.Value := Value;
end;

end.
