unit Report_dmd;

interface

uses
  System.SysUtils, System.Classes, frxChBox, frxOLE, frxDCtrl, frxDMPExport,
  frxCross, frxClass, frxADOComponents, frxBarcode, frxRich, frxExportBIFF,
  frxDesgn, frxGradient, frxCrypt, frxGZip, frxExportMail, frxExportImage,
  frxExportCSV, frxExportODF, frxExportPDF, frxExportXML, frxExportXLS,
  frxExportHTML, frxExportText, frxExportRTF, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxExportBaseDialog;

type
  TdmdReport = class(TDataModule)
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxRTFExport1: TfrxRTFExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxODSExport1: TfrxODSExport;
    frxODTExport1: TfrxODTExport;
    frxCSVExport1: TfrxCSVExport;
    frxGIFExport1: TfrxGIFExport;
    frxMailExport1: TfrxMailExport;
    frxGZipCompressor1: TfrxGZipCompressor;
    frxCrypt1: TfrxCrypt;
    frxGradientObject1: TfrxGradientObject;
    frxDesigner1: TfrxDesigner;
    frxBIFFExport1: TfrxBIFFExport;
    frxReport1: TfrxReport;
    frxRichObject1: TfrxRichObject;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxADOComponents1: TfrxADOComponents;
    frxCrossObject1: TfrxCrossObject;
    frxDotMatrixExport1: TfrxDotMatrixExport;
    frxDialogControls1: TfrxDialogControls;
    frxOLEObject1: TfrxOLEObject;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    qryRESIDENCE: TFDQuery;
    frxDBRESIDENCE: TfrxDBDataset;
    qryRESIDENCE_ADDRESS: TFDQuery;
    frxDBRESIDENCE_ADDRESS: TfrxDBDataset;
    qryRESIDENCE_LOT: TFDQuery;
    frxDBRESIDENCE_LOT: TfrxDBDataset;
    dsRESIDENCE_ADDRESS: TDataSource;
    qrySP_REPORT_CONSOMATION: TFDQuery;
    frxDBSP_REPORT_CONSOMATION: TfrxDBDataset;
    frxDBDataset1: TfrxDBDataset;
    FDQuery1: TFDQuery;
    dsRESIDENCE: TDataSource;
    qryBANK_ACCOUNT_LINE: TFDQuery;
    frxDBBANK_ACCOUNT_LINE: TfrxDBDataset;
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure qryRESIDENCEBeforeOpen(DataSet: TDataSet);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    class procedure Design(const AFileName: string = '');
    class procedure Preview(const AFileName: string = '');
  end;

function GetReportPath: string;

var
  dmdReport: TdmdReport;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Main_dmd, Forms;

{$R *.dfm}

{ TdmdReport }

function GetReportPath: string;
begin
  Result := StringReplace(ExtractFilePath(Application.ExeName), 'bin', 'Reports', []);
end;


class procedure TdmdReport.Design(const AFileName: string);
var
  AdmdReport: TdmdReport;
begin
  AdmdReport := TdmdReport.Create(nil);
  try
    if AFileName <> '' then
      AdmdReport.frxReport1.LoadFromFile(GetReportPath + AFileName);
    AdmdReport.frxReport1.DesignReport;
  finally
    AdmdReport.Free;
  end;
end;

procedure TdmdReport.frxReport1GetValue(const VarName: string;
  var Value: Variant);
begin
{
  if VarName = 'CUBEDESCRIPTION' then
    value := PTreeNodeValue(Tree.Selected.Data)^.Description
  else
  if VarName = 'SCHEMADESCRIPTION' then
    if ListBox1.itemindex >= 0 then
      value := PTreeNodeValue(Tree.Selected.Data)^.Shemas[ListBox1.itemindex].Description
    else
      value := ''
  else
}
  if VarName = 'CUBECAPTION' then
    value := SelectedResidence.Name;
{
  else
  if VarName = 'SCHEMACAPTION' then
    value := MDSlice.Caption
}
end;

class procedure TdmdReport.Preview(const AFileName: string);
var
  LdmdReport: TdmdReport;
begin
  LdmdReport := TdmdReport.Create(nil);
  try
    LdmdReport.frxReport1.LoadFromFile(GetReportPath + AFileName);
    LdmdReport.frxReport1.ShowReport;
  finally
    LdmdReport.Free;
  end;
end;

procedure TdmdReport.qryRESIDENCEBeforeOpen(DataSet: TDataSet);
begin
  qryRESIDENCE.ParamByName('RE_ID').AsInteger := SelectedResidence.ID;
end;

end.
