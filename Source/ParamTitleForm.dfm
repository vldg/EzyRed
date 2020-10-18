inherited frmParamTitle: TfrmParamTitle
  Caption = 'frmParamTitle'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    object ledtName: TLabeledEdit
      Left = 8
      Top = 24
      Width = 257
      Height = 21
      EditLabel.Width = 21
      EditLabel.Height = 13
      EditLabel.Caption = 'Nom'
      TabOrder = 0
    end
    object ledtSmallName: TLabeledEdit
      Left = 270
      Top = 24
      Width = 139
      Height = 21
      EditLabel.Width = 25
      EditLabel.Height = 13
      EditLabel.Caption = 'Code'
      TabOrder = 1
    end
  end
  inherited dbag: TDBAdvGrid
    ExplicitLeft = 0
    ExplicitTop = 42
    ExplicitWidth = 418
    ExplicitHeight = 214
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
    object dtsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object dtsMainID: TIntegerField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object dtsMainName: TStringField
      FieldName = 'Name'
      Size = 32
    end
    object dtsMainSmallName: TStringField
      FieldName = 'SmallName'
      Size = 10
    end
  end
  object BindSourceDB1: TBindSourceDB [4]
    DataSet = dtsMain
    ScopeMappings = <>
    Left = 200
    Top = 192
  end
  object BindingsList1: TBindingsList [5]
    Methods = <>
    OutputConverters = <>
    Left = 52
    Top = 77
    object LinkControlToField1: TLinkControlToField
      Category = 'Liaisons rapides'
      DataSource = BindSourceDB1
      FieldName = 'Name'
      Control = ledtName
      Track = True
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Liaisons rapides'
      DataSource = BindSourceDB1
      FieldName = 'SmallName'
      Control = ledtSmallName
      Track = True
    end
  end
end
