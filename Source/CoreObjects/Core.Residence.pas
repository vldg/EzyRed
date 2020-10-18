unit Core.Residence;

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
  [Table('RESIDENCE')]
  [Sequence('GEN_RESIDENCE_ID')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  TResidence = class
  private
    [Column('RE_ID', [TColumnProp.Required])]
    FID: integer;

    [Column('RE_NAME', [], 40)]
    FName: Nullable<string>;
  public
    property ID: integer read FID write FID;
    property Name: Nullable<string> read FName write FName;
  end;


implementation

end.
