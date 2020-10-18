unit ParamForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CoreForm, Vcl.ExtCtrls, Vcl.Grids,
  AdvObj, AdvGrid, BaseGrid, DBAdvGrid, Data.DB, Aurelius.Bind.Dataset,
  AdvToolBar;

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
    dbag: TDBAdvGrid;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dtsMainObjectUpdate(Dataset: TDataSet; AObject: TObject);
  private
    { Déclarations privées }
  protected
    FDataModified: Boolean;
    procedure Flush; virtual;
    procedure SetAdvGrid;
  public
    { Déclarations publiques }
  end;

var
  frmParamForm: TfrmParamForm;

implementation

{$R *.dfm}

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

procedure TfrmParamForm.SetAdvGrid;
var
  i: Integer;
begin
  dbag.AutoSizeColumns(True);
  for i := 0 to dbag.ColCount-1 do
    dbag.Columns[i].ShowBands := True;
end;

end.
