unit Consomation_unt;

interface

uses System.Classes, System.SysUtils;

type
  TConsomationValue = Class
  private
    FDate: TDateTime;
    FID: Integer;
    FLotID: Integer;
    FValue: Currency;
    FCOT_ID: Integer;
    FDataModified: Boolean;
    procedure SetCOT_ID(const Value: Integer);
    procedure SetDate(const Value: TDateTime);
    procedure SetID(const Value: Integer);
    procedure SetLotID(const Value: Integer);
    procedure SetValue(const Value: Currency);

    procedure SetDataModified(const Value: Boolean);
  public
    function GetSQLSriptText: string;
    function ToString: string;

    property ID: Integer read FID write SetID;
    property COT_ID: Integer read FCOT_ID write SetCOT_ID;
    property Date: TDateTime read FDate write SetDate;
    property Value: Currency read FValue write SetValue;
    property LotID: Integer read FLotID write SetLotID;

    property DataModified: Boolean read FDataModified write SetDataModified;
  End;

implementation

{ TConsomationValue }

function TConsomationValue.GetSQLSriptText: string;
var
  ts: TStringList;
begin
  ts := TStringList.Create;
  try
    if (FID > 0) then
    begin
      ts.Add('UPDATE CONSOMATION_VALUE');
      ts.Add('SET COV_VALUE = ' + CurrToStr(FValue) + ',');
      ts.Add('COT_ID = ' + CurrToStr(FCOT_ID));
      ts.Add('WHERE COV_ID = ' + inttostr(FID));
    end
    else
    begin
      ts.Add('INSERT INTO CONSOMATION_VALUE (REL_ID, COT_ID, COV_DATE, COV_VALUE)');
      ts.Add('VALUES(' + IntToStr(FLotID) + ', ' + IntToStr(FCOT_ID) + ', ' + QuotedStr(FormatDateTime('yyyy-mm-dd', FDate)) + ', ' + CurrToStr(FValue) + ')');
    end;
    Result := ts.Text;
  finally
    ts.Free;
  end;
end;

procedure TConsomationValue.SetCOT_ID(const Value: Integer);
begin
  FDataModified := FDataModified or (Value <> FCOT_ID);
  FCOT_ID := Value;
end;

procedure TConsomationValue.SetDataModified(const Value: Boolean);
begin
  FDataModified := Value;
end;

procedure TConsomationValue.SetDate(const Value: TDateTime);
begin
  FDataModified := FDataModified or (Value <> FDate);
  FDate := Value;
end;

procedure TConsomationValue.SetID(const Value: Integer);
begin
  FDataModified := FDataModified or (Value <> FID);
  FID := Value;
end;

procedure TConsomationValue.SetLotID(const Value: Integer);
begin
  FDataModified := FDataModified or (Value <> FLotID);
  FLotID := Value;
end;

procedure TConsomationValue.SetValue(const Value: Currency);
begin
  FDataModified := FDataModified or (Value <> FValue);
  FValue := Value;
end;

function TConsomationValue.ToString: string;
begin
  Result := 'ID: ' + ID.ToString + sLineBreak +
            'COT_ID: ' + COT_ID.ToString + sLineBreak +
            'Date: ' + DateToStr(Date) + sLineBreak +
            'Value: ' + CurrToStr(Value) + sLineBreak +
            'LotID: ' + LotID.ToString;
end;

end.
