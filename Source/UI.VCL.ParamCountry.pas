unit UI.VCL.ParamCountry;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UI.VCL.ParamForm, Data.DB,
  Aurelius.Bind.Dataset, Vcl.DBGrids, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, AdvToolBar, Vcl.ExtCtrls, Controller.Country, Core.Country,
  Generics.Collections;

type
  TfrmParamCountry = class(TfrmParamForm)
    dtsMainSelf: TAureliusEntityField;
    dtsMainID: TIntegerField;
    dtsMainISO: TStringField;
    dtsMainName: TStringField;
  private
    { Déclarations privées }
    FController: TCountryController;
    FCountrys: TList<TCountry>;

    procedure Load;
  protected
    procedure Flush; override;

  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmParamCountry: TfrmParamCountry;

implementation

{$R *.dfm}

{ TfrmParamCountry }

constructor TfrmParamCountry.Create(AOwner: TComponent);
begin
  inherited;
  FController := TCountryController.Create;
  Load;
end;

destructor TfrmParamCountry.Destroy;
begin
  FController.Free;
  FCountrys.Free;
  inherited;
end;

procedure TfrmParamCountry.Flush;
begin
  inherited;
  FController.Flush;
end;

procedure TfrmParamCountry.Load;
begin
  FCountrys := FController.GetAll;

  dtsMain.SetSourceList(FCountrys);
  dtsMain.Active := True;
end;

end.
