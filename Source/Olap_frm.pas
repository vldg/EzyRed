unit Olap_frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls,
  fcxCustomToolbar, fcxSliceGridToolbar, fcxComponent, fcxSlice, fcxSliceGrid,
  fcxFilters, fcxCube, fcxControl, fcxZone, fcxCustomGrid, fcxCubeGrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, fcxDataSource, AdvPageControl, Vcl.StdCtrls,
  fcxCustomExport, fcxExportHTML, frxclass, frxDBSet, fcxpComponents, fcxpChartComponents, fcxpChart,
  VclTee.TeeGDIPlus,
  VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, fcxChart;

type
  TfrmOlap = class(TForm)
    fcxCube1: TfcxCube;
    fcxSlice1: TfcxSlice;
    qrySP_REPORT_CONSOMATION: TFDQuery;
    fcxDataSource1: TfcxDataSource;
    fcxDBDataSet1: TfcxDBDataSet;
    pcMain: TPageControl;
    tshtGrid: TTabSheet;
    tshtGraph: TTabSheet;
    fcxSliceGrid: TfcxSliceGrid;
    Button1: TButton;
    fcxHTMLExport1: TfcxHTMLExport;
    fcxChartToolBar1: TfcxChartToolBar;
    fcxChart1: TfcxChart;
    fcxSliceGridToolbar1: TfcxSliceGridToolbar;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
    frxReport: TfrxReport;
    frxDBDataset: TfrxDBDataset;
    fcxpSliceGridProvider: TfcxpSliceGridProvider;
    fcxpChartProvider: TfcxpChartProvider;
    procedure CreateReportObjects;

  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

var
  frmOlap: TfrmOlap;

implementation

{$R *.dfm}

{ TfrmOlap }

uses Report_dmd;

procedure TfrmOlap.Button1Click(Sender: TObject);
begin
  TdmdReport.Design('ver2rep.fr3');
//  frxReport.LoadFromFile(GetDataPath + 'cubes' + PathDelim + 'ver2rep.fr3');
//  frxReport.ShowReport();
//  frxReport.DesignReport();
  TdmdReport.Preview('ver2rep.fr3');
end;

constructor TfrmOlap.Create(AOwner: TComponent);
begin
  inherited;
  CreateReportObjects;
end;

procedure TfrmOlap.CreateReportObjects;
begin
  frxReport := TfrxReport.Create(Self);
//  frxReport.OnGetValue := frxReportGetValue;
  frxDBDataset := TfrxDBDataset.Create(Self);
  frxDBDataset.UserName := 'frxDBDataset1';
  fcxpSliceGridProvider := TfcxpSliceGridProvider.Create(Self);
  fcxpSliceGridProvider.SliceGrid := fcxSliceGrid;
  fcxpSliceGridProvider.UserName := 'fcxpSliceGridProvider1';
  fcxpSliceGridProvider.PaintSizes.AutoSizeStyle := ssAutoRowHeight;
  fcxpChartProvider := TfcxpChartProvider.Create(Self);
  fcxpChartProvider.Chart := fcxChart1;
  fcxpChartProvider.UserName := 'fcxpChartProvider1';
end;


procedure TfrmOlap.FormCreate(Sender: TObject);
begin
  fcxCube1.Active := True;



  fcxSlice1.LoadFromFile(ExtractFilePath(Application.ExeName) + 'schema.mds');
end;

end.
