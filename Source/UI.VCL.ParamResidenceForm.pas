unit UI.VCL.ParamResidenceForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UI.VCL.ParamForm, Data.DB,
  Aurelius.Bind.Dataset, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  AdvToolBar, Vcl.ExtCtrls, Generics.Collections, Controller.Residence,
  Core.Residence, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Aurelius.Bind.BaseDataset, System.Actions, Vcl.ActnList;

type
  TfrmParamResidence = class(TfrmParamForm)
    dtsMainSelf: TAureliusEntityField;
    dtsMainID: TIntegerField;
    dtsMainName: TStringField;
    Label1: TLabel;
    dbeName: TDBEdit;
    procedure dtsMainObjectInsert(Dataset: TDataSet; AObject: TObject);
  private
    { Déclarations privées }
    FController: TResidenceController;
    FResidences: TList<TResidence>;

    procedure Load;
  protected
    procedure Flush; override;
    procedure SelectAndClose; override;
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmParamResidence: TfrmParamResidence;

implementation

{$R *.dfm}

{ TfrmParamResidence }

constructor TfrmParamResidence.Create(AOwner: TComponent);
begin
  inherited;
  FController := TResidenceController.Create;
  Load;
end;

destructor TfrmParamResidence.Destroy;
begin
  FController.Free;
  FResidences.Free;
  inherited;
end;

procedure TfrmParamResidence.dtsMainObjectInsert(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FController.Save(TResidence(AObject));
end;

procedure TfrmParamResidence.Flush;
begin
  inherited;
  FController.Flush;
end;

procedure TfrmParamResidence.Load;
begin
  FResidences := FController.GetAll;

  dtsMain.SetSourceList(FResidences);
  dtsMain.Active := True;
end;

procedure TfrmParamResidence.SelectAndClose;
begin
  inherited;
  FSelectedID := dtsMainID.AsInteger;
end;

end.
