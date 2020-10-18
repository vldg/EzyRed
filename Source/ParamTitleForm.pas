unit ParamTitleForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ParamForm, Vcl.ExtCtrls, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, Generics.Collections, Controller.Title,
  Vcl.StdCtrls, Data.DB, Aurelius.Bind.Dataset, DBAdvGrid, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Core.Title, AdvToolBar;

type
  TfrmParamTitle = class(TfrmParamForm)
    ledtName: TLabeledEdit;
    ledtSmallName: TLabeledEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    dtsMainSelf: TAureliusEntityField;
    dtsMainID: TIntegerField;
    dtsMainName: TStringField;
    dtsMainSmallName: TStringField;
    procedure dtsMainObjectUpdate(Dataset: TDataSet; AObject: TObject);
  private
    { Déclarations privées }
    FController: TTitleController;
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
  frmParamTitle: TfrmParamTitle;

implementation

{$R *.dfm}

{ TfrmParamTitle }

constructor TfrmParamTitle.Create(AOwner: TComponent);
begin
  inherited;
  FController := TTitleController.Create;
  Load;
end;

destructor TfrmParamTitle.Destroy;
begin
  FTitles.Free;
  FController.Free;
  inherited;
end;

procedure TfrmParamTitle.dtsMainObjectUpdate(Dataset: TDataSet;
  AObject: TObject);
begin
  inherited;
  FController.Save(TTitle(AObject));
end;

procedure TfrmParamTitle.Flush;
begin
  inherited;
  FController.Flush;
end;

procedure TfrmParamTitle.Load;
begin
  FTitles := FController.GetAll;

  dtsMain.SetSourceList(FTitles);
  dtsMain.Active := True;
  SetAdvGrid;
end;

end.
