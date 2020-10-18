unit UI.VCL.ParamResidenceAddressForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UI.VCL.ParamForm, Data.DB,
  Aurelius.Bind.Dataset, Vcl.DBGrids, Vcl.Grids, AdvToolBar, Vcl.ExtCtrls,
  Controller.ResidenceAddress, Core.ResidenceAddress, Generics.Collections,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Core.Residence, Controller.Residence,
  Aurelius.Engine.ObjectManager, Aurelius.Bind.BaseDataset, System.Actions,
  Vcl.ActnList;

type
  TfrmParamResidenceAddress = class(TfrmParamForm)
    dtsMainSelf: TAureliusEntityField;
    dtsMainID: TIntegerField;
    dtsMainAddress: TStringField;
    dtsMainZipCode: TStringField;
    dtsMainCity: TStringField;
    dtsMainRE_ID: TAureliusEntityField;
    lblAddress: TLabel;
    dbeAddress: TDBEdit;
    dtsResidence: TAureliusDataset;
    dtsResidenceSelf: TAureliusEntityField;
    dtsResidenceID: TIntegerField;
    dtsResidenceName: TStringField;
    dtsMainRE_NAME: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure dtsMainObjectInsert(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectRemove(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectUpdate(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainNewRecord(DataSet: TDataSet);
  private
    { Déclarations privées }
    FManager: TObjectManager;
    FController: TResidenceAddressController;
    FResidenceAddresss: TList<TResidenceAddress>;
    FResidenceController: TResidenceController;
    FResidences: TList<TResidence>;


    FResidenceID: Integer;

    procedure Load;
    procedure SetResidenceID(const Value: Integer);
  protected
    procedure Flush; override;

  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property ResidenceID: Integer read FResidenceID write SetResidenceID;
  end;

var
  frmParamResidenceAddress: TfrmParamResidenceAddress;

implementation

{$R *.dfm}

uses DBConnection;

{ TfrmParamResidenceAddress }

constructor TfrmParamResidenceAddress.Create(AOwner: TComponent);
begin
  inherited;
  FManager := TDBConnection.GetInstance.CreateObjectManager;
  FController := TResidenceAddressController.Create(FManager);
  FResidenceController := TResidenceController.Create(FManager);
  Load;
end;

destructor TfrmParamResidenceAddress.Destroy;
begin
  FResidenceController.Free;
  FController.Free;
  FResidenceAddresss.Free;
  FResidences.Free;
  FManager.Free;
  inherited;
end;

procedure TfrmParamResidenceAddress.dtsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
//  dtsMainRE_ID.AsObject := FResidence;

end;

procedure TfrmParamResidenceAddress.dtsMainObjectInsert(Dataset: TDataSet;
  AObject: TObject);
//var
//  AResidenceAddress: TResidenceAddress;
begin
  inherited;
//  AResidenceAddress := TResidenceAddress(AObject);
  FController.Save(TResidenceAddress(AObject));
end;

procedure TfrmParamResidenceAddress.dtsMainObjectRemove(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FController.Delete(TResidenceAddress(AObject));
end;

procedure TfrmParamResidenceAddress.dtsMainObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FController.Save(TResidenceAddress(AObject));
end;

procedure TfrmParamResidenceAddress.Flush;
begin
  inherited;
  FController.Flush;
end;

procedure TfrmParamResidenceAddress.Load;
begin
  FResidences := FResidenceController.GetAll;
  dtsResidence.SetSourceList(FResidences);
  FResidenceAddresss := FController.GetAll;
  dtsMain.SetSourceList(FResidenceAddresss);
  dtsMain.Active := True;
end;

procedure TfrmParamResidenceAddress.SetResidenceID(const Value: Integer);
begin
  FResidenceID := Value;
//  FResidence := FResidenceController.GetOne(FResidenceID);
end;

end.
