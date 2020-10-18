unit UI.VCL.ParamCustomerForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UI.VCL.ParamForm, 
  Data.Bind.Grid, Data.Bind.DBScope, Core.Customer, Controller.Customer,
  Core.Title, Controller.Title, Aurelius.Engine.ObjectManager, Data.DB,
  Aurelius.Bind.Dataset, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids,
  Vcl.DBGrids, AdvToolBar, Vcl.ExtCtrls, System.Generics.Collections,
  Vcl.StdActns, System.Actions, Vcl.ActnList, Aurelius.Bind.BaseDataset;

type
  TfrmParamCustomer = class(TfrmParamForm)
    dtsMainSelf: TAureliusEntityField;
    dtsMainID: TIntegerField;
    dtsMainName: TStringField;
    dtsMainFirstName: TStringField;
    dtsMainAddress: TStringField;
    dtsMainZipCode: TStringField;
    dtsMainCity: TStringField;
    dtsMainPhone: TStringField;
    dtsMainCellPhone: TStringField;
    dtsMainEmail: TStringField;
    dtsMainAccount: TStringField;
    dtsMainC_ID: TAureliusEntityField;
    dtsMainT_ID: TAureliusEntityField;
    dtsTitles: TAureliusDataset;
    dtsTitlesSelf: TAureliusEntityField;
    dtsTitlesID: TIntegerField;
    dtsTitlesName: TStringField;
    dtsTitlesSmallName: TStringField;
    dtsMainT_CODE: TStringField;
    dblcbTitle: TDBLookupComboBox;
    dtsMainT_IDSmallName: TStringField;
    lblT_NAME: TLabel;
    lblCU_NAME: TLabel;
    dbeCU_NAME: TDBEdit;
    lblCU_FIRSTNAME: TLabel;
    dbeCU_FIRSTNAME: TDBEdit;
    lblAddress: TLabel;
    dbmAddress: TDBMemo;
    lblZipCode: TLabel;
    dbeZipCode: TDBEdit;
    lblCity: TLabel;
    dbeCity: TDBEdit;
    lblPhone: TLabel;
    dbePhone: TDBEdit;
    lblCellPhone: TLabel;
    dbeCellPhone: TDBEdit;
    lblEmail: TLabel;
    dbeEmail: TDBEdit;
    dsTitles: TDataSource;
    procedure dtsMainObjectUpdate(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectInsert(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectRemove(Dataset: TDataSet; AObject: TObject);
  private
    { Déclarations privées }
    FManager: TObjectManager;
    FController: TCustomerController;
    FCustomers: TList<TCustomer>;
    FTitleController: TTitleController;
    FTitles: TList<TTitle>;

    procedure Load;
  protected
    procedure Flush; override;
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmParamCustomer: TfrmParamCustomer;

implementation

{$R *.dfm}

uses Main_dmd, DBConnection;

{ TfrmParamCustomer }

constructor TfrmParamCustomer.Create(AOwner: TComponent);
begin
  inherited;
  FManager := TDBConnection.GetInstance.CreateObjectManager;
  FController := TCustomerController.Create(FManager);
  FTitleController := TTitleController.Create(FManager);
  Load;
end;

destructor TfrmParamCustomer.Destroy;
begin
  FCustomers.Free;
  FController.Free;
  FTitles.Free;
  FTitleController.Free;
  FManager.Free;
  inherited;
end;

procedure TfrmParamCustomer.dtsMainObjectInsert(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FController.Save(TCustomer(AObject));
end;

procedure TfrmParamCustomer.dtsMainObjectRemove(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FController.Delete(TCustomer(AObject));
end;

procedure TfrmParamCustomer.dtsMainObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FController.Save(TCustomer(AObject));
end;

procedure TfrmParamCustomer.Flush;
begin
  inherited;
  FController.Flush;
end;

procedure TfrmParamCustomer.Load;
var
  lfTitle: TStringField;
begin
  FManager.Clear;

  FTitles := FTitleController.GetAll;
  dtsTitles.SetSourceList(FTitles);

  FCustomers := FController.GetAll;
  dtsMain.SetSourceList(FCustomers);

  dtsMain.Active := True;
end;

end.
