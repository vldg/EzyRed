unit Main_dmd;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Comp.Client, Data.DB, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Login;

type
  TdmdMain = class(TDataModule)
    dbMain: TFDConnection;
    transRead: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDGUIxLoginDialog1: TFDGUIxLoginDialog;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    constructor Create(AOwner: TComponent); override;
  end;

var
  dmdMain: TdmdMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses forms;

{ TdmdMain }

constructor TdmdMain.Create(AOwner: TComponent);
begin
  inherited;
//  dbMain.Params.Values['user_name'] := 'ADMIN';
//  dbMain.Params.Values['Password'] := 'admin';
//  dbMain.Params.Values['database'] := ExtractFilePath(Application.ExeName) + 'LacourAppsDB.fdb';
end;

end.
