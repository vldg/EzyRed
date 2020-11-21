unit Core.Title;

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
  [Description('Title definition for customer')]
  [Table('LIND_KIND_LOT')]
  [Sequence('GEN_TITLE_ID')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  TTitle = class
  private
    [Column('T_ID', [TColumnProp.Required])]
    FID: integer;

    [Column('T_NAME', [], 32)]
    FName: Nullable<string>;

    [Column('T_SMALLNAME', [], 10)]
    FSmallName: Nullable<string>;
  public
    property ID: integer read FID write FID;
    property Name: Nullable<string> read FName write FName;
    property SmallName: Nullable<string> read FSmallName write FSmallName;
  end;

implementation

end.
