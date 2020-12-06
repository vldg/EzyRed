unit UI.VCL.ParamLineKindLot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UI.VCL.ParamForm, Data.DB, Aurelius.Engine.ObjectManager,
  System.Actions, Vcl.ActnList, Aurelius.Bind.BaseDataset, Generics.Collections,
  Aurelius.Bind.Dataset, Vcl.Grids, Vcl.DBGrids, AdvToolBar, Vcl.ExtCtrls,
  Core.LineKindLot, Controller.LineKindLot, Controller.LineKind,
  Core.ResidenceLot, Controller.ResidenceLot, Vcl.DBCtrls;

type
  TfrmParamLineKindLot = class(TfrmParamForm)
    dtsMainSelf: TAureliusEntityField;
    dtsMainID: TIntegerField;
    dtsMainLK_ID: TAureliusEntityField;
    dtsResidenceLot: TAureliusDataset;
    dtsResidenceLotSelf: TAureliusEntityField;
    dtsResidenceLotID: TIntegerField;
    dtsResidenceLotNumber: TStringField;
    dtsMainREL_ID: TAureliusEntityField;
    dtsMainREL_NUMBER: TStringField;
    dbeResidenceLot: TDBLookupComboBox;
    procedure dtsMainObjectInsert(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectRemove(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectUpdate(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainNewRecord(DataSet: TDataSet);
  private
    { Déclarations privées }
    FManager: TObjectManager;

    FLineKindLotController: TLineKindLotController;
    FLineKindLots: TList<TLineKindLot>;

    FLineKindController: TLineKindController;

    FResidenceLotController: TResidenceLotController;
    FResidenceLots: TList<TResidenceLot>;
    FLK_ID: Integer;

    procedure Load;
    procedure SetLK_ID(const Value: Integer);
  protected
    procedure Flush; override;
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property LK_ID: Integer read FLK_ID write SetLK_ID;
  end;

var
  frmParamLineKindLot: TfrmParamLineKindLot;

implementation

{$R *.dfm}

{ TfrmParamLineKindLot }

uses DBConnection, Main_dmd;

constructor TfrmParamLineKindLot.Create(AOwner: TComponent);
begin
  inherited;
  FManager := TDBConnection.GetInstance.CreateObjectManager;
  FLineKindLotController := TLineKindLotController.Create(FManager);
  FLineKindController := TLineKindController.Create(FManager);
  FResidenceLotController := TResidenceLotController.Create(FManager);
end;

destructor TfrmParamLineKindLot.Destroy;
begin
  FResidenceLotController.Free;
  FResidenceLots.Free;

  FLineKindController.Free;

  FLineKindLotController.Free;
  FLineKindLots.Free;
  FManager.Free;
  inherited;
end;

procedure TfrmParamLineKindLot.dtsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
  dtsMainLK_ID.AsObject := FLineKindController.GetOne(FLK_ID);
end;

procedure TfrmParamLineKindLot.dtsMainObjectInsert(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FLineKindLotController.Save(AObject as TLineKindLot)
end;

procedure TfrmParamLineKindLot.dtsMainObjectRemove(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FLineKindLotController.Delete(AObject as TLineKindLot)
end;

procedure TfrmParamLineKindLot.dtsMainObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FLineKindLotController.Save(AObject as TLineKindLot)
end;

procedure TfrmParamLineKindLot.Flush;
begin
  inherited;
  FLineKindLotController.Flush;
end;

procedure TfrmParamLineKindLot.Load;
begin
  FResidenceLots := FResidenceLotController.GetAll(SelectedResidence.ID);
  dtsResidenceLot.SetSourceList(FResidenceLots);

  FLineKindLots := FLineKindLotController.GetAll(FLK_ID);
  dtsMain.SetSourceList(FLineKindLots);
  dtsMain.Active := True;
end;

procedure TfrmParamLineKindLot.SetLK_ID(const Value: Integer);
begin
  FLK_ID := Value;
  Load;
end;

end.
