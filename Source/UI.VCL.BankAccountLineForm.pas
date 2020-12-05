unit UI.VCL.BankAccountLineForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UI.VCL.ParamForm, Aurelius.Engine.ObjectManager,
  Data.DB, Aurelius.Bind.BaseDataset, System.Actions, Vcl.ActnList,
  Aurelius.Bind.Dataset, Vcl.Grids, Vcl.DBGrids, AdvToolBar, Vcl.ExtCtrls,
  System.Generics.Collections, Core.BankAccountLine, Controller.BankAccountLine, Controller.Residence,
  Controller.Customer, Core.Customer, Core.LineKind, Controller.LineKind,
  Core.AccountingYear, Controller.AccountingYear,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, AdvDateTimePicker,
  AdvDBDateTimePicker, frxClass, frxDBSet;

type
  TfrmBankAccountLineForm = class(TfrmParamForm)
    dtsMainSelf: TAureliusEntityField;
    dtsMainID: TIntegerField;
    dtsMainRE_ID: TAureliusEntityField;
    dtsMainLabel_: TStringField;
    dtsMainCredit: TFloatField;
    dtsMainDebit: TFloatField;
    dtsMainCU_ID: TAureliusEntityField;
    lblLabel: TLabel;
    dbeLabel: TDBEdit;
    lblCredit: TLabel;
    dbeCredit: TDBEdit;
    lblDebit: TLabel;
    dbeDebit: TDBEdit;
    dtsMainDate: TDateTimeField;
    dbdtDate: TAdvDBDateTimePicker;
    lblDate: TLabel;
    dsCustomers: TDataSource;
    dtsCustomers: TAureliusDataset;
    dtsCustomersSelf: TAureliusEntityField;
    dtsCustomersID: TIntegerField;
    dtsCustomersName: TStringField;
    dtsCustomersFirstName: TStringField;
    lblName: TLabel;
    dtsMainCU_NAME: TStringField;
    dblcbCustomers: TDBLookupComboBox;
    dtsLineKind: TAureliusDataset;
    dtsLineKindSelf: TAureliusEntityField;
    dtsLineKindID: TIntegerField;
    dtsLineKindName: TStringField;
    dtsLineKindCode: TStringField;
    dtsMainLK_ID: TAureliusEntityField;
    dtsMainLK_NAME: TStringField;
    dsLineKind: TDataSource;
    dblcbLineKind: TDBLookupComboBox;
    dtsAccountingYear: TAureliusDataset;
    dtsAccountingYearSelf: TAureliusEntityField;
    dtsAccountingYearID: TIntegerField;
    dtsAccountingYearName: TStringField;
    dtsAccountingYearDate: TDateTimeField;
    dtsAccountingYearRE_ID: TAureliusEntityField;
    dtsMainAY_ID: TAureliusEntityField;
    dtsMainAY_NAME: TStringField;
    dblcbAccountingYear: TDBLookupComboBox;
    dsAccountingYear: TDataSource;
    dtsMainYearLine: TIntegerField;
    dbchxYearLine: TDBCheckBox;
    dtsAccountingYearConsoDate: TDateTimeField;
    procedure dtsMainNewRecord(DataSet: TDataSet);
    procedure dtsMainObjectInsert(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectUpdate(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectRemove(Dataset: TDataSet; AObject: TObject);
  private
    { Déclarations privées }
    FManager: TObjectManager;
    FBankAccountLines: TList<TBankAccountLine>;
    FCustomers: TList<TCustomer>;
    FLineKinds: TList<TLineKind>;
    FAccountingYears: TList<TAccountingYear>;
    FBankAccountLineController: TBankAccountLineController;
    FCustomerController: TCustomerController;
    FLineKindController: TLineKindController;
    FResidenceController: TResidenceController;
    FAccountingYearController: TAccountingYearController;

    procedure Load;

  protected
    procedure Flush; override;
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

var
  frmBankAccountLineForm: TfrmBankAccountLineForm;

implementation

{$R *.dfm}

{ TfrmBankAccountLineForm }

uses DBConnection, Main_dmd, Report_dmd;

constructor TfrmBankAccountLineForm.Create(AOwner: TComponent);
begin
  FReportName := 'BankAccountLine.fr3';
  inherited;
  FManager := TDBConnection.GetInstance.CreateObjectManager;
  FBankAccountLineController := TBankAccountLineController.Create(FManager);
  FResidenceController := TResidenceController.Create(FManager);
  FCustomerController := TCustomerController.Create(FManager);
  FLineKindController := TLineKindController.Create(FManager);
  FAccountingYearController := TAccountingYearController.Create(FManager);
  Load;
end;

destructor TfrmBankAccountLineForm.Destroy;
begin
  FBankAccountLines.Free;
  FBankAccountLineController.Free;
  FResidenceController.Free;
  FCustomers.Free;
  FCustomerController.Free;
  FAccountingYears.Free;
  FLineKinds.Free;
  FLineKindController.Free;
  FAccountingYearController.Free;
  FManager.Free;
  inherited;
end;

procedure TfrmBankAccountLineForm.dtsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
  dtsMainRE_ID.AsObject := FResidenceController.GetOne(SelectedResidence.ID);
  dtsMainDate.AsDateTime := Now;
end;

procedure TfrmBankAccountLineForm.dtsMainObjectInsert(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FBankAccountLineController.Save(TBankAccountLine(AObject));
end;

procedure TfrmBankAccountLineForm.dtsMainObjectRemove(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FBankAccountLineController.Delete(TBankAccountLine(AObject));
end;

procedure TfrmBankAccountLineForm.dtsMainObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FBankAccountLineController.Save(TBankAccountLine(AObject));
end;

procedure TfrmBankAccountLineForm.Flush;
begin
  inherited;
  FBankAccountLineController.Flush;
end;

procedure TfrmBankAccountLineForm.Load;
begin
  FAccountingYears := FAccountingYearController.GetAll;
  dtsAccountingYear.SetSourceList(FAccountingYears);
  FCustomers := FCustomerController.GetAll;
  dtsCustomers.SetSourceList(FCustomers);
  FLineKinds := FLineKindController.GetAll;
  dtsLineKind.SetSourceList(FLineKinds);
  FBankAccountLines := FBankAccountLineController.GetAll(SelectedResidence.ID);
  dtsMain.SetSourceList(FBankAccountLines);
  dtsMain.Active := True;
end;

end.
