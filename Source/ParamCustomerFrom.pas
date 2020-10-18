unit ParamCustomerFrom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ParamForm, Vcl.ExtCtrls, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid;

type
  TfrmParamCustomer = class(TfrmParamForm)
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmParamCustomer: TfrmParamCustomer;

implementation

{$R *.dfm}

end.
