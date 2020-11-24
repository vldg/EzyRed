inherited frmBankAccountLineForm: TfrmBankAccountLineForm
  Caption = 'Ligne de compte'
  ClientWidth = 844
  ExplicitWidth = 860
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 844
    ExplicitWidth = 757
    object lblLabel: TLabel
      Left = 8
      Top = 24
      Width = 29
      Height = 13
      Caption = 'Libell'#233
      FocusControl = dbeLabel
    end
    object lblCredit: TLabel
      Left = 8
      Top = 67
      Width = 29
      Height = 13
      Caption = 'Cr'#233'dit'
      FocusControl = dbeCredit
    end
    object lblDebit: TLabel
      Left = 148
      Top = 67
      Width = 25
      Height = 13
      Caption = 'D'#233'bit'
      FocusControl = dbeDebit
    end
    object lblDate: TLabel
      Left = 424
      Top = 24
      Width = 23
      Height = 13
      Caption = 'Date'
    end
    object lblName: TLabel
      Left = 512
      Top = 24
      Width = 21
      Height = 13
      Caption = 'Nom'
    end
    object dbeLabel: TDBEdit
      Left = 8
      Top = 40
      Width = 400
      Height = 21
      DataField = 'Label_'
      DataSource = dsMain
      TabOrder = 0
    end
    object dbeCredit: TDBEdit
      Left = 8
      Top = 83
      Width = 134
      Height = 21
      DataField = 'Credit'
      DataSource = dsMain
      TabOrder = 1
    end
    object dbeDebit: TDBEdit
      Left = 148
      Top = 83
      Width = 134
      Height = 21
      DataField = 'Debit'
      DataSource = dsMain
      TabOrder = 2
    end
    object dbdtDate: TAdvDBDateTimePicker
      Left = 424
      Top = 41
      Width = 81
      Height = 20
      Date = 44144.000000000000000000
      Format = ''
      Time = 0.492615740738983700
      DoubleBuffered = True
      Kind = dkDate
      ParentDoubleBuffered = False
      TabOrder = 3
      BorderStyle = bsSingle
      Ctl3D = True
      DateTime = 44144.492615740740000000
      Version = '1.3.5.2'
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      DataField = 'Date'
      DataSource = dsMain
    end
    object dblcbCustomers: TDBLookupComboBox
      Left = 511
      Top = 41
      Width = 145
      Height = 21
      DataField = 'CU_NAME'
      DataSource = dsMain
      ListField = 'Name'
      ListSource = dsCustomers
      TabOrder = 4
    end
    object dblcbLineKind: TDBLookupComboBox
      Left = 512
      Top = 80
      Width = 145
      Height = 21
      DataField = 'LK_NAME'
      DataSource = dsMain
      ListField = 'Name'
      ListSource = dsLineKind
      TabOrder = 5
    end
    object dblcbAccountingYear: TDBLookupComboBox
      Left = 663
      Top = 41
      Width = 145
      Height = 21
      DataField = 'AY_NAME'
      DataSource = dsMain
      ListField = 'Name'
      ListSource = dsAccountingYear
      TabOrder = 6
    end
  end
  inherited dpTop: TAdvDockPanel
    Width = 844
    ExplicitWidth = 757
  end
  inherited dbgMain: TDBGrid
    Width = 844
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
        Name = 'RE_ID'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'Date'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'Label_'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Credit'
        DataType = ftFloat
      end
      item
        Name = 'Debit'
        DataType = ftFloat
      end
      item
        Name = 'CU_ID'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'LK_ID'
        Attributes = [faRequired]
        DataType = ftVariant
      end
      item
        Name = 'AY_ID'
        Attributes = [faRequired]
        DataType = ftVariant
      end>
    OnNewRecord = dtsMainNewRecord
    DesignClass = 'Core.BankAccountLine.TBankAccountLine'
    object dtsMainSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
      Visible = False
    end
    object dtsMainID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object dtsMainRE_ID: TAureliusEntityField
      FieldName = 'RE_ID'
      Visible = False
    end
    object dtsMainDate: TDateTimeField
      DisplayWidth = 10
      FieldName = 'Date'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dtsMainLabel_: TStringField
      DisplayLabel = 'Libell'#233
      DisplayWidth = 120
      FieldName = 'Label_'
      Size = 255
    end
    object dtsMainCredit: TFloatField
      DisplayLabel = 'Cr'#233'dit'
      DisplayWidth = 8
      FieldName = 'Credit'
    end
    object dtsMainDebit: TFloatField
      DisplayLabel = 'D'#233'bit'
      DisplayWidth = 8
      FieldName = 'Debit'
    end
    object dtsMainCU_ID: TAureliusEntityField
      FieldName = 'CU_ID'
      Visible = False
    end
    object dtsMainCU_NAME: TStringField
      DisplayLabel = 'Tiers'
      FieldKind = fkLookup
      FieldName = 'CU_NAME'
      LookupDataSet = dtsCustomers
      LookupKeyFields = 'Self'
      LookupResultField = 'Name'
      KeyFields = 'CU_ID'
      Size = 32
      Lookup = True
    end
    object dtsMainLK_ID: TAureliusEntityField
      FieldName = 'LK_ID'
      Visible = False
    end
    object dtsMainLK_NAME: TStringField
      DisplayLabel = 'Cl'#233
      FieldKind = fkLookup
      FieldName = 'LK_NAME'
      LookupDataSet = dtsLineKind
      LookupKeyFields = 'Self'
      LookupResultField = 'Name'
      KeyFields = 'LK_ID'
      Size = 30
      Lookup = True
    end
    object dtsMainAY_ID: TAureliusEntityField
      FieldName = 'AY_ID'
      Visible = False
    end
    object dtsMainAY_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'AY_NAME'
      LookupDataSet = dtsAccountingYear
      LookupKeyFields = 'Self'
      LookupResultField = 'Name'
      KeyFields = 'AY_ID'
      Lookup = True
    end
  end
  object dsCustomers: TDataSource
    DataSet = dtsCustomers
    Left = 264
    Top = 144
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
  object dtsLineKind: TAureliusDataset
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
    Left = 192
    Top = 200
    DesignClass = 'Core.LineKind.TLineKind'
    object dtsLineKindSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object dtsLineKindID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object dtsLineKindName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object dtsLineKindCode: TStringField
      FieldName = 'Code'
      Size = 5
    end
  end
  object dsLineKind: TDataSource
    DataSet = dtsLineKind
    Left = 264
    Top = 200
  end
  object dtsAccountingYear: TAureliusDataset
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
        Size = 20
      end
      item
        Name = 'Date'
        DataType = ftDateTime
      end
      item
        Name = 'RE_ID'
        Attributes = [faRequired]
        DataType = ftVariant
      end>
    Left = 384
    Top = 80
    DesignClass = 'Core.AccountingYear.TAccountingYear'
    object dtsAccountingYearSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object dtsAccountingYearID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object dtsAccountingYearName: TStringField
      FieldName = 'Name'
    end
    object dtsAccountingYearDate: TDateTimeField
      FieldName = 'Date'
    end
    object dtsAccountingYearRE_ID: TAureliusEntityField
      FieldName = 'RE_ID'
      Required = True
    end
  end
  object dsAccountingYear: TDataSource
    DataSet = dtsAccountingYear
    Left = 496
    Top = 80
  end
end
