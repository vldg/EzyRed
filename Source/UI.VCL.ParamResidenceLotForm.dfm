inherited frmParamResidenceLot: TfrmParamResidenceLot
  Caption = 'Param'#233'trage des lots'
  ClientWidth = 562
  ExplicitWidth = 578
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 562
    ExplicitWidth = 562
    object lblNumber: TLabel
      Left = 8
      Top = 8
      Width = 67
      Height = 13
      Caption = 'Num'#233'ro de lot'
      FocusControl = dbeNumber
    end
    object lblFloor: TLabel
      Left = 174
      Top = 8
      Width = 28
      Height = 13
      Caption = 'Etage'
      FocusControl = dbeFloor
    end
    object lblTantieme: TLabel
      Left = 8
      Top = 56
      Width = 44
      Height = 13
      Caption = 'Tanti'#232'me'
      FocusControl = dbeTantieme
    end
    object lblResidence: TLabel
      Left = 316
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Entr'#233'e'
      FocusControl = dbeFloor
    end
    object dbeNumber: TDBEdit
      Left = 8
      Top = 24
      Width = 160
      Height = 21
      DataField = 'Number'
      DataSource = dsMain
      TabOrder = 0
    end
    object dbeFloor: TDBEdit
      Left = 174
      Top = 25
      Width = 134
      Height = 21
      DataField = 'Floor'
      DataSource = dsMain
      TabOrder = 1
    end
    object dbeTantieme: TDBEdit
      Left = 8
      Top = 72
      Width = 134
      Height = 21
      DataField = 'Tantieme'
      DataSource = dsMain
      TabOrder = 2
    end
    object dbchxWaterMeter: TDBCheckBox
      Left = 174
      Top = 72
      Width = 97
      Height = 17
      Caption = 'WaterMeter'
      DataField = 'WaterMeter'
      DataSource = dsMain
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbeResidence: TDBLookupComboBox
      Left = 314
      Top = 24
      Width = 239
      Height = 21
      DataField = 'REA_ADDRESS'
      DataSource = dsMain
      TabOrder = 4
    end
    object btnParamLotEvent: TButton
      Left = 360
      Top = 72
      Width = 193
      Height = 25
      Action = actParamLotEvent
      TabOrder = 5
    end
  end
  inherited dpTop: TAdvDockPanel
    Width = 562
    ExplicitWidth = 562
  end
  inherited dbgMain: TDBGrid
    Width = 562
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
    DesignClass = 'Core.ResidenceLot.TResidenceLot'
    object dtsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object dtsMainID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object dtsMainNumber: TStringField
      DisplayLabel = 'Num'#233'ro de lot'
      FieldName = 'Number'
      Size = 12
    end
    object dtsMainType_: TIntegerField
      FieldName = 'Type_'
    end
    object dtsMainFloor: TIntegerField
      DisplayLabel = 'Etage'
      FieldName = 'Floor'
    end
    object dtsMainWaterMeter: TIntegerField
      FieldName = 'WaterMeter'
      Required = True
    end
    object dtsMainTantieme: TIntegerField
      DisplayLabel = 'Tanti'#232'me'
      FieldName = 'Tantieme'
      Required = True
    end
    object dtsMainREA_ID: TAureliusEntityField
      FieldName = 'REA_ID'
      Required = True
      Visible = False
    end
    object dtsMainREA_ADDRESS: TStringField
      DisplayLabel = 'Entr'#233'e'
      FieldKind = fkLookup
      FieldName = 'REA_ADDRESS'
      LookupDataSet = dtsResidence
      LookupKeyFields = 'Self'
      LookupResultField = 'Address'
      KeyFields = 'REA_ID'
      Size = 50
      Lookup = True
    end
  end
  inherited alMain: TActionList
    inherited actEntityCopy: TAction
      OnExecute = actEntityCopyExecute
    end
    inherited actEntityPaste: TAction
      OnExecute = actEntityPasteExecute
    end
    object actParamLotEvent: TAction
      Caption = 'Param'#233'trage des propri'#233'taires'
      OnExecute = actParamLotEventExecute
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
    Left = 272
    Top = 192
    DesignClass = 'Core.ResidenceAddress.TResidenceAddress'
    object dtsResidenceSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object dtsResidenceID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object dtsResidenceAddress: TStringField
      FieldName = 'Address'
      Required = True
      Size = 50
    end
    object dtsResidenceZipCode: TStringField
      FieldName = 'ZipCode'
      Size = 10
    end
    object dtsResidenceCity: TStringField
      FieldName = 'City'
      Size = 30
    end
    object dtsResidenceRE_ID: TAureliusEntityField
      FieldName = 'RE_ID'
      Required = True
    end
  end
end
