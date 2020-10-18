unit ParamCustomerForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ParamForm, Vcl.ExtCtrls, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, Data.DB, Aurelius.Bind.Dataset, DBAdvGrid,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Core.Customer, Controller.Customer,
  Generics.Collections, Vcl.StdCtrls, AdvToolBar;

type
  TfrmParamCustomer = class(TfrmParamForm)
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    ledtName: TLabeledEdit;
    ledtFirstName: TLabeledEdit;
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
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    ledtZipCode: TLabeledEdit;
    LinkControlToField3: TLinkControlToField;
    procedure dtsMainObjectUpdate(Dataset: TDataSet; AObject: TObject);
  private
    { Déclarations privées }
    FController: TCustomerController;
    FCustomers: TList<TCustomer>;


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

{ TfrmParamCustomer }

constructor TfrmParamCustomer.Create(AOwner: TComponent);
begin
  inherited;
  FController := TCustomerController.Create;
  Load;
end;

destructor TfrmParamCustomer.Destroy;
begin
  FCustomers.Free;
  FController.Free;
  inherited;
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
begin
  FCustomers := FController.GetAll;
  dtsMain.SetSourceList(FCustomers);
  dtsMain.Active := True;
  SetAdvGrid;
end;

end.
