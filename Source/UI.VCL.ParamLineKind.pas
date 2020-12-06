unit UI.VCL.ParamLineKind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UI.VCL.ParamForm, Data.DB, System.Generics.Collections,
  System.Actions, Vcl.ActnList, Aurelius.Bind.BaseDataset, Aurelius.Engine.ObjectManager,
  Aurelius.Bind.Dataset, Vcl.Grids, Vcl.DBGrids, AdvToolBar, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Core.LineKind, Controller.LineKind, Controller.Residence, Controller.ResidenceAddress, Core.ResidenceAddress,
  AdvSearchList, AdvSearchEdit, DBAdvSearchEdit;

type
  TfrmParamLineKind = class(TfrmParamForm)
    dtsMainSelf: TAureliusEntityField;
    dtsMainID: TIntegerField;
    dtsMainName: TStringField;
    dtsMainCode: TStringField;
    lblName: TLabel;
    dbeName: TDBEdit;
    lblCode: TLabel;
    dbeCode: TDBEdit;
    dtsMainRE_ID: TAureliusEntityField;
    dtsResidenceAddress: TAureliusDataset;
    dtsResidenceAddressSelf: TAureliusEntityField;
    dtsResidenceAddressID: TIntegerField;
    dtsResidenceAddressAddress: TStringField;
    dtsMainREA_ID: TAureliusEntityField;
    dtsMainREA_ADDRESS: TStringField;
    dtsMainType_: TIntegerField;
    dbrgType: TDBRadioGroup;
    lblResidence: TLabel;
    dbeResidenceAddress: TDBLookupComboBox;
    btnParamKindLineLot: TButton;
    actParamKindLineLot: TAction;
    procedure dtsMainObjectInsert(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectRemove(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectUpdate(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainAfterScroll(DataSet: TDataSet);
    procedure dbrgTypeChange(Sender: TObject);
    procedure actParamKindLineLotExecute(Sender: TObject);
    procedure dtsMainNewRecord(DataSet: TDataSet);
  private
    { Déclarations privées }
    FManager: TObjectManager;

    FLineKinds: TList<TLineKind>;
    FLineKindController: TLineKindController;

    FResidenceAddresss: TList<TResidenceAddress>;
    FResidenceAddressController: TResidenceAddressController;

    FResidenceController: TResidenceController;

    procedure Load;

    procedure DisplayLine(const AType: Integer);
  protected
    procedure Flush; override;
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmParamLineKind: TfrmParamLineKind;

implementation

{$R *.dfm}

{ TfrmParamLineKind }

uses DBConnection, Main_dmd, UI.VCL.ParamLineKindLot;

procedure TfrmParamLineKind.actParamKindLineLotExecute(Sender: TObject);
begin
  inherited;
  frmParamLineKindLot := TfrmParamLineKindLot.Create(Self);
  try
    frmParamLineKindLot.LK_ID := dtsMainID.AsInteger;
    frmParamLineKindLot.ShowModal;
  finally
    frmParamLineKindLot.Release;
  end;
end;

constructor TfrmParamLineKind.Create(AOwner: TComponent);
begin
  FReportName := 'LineKind.fr3';
  inherited;
  FManager := TDBConnection.GetInstance.CreateObjectManager;
  FLineKindController := TLineKindController.Create(FManager);
  FResidenceController := TResidenceController.Create(FManager);
  FResidenceAddressController := TResidenceAddressController.Create(FManager);
  Load;
end;

procedure TfrmParamLineKind.dbrgTypeChange(Sender: TObject);
begin
  inherited;
  DisplayLine(dbrgType.ItemIndex);
end;

destructor TfrmParamLineKind.Destroy;
begin
  FLineKindController.Free;
  FResidenceController.Free;
  FResidenceAddressController.Free;

  FResidenceAddresss.Free;
  FLineKinds.Free;
  FManager.Free;
  inherited;
end;

procedure TfrmParamLineKind.DisplayLine(const AType: Integer);
begin
  dbeResidenceAddress.Visible := (AType = 1);
  lblResidence.Visible := dbeResidenceAddress.Visible;
  actParamKindLineLot.Visible := (AType in [2, 3]);
end;

procedure TfrmParamLineKind.dtsMainAfterScroll(DataSet: TDataSet);
begin
  inherited;
  DisplayLine(DataSet.FieldByName('Type_').AsInteger);
end;

procedure TfrmParamLineKind.dtsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
  dtsMainRE_ID.AsObject := FResidenceController.GetOne(SelectedResidence.ID);
end;

procedure TfrmParamLineKind.dtsMainObjectInsert(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FLineKindController.Save(AObject as TLineKind)
end;

procedure TfrmParamLineKind.dtsMainObjectRemove(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FLineKindController.Delete(AObject as TLineKind);
end;

procedure TfrmParamLineKind.dtsMainObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FLineKindController.Save(AObject as TLineKind);
end;

procedure TfrmParamLineKind.Flush;
begin
  inherited;
  FLineKindController.Flush;
end;

procedure TfrmParamLineKind.Load;
begin
  FResidenceAddresss := FResidenceAddressController.GetAll;
  dtsResidenceAddress.SetSourceList(FResidenceAddresss);

  FLineKinds := FLineKindController.GetAll(SelectedResidence.ID);
  dtsMain.SetSourceList(FLineKinds);
  dtsMain.Active := True;
end;

end.
