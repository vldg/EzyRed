program Residence;

uses
  Vcl.Forms,
  Main_frm in 'Main_frm.pas' {frmMain},
  Main_dmd in 'Main_dmd.pas' {dmdMain: TDataModule},
  Report_dmd in 'Report_dmd.pas' {dmdReport: TDataModule},
  Consomation_frm in 'Consomation_frm.pas' {frmConsomation},
  Consomation_dmd in 'Consomation_dmd.pas' {dmdConsomation: TDataModule},
  Consomation_unt in 'Consomation_unt.pas',
  Olap_frm in 'Olap_frm.pas' {frmOlap},
  Controller.Title in 'Controllers\Controller.Title.pas',
  UI.VCL.Form in 'UI.VCL.Form.pas' {CoreForm},
  UI.VCL.ParamForm in 'UI.VCL.ParamForm.pas' {frmParamForm},
  UI.VCL.ParamTitleForm in 'UI.VCL.ParamTitleForm.pas' {frmParamTitle},
  UI.VCL.ParamCustomerForm in 'UI.VCL.ParamCustomerForm.pas' {frmParamCustomer},
  Controller.Customer in 'Controllers\Controller.Customer.pas',
  Controller.Residence in 'Controllers\Controller.Residence.pas',
  Controller.CoreObject in 'Controllers\Controller.CoreObject.pas',
  DBConnection in 'DBConnection.pas',
  UI.VCL.ParamResidenceForm in 'UI.VCL.ParamResidenceForm.pas' {frmParamResidence},
  Controller.Country in 'Controllers\Controller.Country.pas',
  UI.VCL.ParamCountry in 'UI.VCL.ParamCountry.pas' {frmParamCountry},
  Controller.ResidenceLot in 'Controllers\Controller.ResidenceLot.pas',
  UI.VCL.ParamResidenceLotForm in 'UI.VCL.ParamResidenceLotForm.pas' {frmParamResidenceLot},
  Controller.ResidenceAddress in 'Controllers\Controller.ResidenceAddress.pas',
  UI.VCL.ParamResidenceAddressForm in 'UI.VCL.ParamResidenceAddressForm.pas' {frmParamResidenceAddress},
  Vcl.Themes,
  Vcl.Styles,
  Controller.LotEvent in 'Controllers\Controller.LotEvent.pas';

{$R *.res}

begin
  Application.Initialize;
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmdMain, dmdMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
