unit Consomation_dmd;

interface

uses
  System.SysUtils, System.Classes, Main_dmd, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Consomation_unt;

type
  TdmdConsomation = class(TDataModule)
    qryDateList: TFDQuery;
    qryConsoDate: TFDQuery;
    qryGetConsomationDate: TFDQuery;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    function GetConsomation(const ALotID: Integer; const ADate: TDateTime; const COT_ID: Integer): Currency;
    procedure Save(cv: TConsomationValue);
  end;

var
  dmdConsomation: TdmdConsomation;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdConsomation }

function TdmdConsomation.GetConsomation(const ALotID: Integer;
  const ADate: TDateTime; const COT_ID: Integer): Currency;
var
  qry: TFDQuery;
begin
  qry := qryGetConsomationDate;
  qry.ParamByName('COV_DATE').AsDateTime := ADate;
  qry.ParamByName('COT_ID').AsInteger := COT_ID;
  qry.ParamByName('REL_ID').AsInteger := ALotID;
  qry.Open;
  try
    if not qry.Eof then
    begin
      Result := qry.FieldByName('COV_VALUE').AsCurrency;

    end
    else
      Result := 0;
  finally
    qry.Close;
  end;
end;

procedure TdmdConsomation.Save(cv: TConsomationValue);
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(Self);
  try
    qry.Connection := dmdMain.dbMain;
    qry.SQL.Text := cv.GetSQLSriptText;
    qry.ExecSQL;
  finally
    qry.Free
  end;
end;

end.
