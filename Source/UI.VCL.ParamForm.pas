unit UI.VCL.ParamForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CoreForm, Vcl.ExtCtrls, Vcl.Grids,
  AdvObj, AdvGrid, BaseGrid, DBAdvGrid, Data.DB, Aurelius.Bind.Dataset,
  AdvToolBar, UI.VCL.Form, Vcl.DBGrids, System.Actions, Vcl.ActnList,
  Vcl.StdActns, Aurelius.Bind.BaseDataset;

type
  TfrmParamForm = class(TCoreForm)
    pnlMain: TPanel;
    dtsMain: TAureliusDataset;
    dpTop: TAdvDockPanel;
    tbNavigator: TAdvToolBar;
    tbFirst: TDBAdvToolBarButton;
    tbPrior: TDBAdvToolBarButton;
    tbNext: TDBAdvToolBarButton;
    tbLast: TDBAdvToolBarButton;
    tbInsert: TDBAdvToolBarButton;
    tbDelete: TDBAdvToolBarButton;
    tbEdit: TDBAdvToolBarButton;
    tbPost: TDBAdvToolBarButton;
    tbCancel: TDBAdvToolBarButton;
    tbReload: TDBAdvToolBarButton;
    dsMain: TDataSource;
    dbgMain: TDBGrid;
    alMain: TActionList;
    tbTools: TAdvToolBar;
    tbEntityCopy: TAdvToolBarButton;
    tbEntityPaste: TAdvToolBarButton;
    actEntityCopy: TAction;
    actEntityPaste: TAction;
    actPreviewReport: TAction;
    tbPreviewReport: TAdvToolBarButton;
    actDesignReport: TAction;
    tbDesignReport: TAdvToolBarButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dtsMainObjectUpdate(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectInsert(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectRemove(Dataset: TDataSet; AObject: TObject);
    procedure dbgMainDblClick(Sender: TObject);
    procedure actPreviewReportExecute(Sender: TObject);
    procedure actDesignReportExecute(Sender: TObject);
  private
    procedure SetSelectedID(const Value: Integer);
    { Déclarations privées }
  protected
    FSelectedID: Integer;
    FDataModified: Boolean;
    FReportName: string;
    procedure Flush; virtual;
    procedure SelectAndClose; virtual;
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    property SelectedID: Integer read FSelectedID write SetSelectedID;
  end;

var
  frmParamForm: TfrmParamForm;

implementation

{$R *.dfm}

uses System.UITypes, Report_dmd;

procedure TfrmParamForm.actDesignReportExecute(Sender: TObject);
begin
  inherited;
  TdmdReport.Design(FReportName);
end;

procedure TfrmParamForm.actPreviewReportExecute(Sender: TObject);
begin
  inherited;
  TdmdReport.Preview(FReportName);
end;

constructor TfrmParamForm.Create(AOwner: TComponent);
begin
  inherited;
  FSelectedID := -1;
end;

procedure TfrmParamForm.dbgMainDblClick(Sender: TObject);
begin
  inherited;
  SelectAndClose;
end;

procedure TfrmParamForm.dtsMainObjectInsert(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FDataModified := True;
end;

procedure TfrmParamForm.dtsMainObjectRemove(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FDataModified := True;
end;

procedure TfrmParamForm.dtsMainObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FDataModified := True;
end;

procedure TfrmParamForm.Flush;
begin
  FDataModified := False;
end;

procedure TfrmParamForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if dtsMain.State in dsEditModes then
    dtsMain.Post;
  if FDataModified then
  begin
    case MessageDlg('Voulez-vous appliquer les modifications ?', mtConfirmation,
     mbYesNoCancel, 0) of
      mrYes:
      begin
        CanClose := True;
        Flush;
      end;
      mrNo: CanClose := True;
    else
      CanClose := False;
    end;
  end
  else
    CanClose := True;
end;

procedure TfrmParamForm.SelectAndClose;
begin
  ModalResult := mrYes;
end;

procedure TfrmParamForm.SetSelectedID(const Value: Integer);
begin
  FSelectedID := Value;
end;

end.
