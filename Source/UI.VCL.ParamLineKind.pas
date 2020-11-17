unit UI.VCL.ParamLineKind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UI.VCL.ParamForm, Data.DB, System.Generics.Collections,
  System.Actions, Vcl.ActnList, Aurelius.Bind.BaseDataset, Aurelius.Engine.ObjectManager,
  Aurelius.Bind.Dataset, Vcl.Grids, Vcl.DBGrids, AdvToolBar, Vcl.ExtCtrls,
  Core.LineKind, Controller.LineKind, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmParamLineKind = class(TfrmParamForm)
    dtsMainSelf: TAureliusEntityField;
    dtsMainID: TIntegerField;
    dtsMainName: TStringField;
    dtsMainCode: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure dtsMainObjectInsert(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectRemove(Dataset: TDataSet; AObject: TObject);
    procedure dtsMainObjectUpdate(Dataset: TDataSet; AObject: TObject);
  private
    { Déclarations privées }
    FManager: TObjectManager;
    FLineKinds: TList<TLineKind>;
    FLineKinkdController: TLineKindController;

    procedure Load;
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmParamLineKind: TfrmParamLineKind;

implementation

{$R *.dfm}

{ TfrmParamLineKind }

uses DBConnection;

constructor TfrmParamLineKind.Create(AOwner: TComponent);
begin
  inherited;
  FManager := TDBConnection.GetInstance.CreateObjectManager;
  FLineKinkdController := TLineKindController.Create(FManager);
  Load;
end;

destructor TfrmParamLineKind.Destroy;
begin
  FLineKinkdController.Free;
  FManager.Free;
  inherited;
end;

procedure TfrmParamLineKind.dtsMainObjectInsert(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FLineKinkdController.Save(AObject as TLineKind)
end;

procedure TfrmParamLineKind.dtsMainObjectRemove(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FLineKinkdController.Delete(AObject as TLineKind);
end;

procedure TfrmParamLineKind.dtsMainObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FLineKinkdController.Save(AObject as TLineKind);
end;

procedure TfrmParamLineKind.Load;
begin
  FLineKinds := FLineKinkdController.GetAll; //Event(FResidenceLot.ID);
  dtsMain.SetSourceList(FLineKinds);
  dtsMain.Active := True;

end;

end.
