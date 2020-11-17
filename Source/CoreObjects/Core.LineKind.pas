unit Core.LineKind;

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
  public
    property ID: integer read FID write FID;
    property Name: Nullable<string> read FName write FName;
    property Code: Nullable<string> read FCode write FCode;
  end;

implementation

end.
