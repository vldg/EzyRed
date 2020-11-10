unit UI.VCL.ParamLotEventForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UI.VCL.ParamForm, Data.DB, System.Generics.Collections,
  System.Actions, Vcl.ActnList, Aurelius.Bind.BaseDataset, Aurelius.Engine.ObjectManager,
  Aurelius.Bind.Dataset, Vcl.Grids, Vcl.DBGrids, AdvToolBar, Vcl.ExtCtrls,
  Controller.LotEvent, Controller.Customer, Core.ResidenceLot, Core.Customer, Core.LotEvent,
  Controller.ResidenceLot, Vcl.DBCtrls, Vcl.ComCtrls, AdvDateTimePicker, AdvDBDateTimePicker;

type
  TfrmParamLotEvent = class(TfrmParamForm)
    dtsCustomers: TAureliusDataset;
    dblcbCustomers: TDBLookupComboBox;
    dsCustomers: TDataSource;
    dbdtStart: TAdvDBDateTimePicker;
    dtsMainSelf: TAureliusEntityField;
    dtsMainID: TIntegerField;
    dtsMainDTStart: TDateTimeField;
    dtsMainDTEnd: TDateTimeField;
    dtsMainType_: TIntegerField;
    dtsMainCU_ID: TAureliusEntityField;
    dtsMainREL_ID: TAureliusEntityField;
    dbdtEnd: TAdvDBDateTimePicker;
    dtsCustomersSelf: TAureliusEntityField;
    dtsCustomersID: TIntegerField;
    dtsCustomersName: TStringField;
    dtsCustomersFirstName: TStringField;
    dtsMainCU_NAME: TStringField;
    procedure dtsMainObjectInsert(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectRemove(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectUpdate(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainNewRecord(DataSet: TDataSet);
  private
    { Déclarations privées }
    FManager: TObjectManager;
    FLotEvents: TList<TLotEvent>;
    FLotEventController: TLotEventController;
    FCustomerController: TCustomerController;
    FResidenceLotController: TResidenceLotController;
    FCustomers: TList<TCustomer>;
    FResidenceLot: TResidenceLot;

    procedure SetResidenceLot(const Value: TResidenceLot);

    procedure Load;
  protected
    procedure Flush; override;

  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property ResidenceLot: TResidenceLot read FResidenceLot write SetResidenceLot;

  end;

var
  frmParamLotEvent: TfrmParamLotEvent;

implementation

{$R *.dfm}

uses DBConnection;

{ TfrmParamLotEvent }

constructor TfrmParamLotEvent.Create(AOwner: TComponent);
begin
  inherited;
  FManager := TDBConnection.GetInstance.CreateObjectManager;
  FLotEventController := TLotEventController.Create(FManager);
  FCustomerController := TCustomerController.Create(FManager);

  FResidenceLotController := TResidenceLotController.Create(FManager);
end;

destructor TfrmParamLotEvent.Destroy;
begin

  FCustomerController.Free;
  FLotEventController.Free;
  FManager.Free;
  inherited;
end;

procedure TfrmParamLotEvent.dtsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
//  dtsMainREL_ID.AsInteger := FResidenceLot.ID;
  dtsMainREL_ID.AsObject := FResidenceLot;
 // FResidenceLotController.Load()

end;

procedure TfrmParamLotEvent.dtsMainObjectInsert(Dataset: TDataSet;
  AObject: TObject);
//var
//  LLotEvent: TLotEvent;
begin
  inherited;
//  LLotEvent := AObject as TLotEvent;
//  LLotEvent.REL_ID := FResidenceLot;
//  FLotEventController.Save(LLotEvent);
  FLotEventController.Save(TLotEvent(AObject));
end;

procedure TfrmParamLotEvent.dtsMainObjectRemove(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FLotEventController.Delete(TLotEvent(AObject));
end;

procedure TfrmParamLotEvent.dtsMainObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FLotEventController.Save(TLotEvent(AObject));
end;

procedure TfrmParamLotEvent.Flush;
begin
  inherited;
  FLotEventController.Flush;
end;

procedure TfrmParamLotEvent.Load;
begin
  FCustomers := FCustomerController.GetAll;
  dtsCustomers.SetSourceList(FCustomers);
  FLotEvents := FLotEventController.GetAllEvent(FResidenceLot.ID);
  dtsMain.SetSourceList(FLotEvents);
  dtsMain.Active := True;
end;

procedure TfrmParamLotEvent.SetResidenceLot(const Value: TResidenceLot);
begin
  FResidenceLot := Value;
  Load;
end;

end.
