unit Core.BankAccountLine;

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
  Core.Residence;

type
  [Entity]
  [Table('BANK_ACCOUNT_LINE')]
  [Sequence('GEN_BANK_ACCOUNT_LINE_ID')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  TBankAccountLine = class
  private
    [Column('BAL_ID', [TColumnProp.Required])]
    FID: integer;

    [Column('BAL_DATE', [TColumnProp.Required])]
    FDate: TDateTime;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('CU_ID', [TColumnProp.Required], 'CU_ID')]
    FCU_ID: Proxy<TCustomer>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('RE_ID', [TColumnProp.Required], 'RE_ID')]
    FRE_ID: Proxy<TResidence>;

    [Column('BAL_DEBIT', [], 7, 2)]
    FDebit: Nullable<double>;
    [Column('BAL_CREDIT', [], 7, 2)]
    FCredit: Nullable<double>;
    [Column('BAL_LABEL', [], 32)]
    FLabel: Nullable<string>;


    function GetCU_ID: TCustomer;
    function GetRE_ID: TResidence;
    procedure SetCU_ID(const Value: TCustomer);
    procedure SetRE_ID(const Value: TResidence);
  public
    property ID: integer read FID write FID;
    property RE_ID: TResidence read GetRE_ID write SetRE_ID;
    property Date: TDateTime read FDate write FDate;
    property Label_: Nullable<string> read FLabel write FLabel;
    property Credit: Nullable<double> read FCredit write FCredit;
    property Debit: Nullable<double> read FDebit write FDebit;
    property CU_ID: TCustomer read GetCU_ID write SetCU_ID;
  end;


implementation

{ TLotEvent }

function TBankAccountLine.GetCU_ID: TCustomer;
begin
  Result := FCU_ID.Value;
end;

function TBankAccountLine.GetRE_ID: TResidence;
begin
  Result := FRE_ID.Value;
end;

procedure TBankAccountLine.SetCU_ID(const Value: TCustomer);
begin
  FCU_ID.Value := Value;
end;

procedure TBankAccountLine.SetRE_ID(const Value: TResidence);
begin
  FRE_ID.Value := Value;
end;

end.
