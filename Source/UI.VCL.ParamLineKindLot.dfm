inherited frmParamLineKindLot: TfrmParamLineKindLot
  Caption = 'Param'#233'trage des lots pour une cl'#233
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    object dbeResidenceLot: TDBLookupComboBox
      Left = 12
      Top = 40
      Width = 239
      Height = 21
      DataField = 'REL_NUMBER'
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
        Name = 'LK_ID'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'REL_ID'
        Attributes = [faRequired]
        DataType = ftVariant
      end>
    OnNewRecord = dtsMainNewRecord
    DesignClass = 'Core.LineKindLot.TLineKindLot'
    object dtsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object dtsMainID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object dtsMainLK_ID: TAureliusEntityField
      FieldName = 'LK_ID'
      Required = True
      Visible = False
    end
    object dtsMainREL_ID: TAureliusEntityField
      FieldName = 'REL_ID'
      Visible = False
    end
    object dtsMainREL_NUMBER: TStringField
      DisplayLabel = 'N'#176' lot'
      FieldKind = fkLookup
      FieldName = 'REL_NUMBER'
      LookupDataSet = dtsResidenceLot
      LookupKeyFields = 'Self'
      LookupResultField = 'Number'
      KeyFields = 'REL_ID'
      Size = 12
      Lookup = True
    end
  end
  object dtsResidenceLot: TAureliusDataset
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
        Name = 'Number'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Type_'
        DataType = ftInteger
      end
      item
        Name = 'Floor'
        DataType = ftInteger
      end
      item
        Name = 'WaterMeter'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Tantieme'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'REA_ID'
        Attributes = [faRequired]
        DataType = ftVariant
      end>
    OnObjectInsert = dtsMainObjectInsert
    OnObjectUpdate = dtsMainObjectUpdate
    OnObjectRemove = dtsMainObjectRemove
    Left = 192
    Top = 136
    DesignClass = 'Core.ResidenceLot.TResidenceLot'
    object dtsResidenceLotSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object dtsResidenceLotID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object dtsResidenceLotNumber: TStringField
      DisplayLabel = 'N'#176' de lot'
      FieldName = 'Number'
      Size = 12
    end
  end
end
