unit UI.VCL.ParamAccountingYear;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UI.VCL.ParamForm, Data.DB,
  System.Actions, Vcl.ActnList, Aurelius.Bind.BaseDataset, Aurelius.Engine.ObjectManager,
  Aurelius.Bind.Dataset, Vcl.Grids, Vcl.DBGrids, AdvToolBar, Vcl.ExtCtrls,
  Core.AccountingYear, Controller.AccountingYear, Controller.Residence,
  System.Generics.Collections,
  Vcl.ComCtrls, AdvDateTimePicker, AdvDBDateTimePicker, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls;

type
  TfrmParamAccoutingYear = class(TfrmParamForm)
    dtsMainSelf: TAureliusEntityField;
    dtsMainID: TIntegerField;
    dtsMainName: TStringField;
    dtsMainDate: TDateTimeField;
    dtsMainConsoDate: TDateTimeField;
    dtsMainRE_ID: TAureliusEntityField;
    lblName: TLabel;
    dbeName: TDBEdit;
    Label1: TLabel;
    dbdtDate: TAdvDBDateTimePicker;
    dbdtConsoDate: TAdvDBDateTimePicker;
    procedure dtsMainObjectInsert(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectUpdate(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectRemove(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainNewRecord(DataSet: TDataSet);
  private
    { Déclarations privées }

    FManager: TObjectManager;

    FAccountingYears: TList<TAccountingYear>;
    FAccountingYearController: TAccountingYearController;
    FResidenceController: TResidenceController;

    procedure Load;

  protected
    procedure Flush; override;
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmParamAccoutingYear: TfrmParamAccoutingYear;

implementation

{$R *.dfm}

{ TfrmParamAccoutingYear }

uses DBConnection, Main_dmd;

constructor TfrmParamAccoutingYear.Create(AOwner: TComponent);
begin
  inherited;
  FManager := TDBConnection.GetInstance.CreateObjectManager;
  FAccountingYearController := TAccountingYearController.Create(FManager);
  FResidenceController := TResidenceController.Create(FManager);
  Load;
end;

destructor TfrmParamAccoutingYear.Destroy;
begin
  FAccountingYears.Free;
  FAccountingYearController.Free;
  FResidenceController.Free;
  FManager.Free;
  inherited;
end;

procedure TfrmParamAccoutingYear.dtsMainNewRecord(DataSet: TDataSet);
begin
  inherited;
  dtsMainRE_ID.AsObject := FResidenceController.GetOne(SelectedResidence.ID);
end;

procedure TfrmParamAccoutingYear.dtsMainObjectInsert(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FAccountingYearController.Save(AObject as TAccountingYear);
end;

procedure TfrmParamAccoutingYear.dtsMainObjectRemove(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FAccountingYearController.Delete(AObject as TAccountingYear);
end;

procedure TfrmParamAccoutingYear.dtsMainObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FAccountingYearController.Save(AObject as TAccountingYear);
end;

procedure TfrmParamAccoutingYear.Flush;
begin
  inherited;
  FAccountingYearController.Flush;
end;

procedure TfrmParamAccoutingYear.Load;
begin
  FAccountingYears := FAccountingYearController.GetAll(SelectedResidence.ID);
  dtsMain.SetSourceList(FAccountingYears);
  dtsMain.Active := True;
end;

end.
