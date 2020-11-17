unit Main_frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Consomation_frm, Olap_frm, Data.DB, Aurelius.Bind.Dataset,
  Vcl.StdActns, Vcl.Menus, AdvMenus, AdvToolBar, AdvOfficeStatusBar,
  Core.Residence;

type
  TfrmMain = class(TForm)
    btnDesign: TButton;
    alMain: TActionList;
    actConsomation: TAction;
    Button2: TButton;
    actDesignReport: TAction;
    actParamTitle: TAction;
    actParamCustomer: TAction;
    dpTop: TAdvDockPanel;
    mmMain: TAdvMainMenu;
    miFile: TMenuItem;
    actFileExit: TFileExit;
    miFileExit: TMenuItem;
    miParam: TMenuItem;
    miParamTitle: TMenuItem;
    miParamCustomer: TMenuItem;
    actParamResidence: TAction;
    miParamResidence: TMenuItem;
    actParamCountry: TAction;
    miParamCountry: TMenuItem;
    actParamResidenceLot: TAction;
    miParamResidenceLot: TMenuItem;
    actParamResidenceAddress: TAction;
    miParamResidenceAddress: TMenuItem;
    sbMain: TAdvOfficeStatusBar;
    miStat: TMenuItem;
    actStatCube: TAction;
    miStatCube: TMenuItem;
    miPrint: TMenuItem;
    actPrintResidence: TAction;
    MiPrintResidence: TMenuItem;
    actPrintRentKit: TAction;
    miPrintRentKit: TMenuItem;
    actBankAccountLine: TAction;
    miBankAccountLine: TMenuItem;
    actParamLineKind: TAction;
    miParamLineKind: TMenuItem;
    procedure actConsomationExecute(Sender: TObject);
    procedure actDesignReportExecute(Sender: TObject);
    procedure actParamTitleExecute(Sender: TObject);
    procedure actParamCustomerExecute(Sender: TObject);
    procedure actFileExitHint(var HintStr: string; var CanShow: Boolean);
    procedure actParamResidenceExecute(Sender: TObject);
    procedure actParamCountryExecute(Sender: TObject);
    procedure actParamResidenceLotExecute(Sender: TObject);
    procedure actParamResidenceAddressExecute(Sender: TObject);
    procedure actStatCubeExecute(Sender: TObject);
    procedure actPrintResidenceExecute(Sender: TObject);
    procedure actPrintRentKitExecute(Sender: TObject);
    procedure actBankAccountLineExecute(Sender: TObject);
    procedure actParamLineKindExecute(Sender: TObject);
  private
    { Déclarations privées }
    procedure Load;
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Report_dmd, Main_dmd,
     Controller.Residence,
     UI.VCL.ParamTitleForm,
     UI.VCL.ParamCustomerForm,
     UI.VCL.ParamResidenceForm,
     UI.VCL.ParamResidenceAddressForm,
     UI.VCL.ParamResidenceLotForm,
     UI.VCL.ParamCountry,
     UI.VCL.BankAccountLineForm,
     UI.VCL.ParamLineKind;

procedure TfrmMain.actBankAccountLineExecute(Sender: TObject);
begin
  frmBankAccountLineForm := TfrmBankAccountLineForm.Create(Self);
  try
    frmBankAccountLineForm.ShowModal;
  finally
    frmBankAccountLineForm.Release;
  end;
end;

procedure TfrmMain.actConsomationExecute(Sender: TObject);
begin
  frmConsomation := TfrmConsomation.Create(Self);
  try
    frmConsomation.ShowModal;
  finally
    frmConsomation.Release;
  end;
end;

procedure TfrmMain.actDesignReportExecute(Sender: TObject);
begin
  TdmdReport.Design;
end;

procedure TfrmMain.actFileExitHint(var HintStr: string; var CanShow: Boolean);
begin
  Close;
end;

procedure TfrmMain.actParamCountryExecute(Sender: TObject);
begin
  frmParamCountry := TfrmParamCountry.Create(Self);
  try
    frmParamCountry.ShowModal;
  finally
    frmParamCountry.Release;
  end;
end;

procedure TfrmMain.actParamCustomerExecute(Sender: TObject);
begin
  frmParamCustomer := TfrmParamCustomer.Create(Self);
  try
    frmParamCustomer.ShowModal;
  finally
    frmParamCustomer.Release;
  end;
end;

procedure TfrmMain.actParamLineKindExecute(Sender: TObject);
begin
  frmParamLineKind := TfrmParamLineKind.Create(Self);
  try
    frmParamLineKind.ShowModal;
  finally
    frmParamLineKind.Release;
  end;
end;

procedure TfrmMain.actParamResidenceAddressExecute(Sender: TObject);
begin
  frmParamResidenceAddress := TfrmParamResidenceAddress.Create(Self);
  try
    frmParamResidenceAddress.ResidenceID := SelectedResidence.ID;
//    frmParamResidenceAddress.Residence := FSelectedResidence;
    frmParamResidenceAddress.ShowModal;
  finally
    frmParamResidenceAddress.Release;
  end;
end;

procedure TfrmMain.actParamResidenceExecute(Sender: TObject);
begin
  Load;
end;

procedure TfrmMain.actParamResidenceLotExecute(Sender: TObject);
begin
  frmParamResidenceLot := TfrmParamResidenceLot.Create(Self);
  try
    frmParamResidenceLot.ShowModal;
  finally
    frmParamResidenceLot.Release;
  end;
end;

procedure TfrmMain.actParamTitleExecute(Sender: TObject);
begin
  frmParamTitle := TfrmParamTitle.Create(Self);
  try
    frmParamTitle.ShowModal;
  finally
    frmParamTitle.Release;
  end;
end;

procedure TfrmMain.actPrintRentKitExecute(Sender: TObject);
begin
  TdmdReport.Preview('RentKit.fr3');
end;

procedure TfrmMain.actPrintResidenceExecute(Sender: TObject);
begin
  TdmdReport.Preview('Residence.fr3');
end;

procedure TfrmMain.actStatCubeExecute(Sender: TObject);
begin
  frmOlap := TfrmOlap.Create(Self);
  try
    frmOlap.ShowModal;
  finally
    frmOlap.Release;
  end;
end;

constructor TfrmMain.Create(AOwner: TComponent);
begin
  inherited;
  Load;
end;

destructor TfrmMain.Destroy;
begin
  inherited;
end;

procedure TfrmMain.Load;
begin
  SelectedResidence.Free;
  frmParamResidence := TfrmParamResidence.Create(Self);
  try
    if frmParamResidence.ShowModal = mrYes then
    begin
      SelectedResidence := TResidenceController.Get(frmParamResidence.SelectedID);
      sbMain.Panels[0].Text := SelectedResidence.Name;
      sbMain.Panels[0].AutoSize := True;
    end;
  finally
    frmParamResidence.Release;
  end;
end;

end.
