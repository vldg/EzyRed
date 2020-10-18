unit Core;

interface

uses
  SysUtils, Generics.Collections, Aurelius.Mapping.Attributes, Aurelius.Types.Blob, Aurelius.Types.DynamicProperties, Aurelius.Types.Nullable, Aurelius.Types.Proxy, Aurelius.Criteria.Dictionary;

type
  TCONSOMATION_TYPE = class;
  TCONSOMATION_VALUE = class;
  TCUSTOMER = class;
  TLOT_EVENT = class;
  TLOT_TEMPLATE = class;
  TRESIDENCE = class;
  TRESIDENCE_ADDRESS = class;
  TRESIDENCE_LOT = class;
  TTITLE = class;
  TCONSOMATION_TYPETableDictionary = class;
  TCONSOMATION_VALUETableDictionary = class;
  TCUSTOMERTableDictionary = class;
  TLOT_EVENTTableDictionary = class;
  TLOT_TEMPLATETableDictionary = class;
  TRESIDENCETableDictionary = class;
  TRESIDENCE_ADDRESSTableDictionary = class;
  TRESIDENCE_LOTTableDictionary = class;
  TTITLETableDictionary = class;
  
  [Entity]
  [Table('CONSOMATION_TYPE')]
  [Sequence('GEN_CONSOMATION_TYPE_ID')]
  [Id('FCOT_ID', TIdGenerator.IdentityOrSequence)]
  TCONSOMATION_TYPE = class
  private
    [Column('COT_ID', [TColumnProp.Required])]
    FCOT_ID: integer;
    
    [Column('COT_NAME', [], 40)]
    FCOT_NAME: Nullable<string>;
    
    [Column('COT_CODE', [], 5)]
    FCOT_CODE: Nullable<string>;
  public
    property COT_ID: integer read FCOT_ID write FCOT_ID;
    property COT_NAME: Nullable<string> read FCOT_NAME write FCOT_NAME;
    property COT_CODE: Nullable<string> read FCOT_CODE write FCOT_CODE;
  end;
  
  [Entity]
  [Table('CONSOMATION_VALUE')]
  [Sequence('GEN_CONSOMATION_VALUE_ID')]
  [Id('FCOV_ID', TIdGenerator.IdentityOrSequence)]
  TCONSOMATION_VALUE = class
  private
    [Column('COV_ID', [TColumnProp.Required])]
    FCOV_ID: integer;
    
    [Column('COV_DATE', [TColumnProp.Required])]
    FCOV_DATE: TDateTime;
    
    [Column('COV_VALUE', [], 15, 2)]
    FCOV_VALUE: Nullable<double>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('COT_ID', [TColumnProp.Required], 'COT_ID')]
    FCOT_ID: Proxy<TCONSOMATION_TYPE>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('REL_ID', [TColumnProp.Required], 'REL_ID')]
    FREL_ID: Proxy<TRESIDENCE_LOT>;
    function GetCOT_ID: TCONSOMATION_TYPE;
    procedure SetCOT_ID(const Value: TCONSOMATION_TYPE);
    function GetREL_ID: TRESIDENCE_LOT;
    procedure SetREL_ID(const Value: TRESIDENCE_LOT);
  public
    property COV_ID: integer read FCOV_ID write FCOV_ID;
    property COV_DATE: TDateTime read FCOV_DATE write FCOV_DATE;
    property COV_VALUE: Nullable<double> read FCOV_VALUE write FCOV_VALUE;
    property COT_ID: TCONSOMATION_TYPE read GetCOT_ID write SetCOT_ID;
    property REL_ID: TRESIDENCE_LOT read GetREL_ID write SetREL_ID;
  end;
  
  [Entity]
  [Table('CUSTOMER')]
  [Sequence('GEN_CUSTOMER_ID')]
  [Id('FCU_ID', TIdGenerator.IdentityOrSequence)]
  TCUSTOMER = class
  private
    [Column('CU_ID', [TColumnProp.Required])]
    FCU_ID: integer;
    
    [Column('CU_NAME', [], 32)]
    FCU_NAME: Nullable<string>;
    
    [Column('CU_FIRSTNAME', [], 32)]
    FCU_FIRSTNAME: Nullable<string>;
    
    [Column('CU_ADDRESS', [], 255)]
    FCU_ADDRESS: Nullable<string>;
    
    [Column('CU_PHONE', [], 14)]
    FCU_PHONE: Nullable<string>;
    
    [Column('CU_CELLPHONE', [], 14)]
    FCU_CELLPHONE: Nullable<string>;
    
    [Column('CU_EMAIL', [], 80)]
    FCU_EMAIL: Nullable<string>;
    
    [Column('CU_ACCOUNT', [], 17)]
    FCU_ACCOUNT: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], [])]
    [JoinColumn('CU_COUNTRY', [], 'C_ISO')]
    FCU_COUNTRY: Proxy<TCOUNTRY>;
    
    [Association([TAssociationProp.Lazy], [])]
    [JoinColumn('T_ID', [], 'T_ID')]
    FT_ID: Proxy<TTITLE>;
    function GetCU_COUNTRY: TCOUNTRY;
    procedure SetCU_COUNTRY(const Value: TCOUNTRY);
    function GetT_ID: TTITLE;
    procedure SetT_ID(const Value: TTITLE);
  public
    property CU_ID: integer read FCU_ID write FCU_ID;
    property CU_NAME: Nullable<string> read FCU_NAME write FCU_NAME;
    property CU_FIRSTNAME: Nullable<string> read FCU_FIRSTNAME write FCU_FIRSTNAME;
    property CU_ADDRESS: Nullable<string> read FCU_ADDRESS write FCU_ADDRESS;
    property CU_PHONE: Nullable<string> read FCU_PHONE write FCU_PHONE;
    property CU_CELLPHONE: Nullable<string> read FCU_CELLPHONE write FCU_CELLPHONE;
    property CU_EMAIL: Nullable<string> read FCU_EMAIL write FCU_EMAIL;
    property CU_ACCOUNT: Nullable<string> read FCU_ACCOUNT write FCU_ACCOUNT;
    property CU_COUNTRY: TCOUNTRY read GetCU_COUNTRY write SetCU_COUNTRY;
    property T_ID: TTITLE read GetT_ID write SetT_ID;
  end;
  
  [Entity]
  [Table('LOT_EVENT')]
  [Sequence('GEN_LOT_EVENT_ID')]
  [Id('FLOT_EVENT', TIdGenerator.IdentityOrSequence)]
  TLOT_EVENT = class
  private
    [Column('LOT_EVENT', [TColumnProp.Required])]
    FLOT_EVENT: integer;
    
    [Column('LOT_EVENT_TYPE', [])]
    FLOT_EVENT_TYPE: Nullable<integer>;
    
    [Column('LOT_EVENT_START', [])]
    FLOT_EVENT_START: Nullable<TDateTime>;
    
    [Column('LOT_EVENT_END', [])]
    FLOT_EVENT_END: Nullable<TDateTime>;
    
    [Association([TAssociationProp.Lazy], [])]
    [JoinColumn('CU_ID', [], 'CU_ID')]
    FCU_ID: Proxy<TCUSTOMER>;
    function GetCU_ID: TCUSTOMER;
    procedure SetCU_ID(const Value: TCUSTOMER);
  public
    property LOT_EVENT: integer read FLOT_EVENT write FLOT_EVENT;
    property LOT_EVENT_TYPE: Nullable<integer> read FLOT_EVENT_TYPE write FLOT_EVENT_TYPE;
    property LOT_EVENT_START: Nullable<TDateTime> read FLOT_EVENT_START write FLOT_EVENT_START;
    property LOT_EVENT_END: Nullable<TDateTime> read FLOT_EVENT_END write FLOT_EVENT_END;
    property CU_ID: TCUSTOMER read GetCU_ID write SetCU_ID;
  end;
  
  [Entity]
  [Table('LOT_TEMPLATE')]
  [Sequence('GEN_LOT_TEMPLATE_ID')]
  [Id('FLT_ID', TIdGenerator.IdentityOrSequence)]
  TLOT_TEMPLATE = class
  private
    [Column('LT_ID', [TColumnProp.Required])]
    FLT_ID: integer;
    
    [Column('LT_NAME', [], 32)]
    FLT_NAME: Nullable<string>;
    
    [Column('LT_CODE', [], 10)]
    FLT_CODE: Nullable<string>;
  public
    property LT_ID: integer read FLT_ID write FLT_ID;
    property LT_NAME: Nullable<string> read FLT_NAME write FLT_NAME;
    property LT_CODE: Nullable<string> read FLT_CODE write FLT_CODE;
  end;
  
  [Entity]
  [Table('RESIDENCE')]
  [Sequence('GEN_RESIDENCE_ID')]
  [Id('FRE_ID', TIdGenerator.IdentityOrSequence)]
  TRESIDENCE = class
  private
    [Column('RE_ID', [TColumnProp.Required])]
    FRE_ID: integer;
    
    [Column('RE_NAME', [], 40)]
    FRE_NAME: Nullable<string>;
  public
    property RE_ID: integer read FRE_ID write FRE_ID;
    property RE_NAME: Nullable<string> read FRE_NAME write FRE_NAME;
  end;
  
  [Entity]
  [Table('RESIDENCE_ADDRESS')]
  [Sequence('GEN_RESIDENCE_ADDRESS_ID')]
  [Id('FREA_ID', TIdGenerator.IdentityOrSequence)]
  TRESIDENCE_ADDRESS = class
  private
    [Column('REA_ID', [TColumnProp.Required])]
    FREA_ID: integer;
    
    [Column('REA_ADDRESS', [TColumnProp.Required], 50)]
    FREA_ADDRESS: string;
    
    [Column('REA_ZIP_CODE', [], 10)]
    FREA_ZIP_CODE: Nullable<string>;
    
    [Column('REA_CITY', [], 30)]
    FREA_CITY: Nullable<string>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('RE_ID', [TColumnProp.Required], 'RE_ID')]
    FRE_ID: Proxy<TRESIDENCE>;
    function GetRE_ID: TRESIDENCE;
    procedure SetRE_ID(const Value: TRESIDENCE);
  public
    property REA_ID: integer read FREA_ID write FREA_ID;
    property REA_ADDRESS: string read FREA_ADDRESS write FREA_ADDRESS;
    property REA_ZIP_CODE: Nullable<string> read FREA_ZIP_CODE write FREA_ZIP_CODE;
    property REA_CITY: Nullable<string> read FREA_CITY write FREA_CITY;
    property RE_ID: TRESIDENCE read GetRE_ID write SetRE_ID;
  end;
  
  [Entity]
  [Table('RESIDENCE_LOT')]
  [Sequence('GEN_RESIDENCE_LOT_ID')]
  [Id('FREL_ID', TIdGenerator.IdentityOrSequence)]
  TRESIDENCE_LOT = class
  private
    [Column('REL_ID', [TColumnProp.Required])]
    FREL_ID: integer;
    
    [Column('REL_NUMBER', [], 12)]
    FREL_NUMBER: Nullable<string>;
    
    [Column('REL_TYPE', [])]
    FREL_TYPE: Nullable<integer>;
    
    [Column('REL_FLOOR', [])]
    FREL_FLOOR: Nullable<integer>;
    
    [Column('REL_WATER_METER', [TColumnProp.Required])]
    FREL_WATER_METER: integer;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('CU_ID', [TColumnProp.Required], 'CU_ID')]
    FCU_ID: Proxy<TCUSTOMER>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], [])]
    [JoinColumn('REA_ID', [TColumnProp.Required], 'REA_ID')]
    FREA_ID: Proxy<TRESIDENCE_ADDRESS>;
    function GetCU_ID: TCUSTOMER;
    procedure SetCU_ID(const Value: TCUSTOMER);
    function GetREA_ID: TRESIDENCE_ADDRESS;
    procedure SetREA_ID(const Value: TRESIDENCE_ADDRESS);
  public
    property REL_ID: integer read FREL_ID write FREL_ID;
    property REL_NUMBER: Nullable<string> read FREL_NUMBER write FREL_NUMBER;
    property REL_TYPE: Nullable<integer> read FREL_TYPE write FREL_TYPE;
    property REL_FLOOR: Nullable<integer> read FREL_FLOOR write FREL_FLOOR;
    property REL_WATER_METER: integer read FREL_WATER_METER write FREL_WATER_METER;
    property CU_ID: TCUSTOMER read GetCU_ID write SetCU_ID;
    property REA_ID: TRESIDENCE_ADDRESS read GetREA_ID write SetREA_ID;
  end;
  
  [Entity]
  [Table('TITLE')]
  [Sequence('GEN_TITLE_ID')]
  [Id('FT_ID', TIdGenerator.IdentityOrSequence)]
  TTITLE = class
  private
    [Column('T_ID', [TColumnProp.Required])]
    FT_ID: integer;
    
    [Column('T_NAME', [], 32)]
    FT_NAME: Nullable<string>;
    
    [Column('T_SMALLNAME', [], 10)]
    FT_SMALLNAME: Nullable<string>;
  public
    property T_ID: integer read FT_ID write FT_ID;
    property T_NAME: Nullable<string> read FT_NAME write FT_NAME;
    property T_SMALLNAME: Nullable<string> read FT_SMALLNAME write FT_SMALLNAME;
  end;
  
  TDicDictionary = class
  private
    FCONSOMATION_TYPE: TCONSOMATION_TYPETableDictionary;
    FCONSOMATION_VALUE: TCONSOMATION_VALUETableDictionary;
    FCUSTOMER: TCUSTOMERTableDictionary;
    FLOT_EVENT: TLOT_EVENTTableDictionary;
    FLOT_TEMPLATE: TLOT_TEMPLATETableDictionary;
    FRESIDENCE: TRESIDENCETableDictionary;
    FRESIDENCE_ADDRESS: TRESIDENCE_ADDRESSTableDictionary;
    FRESIDENCE_LOT: TRESIDENCE_LOTTableDictionary;
    FTITLE: TTITLETableDictionary;
    function GetCONSOMATION_TYPE: TCONSOMATION_TYPETableDictionary;
    function GetCONSOMATION_VALUE: TCONSOMATION_VALUETableDictionary;
    function GetCUSTOMER: TCUSTOMERTableDictionary;
    function GetLOT_EVENT: TLOT_EVENTTableDictionary;
    function GetLOT_TEMPLATE: TLOT_TEMPLATETableDictionary;
    function GetRESIDENCE: TRESIDENCETableDictionary;
    function GetRESIDENCE_ADDRESS: TRESIDENCE_ADDRESSTableDictionary;
    function GetRESIDENCE_LOT: TRESIDENCE_LOTTableDictionary;
    function GetTITLE: TTITLETableDictionary;
  public
    destructor Destroy; override;
    property CONSOMATION_TYPE: TCONSOMATION_TYPETableDictionary read GetCONSOMATION_TYPE;
    property CONSOMATION_VALUE: TCONSOMATION_VALUETableDictionary read GetCONSOMATION_VALUE;
    property CUSTOMER: TCUSTOMERTableDictionary read GetCUSTOMER;
    property LOT_EVENT: TLOT_EVENTTableDictionary read GetLOT_EVENT;
    property LOT_TEMPLATE: TLOT_TEMPLATETableDictionary read GetLOT_TEMPLATE;
    property RESIDENCE: TRESIDENCETableDictionary read GetRESIDENCE;
    property RESIDENCE_ADDRESS: TRESIDENCE_ADDRESSTableDictionary read GetRESIDENCE_ADDRESS;
    property RESIDENCE_LOT: TRESIDENCE_LOTTableDictionary read GetRESIDENCE_LOT;
    property TITLE: TTITLETableDictionary read GetTITLE;
  end;
  
  TCONSOMATION_TYPETableDictionary = class
  private
    FCOT_ID: TDictionaryAttribute;
    FCOT_NAME: TDictionaryAttribute;
    FCOT_CODE: TDictionaryAttribute;
  public
    constructor Create;
    property COT_ID: TDictionaryAttribute read FCOT_ID;
    property COT_NAME: TDictionaryAttribute read FCOT_NAME;
    property COT_CODE: TDictionaryAttribute read FCOT_CODE;
  end;
  
  TCONSOMATION_VALUETableDictionary = class
  private
    FCOV_ID: TDictionaryAttribute;
    FCOV_DATE: TDictionaryAttribute;
    FCOV_VALUE: TDictionaryAttribute;
    FCOT_ID: TDictionaryAssociation;
    FREL_ID: TDictionaryAssociation;
  public
    constructor Create;
    property COV_ID: TDictionaryAttribute read FCOV_ID;
    property COV_DATE: TDictionaryAttribute read FCOV_DATE;
    property COV_VALUE: TDictionaryAttribute read FCOV_VALUE;
    property COT_ID: TDictionaryAssociation read FCOT_ID;
    property REL_ID: TDictionaryAssociation read FREL_ID;
  end;
  
  TCUSTOMERTableDictionary = class
  private
    FCU_ID: TDictionaryAttribute;
    FCU_NAME: TDictionaryAttribute;
    FCU_FIRSTNAME: TDictionaryAttribute;
    FCU_ADDRESS: TDictionaryAttribute;
    FCU_PHONE: TDictionaryAttribute;
    FCU_CELLPHONE: TDictionaryAttribute;
    FCU_EMAIL: TDictionaryAttribute;
    FCU_ACCOUNT: TDictionaryAttribute;
    FCU_COUNTRY: TDictionaryAssociation;
    FT_ID: TDictionaryAssociation;
  public
    constructor Create;
    property CU_ID: TDictionaryAttribute read FCU_ID;
    property CU_NAME: TDictionaryAttribute read FCU_NAME;
    property CU_FIRSTNAME: TDictionaryAttribute read FCU_FIRSTNAME;
    property CU_ADDRESS: TDictionaryAttribute read FCU_ADDRESS;
    property CU_PHONE: TDictionaryAttribute read FCU_PHONE;
    property CU_CELLPHONE: TDictionaryAttribute read FCU_CELLPHONE;
    property CU_EMAIL: TDictionaryAttribute read FCU_EMAIL;
    property CU_ACCOUNT: TDictionaryAttribute read FCU_ACCOUNT;
    property CU_COUNTRY: TDictionaryAssociation read FCU_COUNTRY;
    property T_ID: TDictionaryAssociation read FT_ID;
  end;
  
  TLOT_EVENTTableDictionary = class
  private
    FLOT_EVENT: TDictionaryAttribute;
    FLOT_EVENT_TYPE: TDictionaryAttribute;
    FLOT_EVENT_START: TDictionaryAttribute;
    FLOT_EVENT_END: TDictionaryAttribute;
    FCU_ID: TDictionaryAssociation;
  public
    constructor Create;
    property LOT_EVENT: TDictionaryAttribute read FLOT_EVENT;
    property LOT_EVENT_TYPE: TDictionaryAttribute read FLOT_EVENT_TYPE;
    property LOT_EVENT_START: TDictionaryAttribute read FLOT_EVENT_START;
    property LOT_EVENT_END: TDictionaryAttribute read FLOT_EVENT_END;
    property CU_ID: TDictionaryAssociation read FCU_ID;
  end;
  
  TLOT_TEMPLATETableDictionary = class
  private
    FLT_ID: TDictionaryAttribute;
    FLT_NAME: TDictionaryAttribute;
    FLT_CODE: TDictionaryAttribute;
  public
    constructor Create;
    property LT_ID: TDictionaryAttribute read FLT_ID;
    property LT_NAME: TDictionaryAttribute read FLT_NAME;
    property LT_CODE: TDictionaryAttribute read FLT_CODE;
  end;
  
  TRESIDENCETableDictionary = class
  private
    FRE_ID: TDictionaryAttribute;
    FRE_NAME: TDictionaryAttribute;
  public
    constructor Create;
    property RE_ID: TDictionaryAttribute read FRE_ID;
    property RE_NAME: TDictionaryAttribute read FRE_NAME;
  end;
  
  TRESIDENCE_ADDRESSTableDictionary = class
  private
    FREA_ID: TDictionaryAttribute;
    FREA_ADDRESS: TDictionaryAttribute;
    FREA_ZIP_CODE: TDictionaryAttribute;
    FREA_CITY: TDictionaryAttribute;
    FRE_ID: TDictionaryAssociation;
  public
    constructor Create;
    property REA_ID: TDictionaryAttribute read FREA_ID;
    property REA_ADDRESS: TDictionaryAttribute read FREA_ADDRESS;
    property REA_ZIP_CODE: TDictionaryAttribute read FREA_ZIP_CODE;
    property REA_CITY: TDictionaryAttribute read FREA_CITY;
    property RE_ID: TDictionaryAssociation read FRE_ID;
  end;
  
  TRESIDENCE_LOTTableDictionary = class
  private
    FREL_ID: TDictionaryAttribute;
    FREL_NUMBER: TDictionaryAttribute;
    FREL_TYPE: TDictionaryAttribute;
    FREL_FLOOR: TDictionaryAttribute;
    FREL_WATER_METER: TDictionaryAttribute;
    FCU_ID: TDictionaryAssociation;
    FREA_ID: TDictionaryAssociation;
  public
    constructor Create;
    property REL_ID: TDictionaryAttribute read FREL_ID;
    property REL_NUMBER: TDictionaryAttribute read FREL_NUMBER;
    property REL_TYPE: TDictionaryAttribute read FREL_TYPE;
    property REL_FLOOR: TDictionaryAttribute read FREL_FLOOR;
    property REL_WATER_METER: TDictionaryAttribute read FREL_WATER_METER;
    property CU_ID: TDictionaryAssociation read FCU_ID;
    property REA_ID: TDictionaryAssociation read FREA_ID;
  end;
  
  TTITLETableDictionary = class
  private
    FT_ID: TDictionaryAttribute;
    FT_NAME: TDictionaryAttribute;
    FT_SMALLNAME: TDictionaryAttribute;
  public
    constructor Create;
    property T_ID: TDictionaryAttribute read FT_ID;
    property T_NAME: TDictionaryAttribute read FT_NAME;
    property T_SMALLNAME: TDictionaryAttribute read FT_SMALLNAME;
  end;
  
function Dic: TDicDictionary;

implementation

var
  __Dic: TDicDictionary;

function Dic: TDicDictionary;
begin
  if __Dic = nil then __Dic := TDicDictionary.Create;
  result := __Dic
end;

{ TCONSOMATION_VALUE}

function TCONSOMATION_VALUE.GetCOT_ID: TCONSOMATION_TYPE;
begin
  result := FCOT_ID.Value;
end;

procedure TCONSOMATION_VALUE.SetCOT_ID(const Value: TCONSOMATION_TYPE);
begin
  FCOT_ID.Value := Value;
end;

function TCONSOMATION_VALUE.GetREL_ID: TRESIDENCE_LOT;
begin
  result := FREL_ID.Value;
end;

procedure TCONSOMATION_VALUE.SetREL_ID(const Value: TRESIDENCE_LOT);
begin
  FREL_ID.Value := Value;
end;

{ TCUSTOMER}

function TCUSTOMER.GetCU_COUNTRY: TCOUNTRY;
begin
  result := FCU_COUNTRY.Value;
end;

procedure TCUSTOMER.SetCU_COUNTRY(const Value: TCOUNTRY);
begin
  FCU_COUNTRY.Value := Value;
end;

function TCUSTOMER.GetT_ID: TTITLE;
begin
  result := FT_ID.Value;
end;

procedure TCUSTOMER.SetT_ID(const Value: TTITLE);
begin
  FT_ID.Value := Value;
end;

{ TLOT_EVENT}

function TLOT_EVENT.GetCU_ID: TCUSTOMER;
begin
  result := FCU_ID.Value;
end;

procedure TLOT_EVENT.SetCU_ID(const Value: TCUSTOMER);
begin
  FCU_ID.Value := Value;
end;

{ TRESIDENCE_ADDRESS}

function TRESIDENCE_ADDRESS.GetRE_ID: TRESIDENCE;
begin
  result := FRE_ID.Value;
end;

procedure TRESIDENCE_ADDRESS.SetRE_ID(const Value: TRESIDENCE);
begin
  FRE_ID.Value := Value;
end;

{ TRESIDENCE_LOT}

function TRESIDENCE_LOT.GetCU_ID: TCUSTOMER;
begin
  result := FCU_ID.Value;
end;

procedure TRESIDENCE_LOT.SetCU_ID(const Value: TCUSTOMER);
begin
  FCU_ID.Value := Value;
end;

function TRESIDENCE_LOT.GetREA_ID: TRESIDENCE_ADDRESS;
begin
  result := FREA_ID.Value;
end;

procedure TRESIDENCE_LOT.SetREA_ID(const Value: TRESIDENCE_ADDRESS);
begin
  FREA_ID.Value := Value;
end;

{ TDicDictionary}

destructor TDicDictionary.Destroy;
begin
  inherited;
  if FCONSOMATION_TYPE <> nil then FCONSOMATION_TYPE.Free;
  if FCONSOMATION_VALUE <> nil then FCONSOMATION_VALUE.Free;
  if FCUSTOMER <> nil then FCUSTOMER.Free;
  if FLOT_EVENT <> nil then FLOT_EVENT.Free;
  if FLOT_TEMPLATE <> nil then FLOT_TEMPLATE.Free;
  if FRESIDENCE <> nil then FRESIDENCE.Free;
  if FRESIDENCE_ADDRESS <> nil then FRESIDENCE_ADDRESS.Free;
  if FRESIDENCE_LOT <> nil then FRESIDENCE_LOT.Free;
  if FTITLE <> nil then FTITLE.Free;
end;

function TDicDictionary.GetCONSOMATION_TYPE: TCONSOMATION_TYPETableDictionary;
begin
  if FCONSOMATION_TYPE = nil then FCONSOMATION_TYPE := TCONSOMATION_TYPETableDictionary.Create;
  result := FCONSOMATION_TYPE;
end;

function TDicDictionary.GetCONSOMATION_VALUE: TCONSOMATION_VALUETableDictionary;
begin
  if FCONSOMATION_VALUE = nil then FCONSOMATION_VALUE := TCONSOMATION_VALUETableDictionary.Create;
  result := FCONSOMATION_VALUE;
end;

function TDicDictionary.GetCUSTOMER: TCUSTOMERTableDictionary;
begin
  if FCUSTOMER = nil then FCUSTOMER := TCUSTOMERTableDictionary.Create;
  result := FCUSTOMER;
end;

function TDicDictionary.GetLOT_EVENT: TLOT_EVENTTableDictionary;
begin
  if FLOT_EVENT = nil then FLOT_EVENT := TLOT_EVENTTableDictionary.Create;
  result := FLOT_EVENT;
end;

function TDicDictionary.GetLOT_TEMPLATE: TLOT_TEMPLATETableDictionary;
begin
  if FLOT_TEMPLATE = nil then FLOT_TEMPLATE := TLOT_TEMPLATETableDictionary.Create;
  result := FLOT_TEMPLATE;
end;

function TDicDictionary.GetRESIDENCE: TRESIDENCETableDictionary;
begin
  if FRESIDENCE = nil then FRESIDENCE := TRESIDENCETableDictionary.Create;
  result := FRESIDENCE;
end;

function TDicDictionary.GetRESIDENCE_ADDRESS: TRESIDENCE_ADDRESSTableDictionary;
begin
  if FRESIDENCE_ADDRESS = nil then FRESIDENCE_ADDRESS := TRESIDENCE_ADDRESSTableDictionary.Create;
  result := FRESIDENCE_ADDRESS;
end;

function TDicDictionary.GetRESIDENCE_LOT: TRESIDENCE_LOTTableDictionary;
begin
  if FRESIDENCE_LOT = nil then FRESIDENCE_LOT := TRESIDENCE_LOTTableDictionary.Create;
  result := FRESIDENCE_LOT;
end;

function TDicDictionary.GetTITLE: TTITLETableDictionary;
begin
  if FTITLE = nil then FTITLE := TTITLETableDictionary.Create;
  result := FTITLE;
end;

{ TCONSOMATION_TYPETableDictionary}

constructor TCONSOMATION_TYPETableDictionary.Create;
begin
  FCOT_ID := TDictionaryAttribute.Create('COT_ID');
  FCOT_NAME := TDictionaryAttribute.Create('COT_NAME');
  FCOT_CODE := TDictionaryAttribute.Create('COT_CODE');
end;

{ TCONSOMATION_VALUETableDictionary}

constructor TCONSOMATION_VALUETableDictionary.Create;
begin
  FCOV_ID := TDictionaryAttribute.Create('COV_ID');
  FCOV_DATE := TDictionaryAttribute.Create('COV_DATE');
  FCOV_VALUE := TDictionaryAttribute.Create('COV_VALUE');
  FCOT_ID := TDictionaryAssociation.Create('COT_ID');
  FREL_ID := TDictionaryAssociation.Create('REL_ID');
end;

{ TCUSTOMERTableDictionary}

constructor TCUSTOMERTableDictionary.Create;
begin
  FCU_ID := TDictionaryAttribute.Create('CU_ID');
  FCU_NAME := TDictionaryAttribute.Create('CU_NAME');
  FCU_FIRSTNAME := TDictionaryAttribute.Create('CU_FIRSTNAME');
  FCU_ADDRESS := TDictionaryAttribute.Create('CU_ADDRESS');
  FCU_PHONE := TDictionaryAttribute.Create('CU_PHONE');
  FCU_CELLPHONE := TDictionaryAttribute.Create('CU_CELLPHONE');
  FCU_EMAIL := TDictionaryAttribute.Create('CU_EMAIL');
  FCU_ACCOUNT := TDictionaryAttribute.Create('CU_ACCOUNT');
  FCU_COUNTRY := TDictionaryAssociation.Create('CU_COUNTRY');
  FT_ID := TDictionaryAssociation.Create('T_ID');
end;

{ TLOT_EVENTTableDictionary}

constructor TLOT_EVENTTableDictionary.Create;
begin
  FLOT_EVENT := TDictionaryAttribute.Create('LOT_EVENT');
  FLOT_EVENT_TYPE := TDictionaryAttribute.Create('LOT_EVENT_TYPE');
  FLOT_EVENT_START := TDictionaryAttribute.Create('LOT_EVENT_START');
  FLOT_EVENT_END := TDictionaryAttribute.Create('LOT_EVENT_END');
  FCU_ID := TDictionaryAssociation.Create('CU_ID');
end;

{ TLOT_TEMPLATETableDictionary}

constructor TLOT_TEMPLATETableDictionary.Create;
begin
  FLT_ID := TDictionaryAttribute.Create('LT_ID');
  FLT_NAME := TDictionaryAttribute.Create('LT_NAME');
  FLT_CODE := TDictionaryAttribute.Create('LT_CODE');
end;

{ TRESIDENCETableDictionary}

constructor TRESIDENCETableDictionary.Create;
begin
  FRE_ID := TDictionaryAttribute.Create('RE_ID');
  FRE_NAME := TDictionaryAttribute.Create('RE_NAME');
end;

{ TRESIDENCE_ADDRESSTableDictionary}

constructor TRESIDENCE_ADDRESSTableDictionary.Create;
begin
  FREA_ID := TDictionaryAttribute.Create('REA_ID');
  FREA_ADDRESS := TDictionaryAttribute.Create('REA_ADDRESS');
  FREA_ZIP_CODE := TDictionaryAttribute.Create('REA_ZIP_CODE');
  FREA_CITY := TDictionaryAttribute.Create('REA_CITY');
  FRE_ID := TDictionaryAssociation.Create('RE_ID');
end;

{ TRESIDENCE_LOTTableDictionary}

constructor TRESIDENCE_LOTTableDictionary.Create;
begin
  FREL_ID := TDictionaryAttribute.Create('REL_ID');
  FREL_NUMBER := TDictionaryAttribute.Create('REL_NUMBER');
  FREL_TYPE := TDictionaryAttribute.Create('REL_TYPE');
  FREL_FLOOR := TDictionaryAttribute.Create('REL_FLOOR');
  FREL_WATER_METER := TDictionaryAttribute.Create('REL_WATER_METER');
  FCU_ID := TDictionaryAssociation.Create('CU_ID');
  FREA_ID := TDictionaryAssociation.Create('REA_ID');
end;

{ TTITLETableDictionary}

constructor TTITLETableDictionary.Create;
begin
  FT_ID := TDictionaryAttribute.Create('T_ID');
  FT_NAME := TDictionaryAttribute.Create('T_NAME');
  FT_SMALLNAME := TDictionaryAttribute.Create('T_SMALLNAME');
end;

initialization

finalization
  if __Dic <> nil then __Dic.Free

end.
