unit Core.Country;

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
  [Table('COUNTRY')]
  [Sequence('GEN_COUNTRY_ID')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  TCountry = class
  private
    [Column('C_ID', [TColumnProp.Required])]
    FID: integer;

    [Column('C_ISO', [], 2)]
    FISO: Nullable<string>;

    [Column('C_NAME', [], 32)]
    FName: Nullable<string>;
  public
    property ID: integer read FID write FID;
    property ISO: Nullable<string> read FISO write FISO;
    property Name: Nullable<string> read FName write FName;
  end;

implementation

end.
