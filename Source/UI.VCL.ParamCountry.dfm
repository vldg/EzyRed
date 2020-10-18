inherited frmParamCountry: TfrmParamCountry
  Caption = 'Param'#233'trage des pays'
  ExplicitWidth = 434
  ExplicitHeight = 414
  PixelsPerInch = 96
  TextHeight = 13
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
        Name = 'ISO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 32
      end>
    DesignClass = 'Core.Country.TCountry'
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
    object dtsMainISO: TStringField
      DisplayLabel = 'Code ISO'
      FieldName = 'ISO'
      Size = 2
    end
  end
end
