unit Core.Customer;

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
  Core.Country;

type
  [Entity]
  [Table('CUSTOMER')]
  [Sequence('GEN_CUSTOMER_ID')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  TCustomer = class
  private
    [Column('CU_ID', [TColumnProp.Required])]
    FID: integer;

    [Column('CU_NAME', [], 32)]
    FName: Nullable<string>;

    [Column('CU_FIRSTNAME', [], 32)]
    FFirstName: Nullable<string>;

    [Column('CU_ADDRESS', [], 255)]
    FAddress: Nullable<string>;

    [Column('CU_ZIPCODE', [], 10)]
    FZipCode: Nullable<string>;

    [Column('CU_CITY', [], 25)]
    FCity: Nullable<string>;

    [Column('CU_PHONE', [], 14)]
    FPhone: Nullable<string>;

    [Column('CU_CELLPHONE', [], 14)]
    FCellPhone: Nullable<string>;

    [Column('CU_EMAIL', [], 80)]
    FEmail: Nullable<string>;

    [Column('CU_ACCOUNT', [], 17)]
    FAccount: Nullable<string>;

    [Association([TAssociationProp.Lazy], [])]
    [JoinColumn('C_ID', [], 'C_ID')]
    FC_ID: Proxy<TCountry>;

    [Association([TAssociationProp.Lazy], [])]
    [JoinColumn('T_ID', [], 'T_ID')]
    FT_ID: Proxy<TTitle>;
    function GetC_ID: TCountry;
    procedure SetC_ID(const Value: TCountry);
    function GetT_ID: TTitle;
    procedure SetT_ID(const Value: TTitle);
  public
    property ID: integer read FID write FID;
    property Name: Nullable<string> read FName write FName;
    property FirstName: Nullable<string> read FFirstName write FFirstName;
    property Address: Nullable<string> read FAddress write FAddress;
    property ZipCode: Nullable<string> read FZipCode write FZipCode;
    property City: Nullable<string> read FCity write FCity;
    property Phone: Nullable<string> read FPhone write FPhone;
    property CellPhone: Nullable<string> read FCellPhone write FCellPhone;
    property Email: Nullable<string> read FEmail write FEmail;
    property Account: Nullable<string> read FAccount write FAccount;
    property C_ID: TCountry read GetC_ID write SetC_ID;
    property T_ID: TTitle read GetT_ID write SetT_ID;
  end;


implementation

{ TCustomer}

function TCustomer.GetC_ID: TCountry;
begin
  result := FC_ID.Value;
end;

procedure TCustomer.SetC_ID(const Value: TCountry);
begin
  FC_ID.Value := Value;
end;

function TCustomer.GetT_ID: TTitle;
begin
  result := FT_ID.Value;
end;

procedure TCustomer.SetT_ID(const Value: TTitle);
begin
  FT_ID.Value := Value;
end;

end.
