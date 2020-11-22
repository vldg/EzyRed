inherited frmParamLineKind: TfrmParamLineKind
  Caption = 'Param'#233'trage des cl'#233's de r'#233'partitions'
  ClientHeight = 413
  ClientWidth = 595
  ExplicitWidth = 611
  ExplicitHeight = 452
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Top = 240
    Width = 595
    Height = 173
    ExplicitTop = 240
    ExplicitWidth = 595
    ExplicitHeight = 173
    object lblName: TLabel
      Left = 8
      Top = 16
      Width = 21
      Height = 13
      Caption = 'Nom'
      FocusControl = dbeName
    end
    object lblCode: TLabel
      Left = 257
      Top = 16
      Width = 25
      Height = 13
      Caption = 'Code'
      FocusControl = dbeCode
    end
    object lblResidence: TLabel
      Left = 332
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Entr'#233'e'
    end
    object dbeName: TDBEdit
      Left = 8
      Top = 32
      Width = 241
      Height = 21
      DataField = 'Name'
      DataSource = dsMain
      TabOrder = 0
    end
    object dbeCode: TDBEdit
      Left = 255
      Top = 32
      Width = 69
      Height = 21
      DataField = 'Code'
      DataSource = dsMain
      TabOrder = 1
    end
    object dbrgType: TDBRadioGroup
      Left = 8
      Top = 59
      Width = 259
      Height = 105
      Caption = 'Type'
      DataField = 'Type_'
      DataSource = dsMain
      Items.Strings = (
        'R'#233'partition par r'#233'sidence'
        'R'#233'partition par entr'#233'e'
        'R'#233'partition par lot'
        'R'#233'partition par lot et par consommation')
      TabOrder = 2
      Values.Strings = (
        '0'
        '1'
        '2'
        '3')
      OnChange = dbrgTypeChange
    end
    object dbeResidenceAddress: TDBLookupComboBox
      Left = 330
      Top = 32
      Width = 239
      Height = 21
      DataField = 'REA_ADDRESS'
      DataSource = dsMain
      TabOrder = 3
    end
    object btnParamKindLineLot: TButton
      Left = 360
      Top = 72
      Width = 193
      Height = 25
      Action = actParamKindLineLot
      TabOrder = 4
    end
  end
  inherited dpTop: TAdvDockPanel
    Width = 595
    ExplicitWidth = 595
  end
  inherited dbgMain: TDBGrid
    Width = 595
    Height = 198
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
      end
      item
        Name = 'Type_'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'RE_ID'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'REA_ID'
        Attributes = [faRequired]
        DataType = ftVariant
      end>
    AfterScroll = dtsMainAfterScroll
    OnNewRecord = dtsMainNewRecord
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
    object dtsMainType_: TIntegerField
      DisplayLabel = 'Type'
      FieldName = 'Type_'
      Required = True
    end
    object dtsMainRE_ID: TAureliusEntityField
      FieldName = 'RE_ID'
      Required = True
      Visible = False
    end
    object dtsMainREA_ID: TAureliusEntityField
      FieldName = 'REA_ID'
      Visible = False
    end
    object dtsMainREA_ADDRESS: TStringField
      DisplayLabel = 'Entr'#233'e'
      FieldKind = fkLookup
      FieldName = 'REA_ADDRESS'
      LookupDataSet = dtsResidenceAddress
      LookupKeyFields = 'Self'
      LookupResultField = 'Address'
      KeyFields = 'REA_ID'
      Size = 50
      Lookup = True
    end
  end
  inherited alMain: TActionList
    object actParamKindLineLot: TAction
      Caption = 'Param'#233'trage des lots'
      OnExecute = actParamKindLineLotExecute
    end
  end
  object dtsResidenceAddress: TAureliusDataset
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
    OnObjectInsert = dtsMainObjectInsert
    OnObjectUpdate = dtsMainObjectUpdate
    OnObjectRemove = dtsMainObjectRemove
    Left = 192
    Top = 136
    DesignClass = 'Core.ResidenceAddress.TResidenceAddress'
    object dtsResidenceAddressSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object dtsResidenceAddressID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object dtsResidenceAddressAddress: TStringField
      FieldName = 'Address'
      Required = True
      Size = 50
    end
  end
end
