inherited frmParamLotEvent: TfrmParamLotEvent
  Caption = 'Param'#233'trage du propri'#233'taire d'#39'un lot'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    object dblcbCustomers: TDBLookupComboBox
      Left = 12
      Top = 32
      Width = 145
      Height = 21
      DataField = 'CU_NAME'
      DataSource = dsMain
      ListField = 'Name'
      ListSource = dsCustomers
      TabOrder = 0
    end
    object dbdtStart: TAdvDBDateTimePicker
      Left = 192
      Top = 32
      Width = 81
      Height = 21
      Date = 44144.000000000000000000
      Format = ''
      Time = 0.492615740738983700
      DoubleBuffered = True
      Kind = dkDate
      ParentDoubleBuffered = False
      TabOrder = 1
      BorderStyle = bsSingle
      Ctl3D = True
      DateTime = 44144.492615740740000000
      Version = '1.3.5.2'
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      DataField = 'DTStart'
      DataSource = dsMain
    end
    object dbdtEnd: TAdvDBDateTimePicker
      Left = 284
      Top = 32
      Width = 81
      Height = 21
      Date = 44144.000000000000000000
      Format = ''
      Time = 0.492615740738983700
      DoubleBuffered = True
      Kind = dkDate
      ParentDoubleBuffered = False
      TabOrder = 2
      BorderStyle = bsSingle
      Ctl3D = True
      DateTime = 44144.492615740740000000
      Version = '1.3.5.2'
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      DataField = 'DTEnd'
      DataSource = dsMain
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
        Name = 'DTStart'
        DataType = ftDateTime
      end
      item
        Name = 'DTEnd'
        DataType = ftDateTime
      end
      item
        Name = 'Type_'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CU_ID'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'REL_ID'
        Attributes = [faRequired]
        DataType = ftVariant
      end>
    OnNewRecord = dtsMainNewRecord
    DesignClass = 'Core.LotEvent.TLotEvent'
    object dtsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object dtsMainID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object dtsMainDTStart: TDateTimeField
      DisplayLabel = 'Date achat'
      FieldName = 'DTStart'
    end
    object dtsMainDTEnd: TDateTimeField
      DisplayLabel = 'Date vente'
      FieldName = 'DTEnd'
    end
    object dtsMainType_: TIntegerField
      FieldName = 'Type_'
      Visible = False
    end
    object dtsMainCU_ID: TAureliusEntityField
      FieldName = 'CU_ID'
      Required = True
    end
    object dtsMainREL_ID: TAureliusEntityField
      FieldName = 'REL_ID'
      Required = True
      Visible = False
    end
    object dtsMainCU_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'CU_NAME'
      LookupDataSet = dtsCustomers
      LookupKeyFields = 'Self'
      LookupResultField = 'Name'
      KeyFields = 'CU_ID'
      Size = 32
      Lookup = True
    end
  end
  object dtsCustomers: TAureliusDataset
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
    Left = 192
    Top = 144
    DesignClass = 'Core.Customer.TCustomer'
    object dtsCustomersSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object dtsCustomersID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object dtsCustomersName: TStringField
      FieldName = 'Name'
      Size = 32
    end
    object dtsCustomersFirstName: TStringField
      FieldName = 'FirstName'
      Size = 32
    end
  end
  object dsCustomers: TDataSource
    DataSet = dtsCustomers
    Left = 264
    Top = 144
  end
end
