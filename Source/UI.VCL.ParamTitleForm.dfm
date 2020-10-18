inherited frmParamTitle: TfrmParamTitle
  Caption = 'Param'#233'trage des titres'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 21
      Height = 13
      Caption = 'Nom'
      FocusControl = dbeT_NAME
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 25
      Height = 13
      Caption = 'Code'
      FocusControl = dbeT_SMALLNAME
    end
    object dbeT_NAME: TDBEdit
      Left = 8
      Top = 24
      Width = 392
      Height = 21
      DataField = 'Name'
      DataSource = dsMain
      TabOrder = 0
    end
    object dbeT_SMALLNAME: TDBEdit
      Left = 8
      Top = 72
      Width = 134
      Height = 21
      DataField = 'SmallName'
      DataSource = dsMain
      TabOrder = 1
    end
  end
  inherited dtsMain: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'SmallName'
        DataType = ftString
        Size = 10
      end>
    OnCreateObject = dtsMainCreateObject
    object dtsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object dtsMainID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object dtsMainName: TStringField
      DisplayLabel = 'Nom'
      FieldName = 'Name'
      Size = 32
    end
    object dtsMainSmallName: TStringField
      DisplayLabel = 'Code'
      FieldName = 'SmallName'
      Size = 10
    end
  end
end
