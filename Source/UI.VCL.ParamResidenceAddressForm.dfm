inherited frmParamResidenceAddress: TfrmParamResidenceAddress
  Caption = 'Param'#233'trage des adresses'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    object lblAddress: TLabel
      Left = 12
      Top = 6
      Width = 21
      Height = 13
      Caption = 'Nom'
    end
    object dbeAddress: TDBEdit
      Left = 12
      Top = 25
      Width = 263
      Height = 21
      DataField = 'Address'
      DataSource = dsMain
      TabOrder = 0
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 208
      Top = 80
      Width = 145
      Height = 21
      DataField = 'RE_NAME'
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
        Name = 'Address'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ZipCode'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'City'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RE_ID'
        Attributes = [faRequired]
        DataType = ftVariant
      end>
    OnNewRecord = dtsMainNewRecord
    DesignClass = 'Core.ResidenceAddress.TResidenceAddress'
    object dtsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object dtsMainID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object dtsMainAddress: TStringField
      DisplayLabel = 'Adresse'
      FieldName = 'Address'
      Required = True
      Size = 50
    end
    object dtsMainZipCode: TStringField
      DisplayLabel = 'Code Postal'
      FieldName = 'ZipCode'
      Size = 10
    end
    object dtsMainCity: TStringField
      DisplayLabel = 'Ville'
      FieldName = 'City'
      Size = 30
    end
    object dtsMainRE_ID: TAureliusEntityField
      FieldName = 'RE_ID'
      Visible = False
    end
    object dtsMainRE_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'RE_NAME'
      LookupDataSet = dtsResidence
      LookupKeyFields = 'Self'
      LookupResultField = 'Name'
      KeyFields = 'RE_ID'
      Visible = False
      Size = 50
      Lookup = True
    end
  end
  object dtsResidence: TAureliusDataset
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
    Left = 192
    Top = 144
    DesignClass = 'Core.Residence.TResidence'
    object dtsResidenceSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object dtsResidenceID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object dtsResidenceName: TStringField
      FieldName = 'Name'
      Size = 40
    end
  end
end
