unit Core.LotEvent;

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
  Core.ResidenceLot;

type
  [Entity]
  [Table('LOT_EVENT')]
  [Sequence('GEN_LOT_EVENT_ID')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  TLotEvent = class
  private
    [Column('LE_ID', [TColumnProp.Required])]
    FID: integer;

    [Column('LE_TYPE', [TColumnProp.Required])]
    FType: Integer;


    [Column('LE_START', [])]
    FDTStart: Nullable<TDateTime>;

    [Column('LE_END', [])]
    FDTEnd: Nullable<TDateTime>;


    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('CU_ID', [TColumnProp.Required], 'CU_ID')]
    FCU_ID: Proxy<TCustomer>;

    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('REL_ID', [TColumnProp.Required], 'REL_ID')]
    FREL_ID: Proxy<TResidenceLot>;

    function GetCU_ID: TCustomer;
    function GetREL_ID: TResidenceLot;
    procedure SetCU_ID(const Value: TCustomer);
    procedure SetREL_ID(const Value: TResidenceLot);
  public
    property ID: integer read FID write FID;
    property DTStart: Nullable<TDateTime> read FDTStart write FDTStart;
    property DTEnd: Nullable<TDateTime> read FDTEnd write FDTEnd;
    property Type_: Integer read FType write FType;
    property CU_ID: TCustomer read GetCU_ID write SetCU_ID;
    property REL_ID: TResidenceLot read GetREL_ID write SetREL_ID;
  end;


implementation

{ TLotEvent }

function TLotEvent.GetCU_ID: TCustomer;
begin
  Result := FCU_ID.Value;
end;

function TLotEvent.GetREL_ID: TResidenceLot;
begin
  Result := FREL_ID.Value;
end;

procedure TLotEvent.SetCU_ID(const Value: TCustomer);
begin
  FCU_ID.Value := Value;
end;

procedure TLotEvent.SetREL_ID(const Value: TResidenceLot);
begin
  FREL_ID.Value := Value;
end;

end.
