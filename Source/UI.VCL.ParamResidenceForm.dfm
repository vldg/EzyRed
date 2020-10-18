inherited frmParamResidence: TfrmParamResidence
  Caption = 'Param'#233'trage des r'#233'sidences'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    object Label1: TLabel
      Left = 12
      Top = 6
      Width = 21
      Height = 13
      Caption = 'Nom'
      FocusControl = dbeName
    end
    object dbeName: TDBEdit
      Left = 11
      Top = 25
      Width = 390
      Height = 21
      DataField = 'Name'
      DataSource = dsMain
      TabOrder = 0
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
        Size = 40
      end>
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
      Size = 40
    end
  end
end
