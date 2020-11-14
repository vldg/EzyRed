inherited frmBankAccountLineForm: TfrmBankAccountLineForm
  Caption = 'Ligne de compte'
  ClientWidth = 757
  ExplicitWidth = 773
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 757
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
      Top = 40
      Width = 145
      Height = 21
      DataField = 'CU_NAME'
      DataSource = dsMain
      ListField = 'Name'
      ListSource = dsCustomers
      TabOrder = 4
    end
  end
  inherited dpTop: TAdvDockPanel
    Width = 757
    ExplicitWidth = 757
  end
  inherited dbgMain: TDBGrid
    Width = 757
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
end
