inherited frmParamLineKind: TfrmParamLineKind
  Caption = 'Param'#233'trage des cl'#233's de r'#233'partitions'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 21
      Height = 13
      Caption = 'Nom'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 257
      Top = 16
      Width = 25
      Height = 13
      Caption = 'Code'
      FocusControl = DBEdit2
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 32
      Width = 241
      Height = 21
      DataField = 'Name'
      DataSource = dsMain
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 255
      Top = 32
      Width = 69
      Height = 21
      DataField = 'Code'
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
        Size = 30
      end
      item
        Name = 'Code'
        DataType = ftString
        Size = 5
      end>
    DesignClass = 'Core.LineKind.TLineKind'
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
      Size = 30
    end
    object dtsMainCode: TStringField
      FieldName = 'Code'
      Size = 5
    end
  end
end
