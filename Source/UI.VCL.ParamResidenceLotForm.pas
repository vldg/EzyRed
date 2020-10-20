unit UI.VCL.ParamResidenceLotForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UI.VCL.ParamForm, Data.DB,
  Aurelius.Bind.Dataset, Vcl.DBGrids, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, AdvToolBar, Vcl.ExtCtrls, Controller.ResidenceLot, Core.ResidenceLot,
  Generics.Collections, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Controller.ResidenceAddress,
  Core.ResidenceAddress, Aurelius.Engine.ObjectManager, Vcl.StdActns,
  System.Actions, Vcl.ActnList, Aurelius.Bind.BaseDataset;

type
  TfrmParamResidenceLot = class(TfrmParamForm)
    dtsMainSelf: TAureliusEntityField;
    dtsMainID: TIntegerField;
    dtsMainNumber: TStringField;
    dtsMainType_: TIntegerField;
    dtsMainFloor: TIntegerField;
    dtsMainWaterMeter: TIntegerField;
    dtsMainTantieme: TIntegerField;
    dtsMainREA_ID: TAureliusEntityField;
    lblNumber: TLabel;
    dbeNumber: TDBEdit;
    lblFloor: TLabel;
    dbeFloor: TDBEdit;
    lblTantieme: TLabel;
    dbeTantieme: TDBEdit;
    dbchxWaterMeter: TDBCheckBox;
    dbeResidence: TDBLookupComboBox;
    dtsResidence: TAureliusDataset;
    dtsResidenceSelf: TAureliusEntityField;
    dtsResidenceID: TIntegerField;
    dtsResidenceAddress: TStringField;
    dtsResidenceZipCode: TStringField;
    dtsResidenceCity: TStringField;
    dtsResidenceRE_ID: TAureliusEntityField;
    dtsMainREA_ADDRESS: TStringField;
    lblResidence: TLabel;
    procedure dtsMainObjectInsert(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectRemove(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectUpdate(Dataset: TDataSet; AObject: TObject);
    procedure actEntityCopyExecute(Sender: TObject);
    procedure actEntityPasteExecute(Sender: TObject);
  private
    { Déclarations privées }
    FManager: TObjectManager;
    FResidenceLotController: TResidenceLotController;
    FResidenceLots: TList<TResidenceLot>;
    FResidenceAddressController: TResidenceAddressController;
    FResidenceAddresss: TList<TResidenceAddress>;
    FEditResidenceLot: TResidenceLot;

    procedure Load;
  protected
    lookupField: TStringField;
    procedure Flush; override;
    procedure SelectAndClose; override;
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmParamResidenceLot: TfrmParamResidenceLot;

implementation

{$R *.dfm}

uses DBConnection, Main_dmd;

{ TfrmParamResidenceLot }

procedure TfrmParamResidenceLot.actEntityCopyExecute(Sender: TObject);
begin
  inherited;
//  dtsMain.CopyFields()
  FEditResidenceLot := dtsMainSelf.AsObject as TResidenceLot;
end;

procedure TfrmParamResidenceLot.actEntityPasteExecute(Sender: TObject);
begin
  inherited;
  dtsMain.Insert;
//FEditResidenceLot

  dtsMainType_.AsVariant := FEditResidenceLot.Type_;
  dtsMainFloor.AsVariant := FEditResidenceLot.Floor;
  dtsMainWaterMeter.AsVariant := FEditResidenceLot.WaterMeter;
  dtsMainTantieme.AsVariant := FEditResidenceLot.Tantieme;
//  dtsMainREA_ID.Variant := FEditResidenceLot.REA_ID;

end;

constructor TfrmParamResidenceLot.Create(AOwner: TComponent);
begin
  inherited;
  FManager := TDBConnection.GetInstance.CreateObjectManager;
  FResidenceLotController := TResidenceLotController.Create(FManager);
  FResidenceAddressController := TResidenceAddressController.Create(FManager);
//  FResidenceLotController := TResidenceLotController.Create();
//  FResidenceAddressController := TResidenceAddressController.Create();
  Load;
end;

destructor TfrmParamResidenceLot.Destroy;
begin
  FResidenceAddressController.Free;
  FResidenceLotController.Free;
  FResidenceAddresss.Free;
  FResidenceLots.Free;
  FManager.Free;
  inherited;
end;

procedure TfrmParamResidenceLot.dtsMainObjectInsert(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FResidenceLotController.Save(TResidenceLot(AObject));
end;

procedure TfrmParamResidenceLot.dtsMainObjectRemove(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FResidenceLotController.Delete(TResidenceLot(AObject));
end;

procedure TfrmParamResidenceLot.dtsMainObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FResidenceLotController.Save(TResidenceLot(AObject));
end;

procedure TfrmParamResidenceLot.Flush;
begin
  inherited;
  FResidenceLotController.Flush;
end;

procedure TfrmParamResidenceLot.Load;
begin
  FResidenceLots := FResidenceLotController.GetAll(SelectedResidence.ID);
  FResidenceAddresss := FResidenceAddressController.GetAll;
  dtsResidence.SetSourceList(FResidenceAddresss);
  dtsMain.SetSourceList(FResidenceLots);

{  lookupField := TStringField.Create(dtsMain);
  lookupField.FieldName := 'Adresse';
  lookupField.FieldKind := fkLookup;
  lookupField.DataSet := dtsMain;
  lookupField.LookupDataSet := dtsResidence;
  lookupField.LookupKeyFields := 'Self';
  lookupField.LookupResultField := 'Address';
  lookupField.LookupKeyFields := 'REA_ID';
}
  dtsResidence.Active := True;

  dtsMain.Active := True;

end;

procedure TfrmParamResidenceLot.SelectAndClose;
begin
  inherited;
  FSelectedID := dtsMainID.AsInteger;
  ShowMessage(inttostr(FSelectedID));
end;

end.
