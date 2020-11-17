object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'EzyRed'
  ClientHeight = 243
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object btnDesign: TButton
    Left = 96
    Top = 19
    Width = 145
    Height = 25
    Action = actDesignReport
    TabOrder = 0
  end
  object Button2: TButton
    Left = 8
    Top = 19
    Width = 75
    Height = 25
    Action = actConsomation
    TabOrder = 1
  end
  object dpTop: TAdvDockPanel
    Left = 0
    Top = 0
    Width = 418
    Height = 13
    MinimumSize = 3
    LockHeight = False
    Persistence.Location = plRegistry
    Persistence.Enabled = False
    UseRunTimeHeight = False
    Version = '6.7.1.4'
  end
  object sbMain: TAdvOfficeStatusBar
    Left = 0
    Top = 224
    Width = 418
    Height = 19
    AnchorHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Panels = <
      item
        AppearanceStyle = psLight
        DateFormat = 'dd/MM/yyyy'
        Progress.BackGround = clNone
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        Text = 'TOTO'
        TimeFormat = 'hh:mm:ss'
        Width = 80
      end
      item
        AppearanceStyle = psLight
        DateFormat = 'dd/MM/yyyy'
        Progress.BackGround = clNone
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        Text = 'TITI'
        TimeFormat = 'hh:mm:ss'
        Width = 100
      end
      item
        AppearanceStyle = psLight
        DateFormat = 'dd/MM/yyyy'
        Progress.BackGround = clNone
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        TimeFormat = 'hh:mm:ss'
        Width = 130
      end
      item
        AppearanceStyle = psLight
        DateFormat = 'dd/MM/yyyy'
        Progress.BackGround = clNone
        Progress.Indication = piPercentage
        Progress.Min = 0
        Progress.Max = 100
        Progress.Position = 0
        Progress.Level0Color = clLime
        Progress.Level0ColorTo = 14811105
        Progress.Level1Color = clYellow
        Progress.Level1ColorTo = 13303807
        Progress.Level2Color = 5483007
        Progress.Level2ColorTo = 11064319
        Progress.Level3Color = clRed
        Progress.Level3ColorTo = 13290239
        Progress.Level1Perc = 70
        Progress.Level2Perc = 90
        Progress.BorderColor = clBlack
        Progress.ShowBorder = False
        Progress.Stacked = False
        TimeFormat = 'hh:mm:ss'
        Width = 50
      end>
    ShowSplitter = True
    SimplePanel = False
    UseSystemFont = False
    Version = '1.7.2.2'
  end
  object alMain: TActionList
    Left = 40
    Top = 64
    object actConsomation: TAction
      Caption = 'Consomation'
      OnExecute = actConsomationExecute
    end
    object actDesignReport: TAction
      Caption = 'Param'#233'trage des '#233'ditions'
      OnExecute = actDesignReportExecute
    end
    object actParamTitle: TAction
      Category = 'Param'
      Caption = 'Param'#233'trage des titres'
      OnExecute = actParamTitleExecute
    end
    object actParamCustomer: TAction
      Category = 'Param'
      Caption = 'Param'#233'trage des clients'
      OnExecute = actParamCustomerExecute
    end
    object actFileExit: TFileExit
      Category = 'Fichier'
      Caption = '&Quitter'
      Hint = 'Quitter|Quitte l'#39'application'
      ImageIndex = 43
      OnHint = actFileExitHint
    end
    object actParamResidence: TAction
      Category = 'Param'
      Caption = 'Param'#233'trage des r'#233'sidences'
      OnExecute = actParamResidenceExecute
    end
    object actParamCountry: TAction
      Category = 'Param'
      Caption = 'Param'#233'trage des pays'
      OnExecute = actParamCountryExecute
    end
    object actParamResidenceLot: TAction
      Category = 'Param'
      Caption = 'Param'#233'trage des lots'
      OnExecute = actParamResidenceLotExecute
    end
    object actParamResidenceAddress: TAction
      Category = 'Param'
      Caption = 'Param'#233'trage des adresses'
      OnExecute = actParamResidenceAddressExecute
    end
    object actStatCube: TAction
      Category = 'StatCube'
      Caption = 'Statistique consomation eau'
      OnExecute = actStatCubeExecute
    end
    object actPrintResidence: TAction
      Category = 'Print'
      Caption = 'Impression des propri'#233'taires'
      OnExecute = actPrintResidenceExecute
    end
    object actPrintRentKit: TAction
      Category = 'Print'
      Caption = 'Impression d'#39'un kit de location'
      OnExecute = actPrintRentKitExecute
    end
    object actBankAccountLine: TAction
      Caption = 'Saisie des lignes de comptes'
      OnExecute = actBankAccountLineExecute
    end
    object actParamLineKind: TAction
      Category = 'Param'
      Caption = 'Param'#233'trage des types de ligne'
      OnExecute = actParamLineKindExecute
    end
  end
  object mmMain: TAdvMainMenu
    Version = '2.7.1.1'
    Left = 280
    Top = 8
    object miFile: TMenuItem
      Caption = '&Fichier'
      object miFileExit: TMenuItem
        Action = actFileExit
      end
    end
    object miParam: TMenuItem
      Caption = '&Param'#233'trage'
      object miParamTitle: TMenuItem
        Action = actParamTitle
      end
      object miParamCustomer: TMenuItem
        Action = actParamCustomer
      end
      object miParamResidence: TMenuItem
        Action = actParamResidence
      end
      object miParamResidenceAddress: TMenuItem
        Action = actParamResidenceAddress
      end
      object miParamResidenceLot: TMenuItem
        Action = actParamResidenceLot
      end
      object miParamCountry: TMenuItem
        Action = actParamCountry
      end
      object miBankAccountLine: TMenuItem
        Action = actBankAccountLine
      end
      object miParamLineKind: TMenuItem
        Action = actParamLineKind
      end
    end
    object miPrint: TMenuItem
      Caption = '&Impression'
      object MiPrintResidence: TMenuItem
        Action = actPrintResidence
      end
      object miPrintRentKit: TMenuItem
        Action = actPrintRentKit
      end
    end
    object miStat: TMenuItem
      Caption = '&Statistiques'
      object miStatCube: TMenuItem
        Action = actStatCube
      end
    end
  end
end
