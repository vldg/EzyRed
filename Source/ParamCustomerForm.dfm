inherited frmParamCustomer: TfrmParamCustomer
  Caption = 'frmParamCustomer'
  ClientWidth = 654
  ExplicitWidth = 670
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 654
    ExplicitWidth = 654
    object ledtName: TLabeledEdit
      Left = 48
      Top = 24
      Width = 121
      Height = 21
      EditLabel.Width = 21
      EditLabel.Height = 13
      EditLabel.Caption = 'Nom'
      TabOrder = 0
    end
    object ledtFirstName: TLabeledEdit
      Left = 175
      Top = 24
      Width = 121
      Height = 21
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Pr'#233'nom'
      TabOrder = 1
    end
    object ledtZipCode: TLabeledEdit
      Left = 302
      Top = 24
      Width = 75
      Height = 21
      EditLabel.Width = 57
      EditLabel.Height = 13
      EditLabel.Caption = 'Code postal'
      TabOrder = 2
    end
  end
  inherited dpTop: TAdvDockPanel
    Width = 654
    ExplicitWidth = 654
  end
  inherited dbag: TDBAdvGrid
    Width = 654
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
        Name = 'FirstName'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'Address'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ZipCode'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'City'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Phone'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'CellPhone'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Email'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Account'
        DataType = ftString
        Size = 17
      end
      item
        Name = 'C_ID'
        DataType = ftVariant
      end
      item
        Name = 'T_ID'
        DataType = ftVariant
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
      DisplayLabel = 'Nom'
      FieldName = 'Name'
      Size = 32
    end
    object dtsMainFirstName: TStringField
      DisplayLabel = 'Pr'#233'nom'
      FieldName = 'FirstName'
      Size = 32
    end
    object dtsMainAddress: TStringField
      DisplayLabel = 'Adresse'
      FieldName = 'Address'
      Size = 255
    end
    object dtsMainZipCode: TStringField
      DisplayLabel = 'Code postal'
      FieldName = 'ZipCode'
      Size = 10
    end
    object dtsMainCity: TStringField
      DisplayLabel = 'Ville'
      FieldName = 'City'
      Size = 25
    end
    object dtsMainPhone: TStringField
      DisplayLabel = 'T'#233'l'#233'phone'
      FieldName = 'Phone'
      Size = 14
    end
    object dtsMainCellPhone: TStringField
      DisplayLabel = 'Mobile'
      FieldName = 'CellPhone'
      Size = 14
    end
    object dtsMainEmail: TStringField
      FieldName = 'Email'
      Size = 80
    end
    object dtsMainAccount: TStringField
      DisplayLabel = 'Compte'
      FieldName = 'Account'
      Size = 17
    end
    object dtsMainC_ID: TAureliusEntityField
      FieldName = 'C_ID'
      Visible = False
    end
    object dtsMainT_ID: TAureliusEntityField
      FieldName = 'T_ID'
      Visible = False
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = dtsMain
    ScopeMappings = <>
    Left = 200
    Top = 192
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 28
    Top = 189
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
      FieldName = 'FirstName'
      Control = ledtFirstName
      Track = True
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Liaisons rapides'
      DataSource = BindSourceDB1
      FieldName = 'ZipCode'
      Control = ledtZipCode
      Track = True
    end
  end
end
