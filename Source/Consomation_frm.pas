unit Consomation_frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, AdvSmoothListBox, AdvSmoothComboBox, Consomation_dmd,
  Vcl.StdCtrls, System.UITypes, AdvUtil;

type
  TfrmConsomation = class(TForm)
    pnlTop: TPanel;
    asg: TAdvStringGrid;
    cbxDateR: TComboBox;
    btnProcess: TButton;
    btnNewDate: TButton;
    procedure cbxDateRClick(Sender: TObject);
    procedure asgCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure asgCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: string; var Valid: Boolean);
    procedure cbxDateRChange(Sender: TObject);
    procedure btnProcessClick(Sender: TObject);
    procedure asgDblClickCell(Sender: TObject; ARow, ACol: Integer);
  private
    { Déclarations privées }
    FDataModified: Boolean;
    FdmdConsomation: TdmdConsomation;

    function GetDataModified: Boolean;
    function GetConsomationDate(const AItemIndex: Integer): TDateTime;
    function GetLotID(const ARow: Integer): Integer;

    procedure ProcessConso;

    procedure ClearAsgObjects(asg: TAdvStringGrid);

    procedure LoadDate;
    procedure LoadFromDataBase;
    procedure Save;
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmConsomation: TfrmConsomation;

implementation

{$R *.dfm}

uses FireDAC.Comp.Client, FireDAC.Stan.Param, Math, Consomation_unt, Main_dmd;

const
  COL_IDX_LOT = 1;
  COL_IDX_EF_R = 2;
  COL_IDX_EC_R = 3;
  COL_IDX_EF_C = 4;
  COL_IDX_EC_C = 5;

{ TfrmConsomation }

procedure TfrmConsomation.asgCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
 CanEdit := (ARow > 0) and (ACol in [COL_IDX_EF_R, COL_IDX_EC_R]);
end;

procedure TfrmConsomation.asgCellValidate(Sender: TObject; ACol, ARow: Integer;
  var Value: string; var Valid: Boolean);
begin
  FDataModified := True;
end;

procedure TfrmConsomation.asgDblClickCell(Sender: TObject; ARow, ACol: Integer);
var
  cv: TConsomationValue;
begin
  if (ACol > 0) then
  begin
    cv := asg.Objects[ACol, ARow] as TConsomationValue;
    MessageDlg(cv.ToString, mtInformation, [mbOk], 0)
  end;
end;

procedure TfrmConsomation.btnProcessClick(Sender: TObject);
begin
  ProcessConso;
end;

procedure TfrmConsomation.cbxDateRChange(Sender: TObject);
begin
  asg.UnHideColumnsAll;

  btnProcess.Visible := cbxDateR.ItemIndex > 0;

  if not btnProcess.Visible then
  begin
    asg.HideColumn(COL_IDX_EF_C);
    asg.HideColumn(COL_IDX_EC_C);
  end;
end;

procedure TfrmConsomation.cbxDateRClick(Sender: TObject);
begin
  if (cbxDateR.ItemIndex > 0) and GetDataModified then
  begin
    case MessageDlg('Voulez-vous appliquer les modifications ?', mtConfirmation, mbYesNo, 0) of
      mrYes: Save;
    end;
  end;

  asg.ClearRows(1, asg.RowCount);

  LoadDate;
end;

procedure TfrmConsomation.ClearAsgObjects(asg: TAdvStringGrid);
var
  i,j: Integer;
begin
  for i := 0 to asg.AllColCount-1 do
    for j := 0 to asg.AllRowCount-1 do
      if Assigned(asg.Objects[i,j]) then
      begin
        asg.Objects[i,j].Free;
        asg.Objects[i,j] := nil;
      end;
end;

constructor TfrmConsomation.Create(AOwner: TComponent);
begin
  inherited;
  FdmdConsomation := TdmdConsomation.Create(Self);
  LoadFromDataBase;
  FDataModified := False;
end;

destructor TfrmConsomation.Destroy;
begin
  ClearAsgObjects(asg);
  FdmdConsomation.Free;
  inherited;
end;

procedure TfrmConsomation.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if GetDataModified then
  begin
    case MessageDlg('Voulez-vous appliquer les modifications ?', mtConfirmation, mbYesNoCancel, 0) of
      mrCancel: CanClose := False;
      mrYes: Save;
    end;
  end;
end;

function TfrmConsomation.GetConsomationDate(const AItemIndex: Integer): TDateTime;
var
  tmp: string;
  y,m,d: word;
begin
  if (AItemIndex >= 0) then
  begin
    tmp := cbxDateR.Items[AItemIndex];
    y := StrToInt(Copy(tmp, 1, 4));
    m := StrToInt(Copy(tmp, 6, 2));
    d := StrToInt(Copy(tmp, 9, 2));

    Result := EncodeDate(y,m,d);
  end
  else
    Result := Now;
end;

function TfrmConsomation.GetDataModified: Boolean;
//var
//  i: Integer;
//  cv1, cv2: TConsomationValue;
begin
  Result := FDataModified;
(*  for i := 1 to asg.RowCount-1 do
  begin
    if Assigned(asg.Objects[2, i]) then
    begin
      cv1 := asg.Objects[2, i] as TConsomationValue;
      if cv1.DataModified then
      begin
        Result := True;
        Exit;
      end;
    end;
    if Assigned(asg.Objects[3, i]) then
    begin
      cv2 := asg.Objects[3, i] as TConsomationValue;
      if cv2.DataModified then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;*)
end;

function TfrmConsomation.GetLotID(const ARow: Integer): Integer;
var
  cv: TConsomationValue;
begin
  if Assigned(asg.Objects[COL_IDX_EF_R, ARow]) then
    cv := asg.Objects[COL_IDX_EF_R, ARow] as TConsomationValue
  else if Assigned(asg.Objects[COL_IDX_EC_R, ARow]) then
    cv := asg.Objects[COL_IDX_EC_R, ARow] as TConsomationValue
  else if Assigned(asg.Objects[0, ARow]) then
    cv := asg.Objects[0, ARow] as TConsomationValue;
  Result := cv.LotID;
end;

procedure TfrmConsomation.LoadDate;
var
  qry: TFDQuery;
  i: Integer;
  tmpRE_NUMBER: string;
  cv: TConsomationValue;
begin
  ClearAsgObjects(asg);
  qry := FdmdConsomation.qryConsoDate;
  qry.ParamByName('COV_DATE').AsDateTime := GetConsomationDate(cbxDateR.ItemIndex);
  qry.ParamByName('RE_ID').AsInteger := SelectedResidence.ID;
  qry.Open();
  try
    i := 0;
    tmpRE_NUMBER := '';
    while not qry.Eof do
    begin
      if tmpRE_NUMBER <> qry.FieldByName('REL_NUMBER').AsString then
      begin
        inc(i);
        asg.RowCount := Max(2,i+1);
        tmpRE_NUMBER := qry.FieldByName('REL_NUMBER').AsString;
      end;

      cv := TConsomationValue.Create;
      cv.ID := qry.FieldByName('COV_ID').AsInteger;
      cv.Value := qry.FieldByName('COV_VALUE').AsCurrency;
      cv.LotID := qry.FieldByName('REL_ID').AsInteger;
      cv.Date := qry.FieldByName('COV_DATE').AsDateTime;
      cv.DataModified := False;
      asg.Cells[COL_IDX_LOT, i] := qry.FieldByName('REL_NUMBER').AsString;
      cv.COT_ID := qry.FieldByName('COT_ID').AsInteger;
      if cv.COT_ID = 1 then
      begin
        asg.Cells[COL_IDX_EF_R, i] := CurrToStr(cv.Value);
        asg.Objects[COL_IDX_EF_R, i] := cv;
      end
      else if cv.COT_ID = 2 then
      begin
        asg.Cells[COL_IDX_EC_R, i] := CurrToStr(cv.Value);
        asg.Objects[COL_IDX_EC_R, i] := cv;
      end
      else if cv.COT_ID = 3 then
      begin
        asg.Cells[COL_IDX_EF_C, i] := CurrToStr(cv.Value);
        asg.Objects[COL_IDX_EF_C, i] := cv;
      end
      else if cv.COT_ID = 4 then
      begin
        asg.Cells[COL_IDX_EC_C, i] := CurrToStr(cv.Value);
        asg.Objects[COL_IDX_EC_C, i] := cv;
      end
      else
        asg.Objects[0, i] := cv;
      qry.Next;
    end;
  finally
    qry.Close;
  end;
  asg.AutoSizeColumns(False);
  FDataModified := False;
end;

procedure TfrmConsomation.LoadFromDataBase;
var
  qry: TFDQuery;
begin
  qry := FdmdConsomation.qryDateList;
  qry.ParamByName('RE_ID').AsInteger := SelectedResidence.ID;
  qry.Open();
  try
    while not qry.Eof do
    begin
      cbxDateR.Items.Add(FormatDateTime('yyyy-mm-dd', qry.FieldByName('AY_COV_DATE').AsDateTime));
      qry.Next;
    end;
  finally
    qry.Close;
  end;

  cbxDateR.ItemIndex := cbxDateR.Items.Count-1;
  LoadDate;
end;

procedure TfrmConsomation.ProcessConso;
var
  i,j: Integer;
  cv: TConsomationValue;
  cons: Currency;
begin
  for i := 1 to asg.RowCount-1 do
  begin
    for j := 2 to 3 do
    begin
      if (asg.Cells[j, i] <> '') then
      begin
        if assigned(asg.Objects[j, i]) then
        begin
          cv := asg.Objects[j, i] as TConsomationValue;
          cv.Value := StrToCurr(asg.Cells[j, i]);
          cons := cv.Value - FdmdConsomation.GetConsomation(cv.LotID, GetConsomationDate(cbxDateR.ItemIndex-1), cv.COT_ID);
          if (cons < 0) then
          begin
            if (cv.Value < 150) then
              cons := cv.Value
            else
              cons := 0;
          end;
          asg.Cells[j+2, i] := CurrToStr(cons);
        end
      end;
    end;
  end;
  FDataModified := True;
end;

procedure TfrmConsomation.Save;
var
  i,j: Integer;
  cv: TConsomationValue;
begin
  for i := 1 to asg.RowCount-1 do
  begin
    for j := COL_IDX_EF_R to COL_IDX_EC_C do
    begin
      if (asg.Cells[j, i] <> '') then
      begin
        if assigned(asg.Objects[j, i]) then
        begin
          cv := asg.Objects[j, i] as TConsomationValue;
          cv.Value := StrToCurr(asg.Cells[j, i]);
        end
        else
        begin
          cv := TConsomationValue.Create;
          cv.COT_ID := j-1;
//          if j = 2 then
//            cv.COT_ID := 1
//          else
//            cv.COT_ID := 2;
          cv.Date := GetConsomationDate(cbxDateR.ItemIndex);
          cv.Value := StrToCurr(asg.Cells[j, i]);
          cv.LotID := GetLotID(i);
        end;
        if cv.DataModified then
          FdmdConsomation.Save(cv);
      end;
    end;
  end;
end;

end.
