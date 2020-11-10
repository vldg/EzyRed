inherited frmParamCustomer: TfrmParamCustomer
  Caption = 'Param'#233'trage des clients'
  ClientHeight = 418
  ClientWidth = 691
  ExplicitWidth = 707
  ExplicitHeight = 457
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Top = 200
    Width = 691
    Height = 218
    ExplicitTop = 200
    ExplicitWidth = 691
    ExplicitHeight = 218
    object lblT_NAME: TLabel
      Left = 3
      Top = 8
      Width = 22
      Height = 13
      Caption = 'Titre'
    end
    object lblCU_NAME: TLabel
      Left = 123
      Top = 8
      Width = 21
      Height = 13
      Caption = 'Nom'
      FocusControl = dbeCU_NAME
    end
    object lblCU_FIRSTNAME: TLabel
      Left = 373
      Top = 9
      Width = 36
      Height = 13
      Caption = 'Pr'#233'nom'
      FocusControl = dbeCU_FIRSTNAME
    end
    object lblAddress: TLabel
      Left = 3
      Top = 51
      Width = 39
      Height = 13
      Caption = 'Adresse'
    end
    object lblZipCode: TLabel
      Left = 201
      Top = 64
      Width = 57
      Height = 13
      Caption = 'Code postal'
      FocusControl = dbeZipCode
    end
    object lblCity: TLabel
      Left = 341
      Top = 64
      Width = 18
      Height = 13
      Caption = 'Ville'
      FocusControl = dbeCity
    end
    object lblPhone: TLabel
      Left = 200
      Top = 112
      Width = 50
      Height = 13
      Caption = 'T'#233'l'#233'phone'
      FocusControl = dbePhone
    end
    object lblCellPhone: TLabel
      Left = 392
      Top = 112
      Width = 30
      Height = 13
      Caption = 'Mobile'
      FocusControl = dbeCellPhone
    end
    object lblEmail: TLabel
      Left = 200
      Top = 160
      Width = 24
      Height = 13
      Caption = 'Email'
      FocusControl = dbeEmail
    end
    object dblcbTitle: TDBLookupComboBox
      Left = 3
      Top = 24
      Width = 114
      Height = 21
      DataField = 'T_CODE'
      DataSource = dsMain
      KeyField = 'Self'
      ListField = 'SmallName'
      ListSource = dsTitles
      TabOrder = 0
    end
    object dbeCU_NAME: TDBEdit
      Left = 121
      Top = 24
      Width = 246
      Height = 21
      DataField = 'Name'
      DataSource = dsMain
      TabOrder = 1
    end
    object dbeCU_FIRSTNAME: TDBEdit
      Left = 372
      Top = 24
      Width = 218
      Height = 21
      DataField = 'FirstName'
      DataSource = dsMain
      TabOrder = 2
    end
    object dbmAddress: TDBMemo
      Left = 3
      Top = 67
      Width = 185
      Height = 54
      DataField = 'Address'
      DataSource = dsMain
      TabOrder = 3
    end
    object dbeZipCode: TDBEdit
      Left = 201
      Top = 80
      Width = 134
      Height = 21
      DataField = 'ZipCode'
      DataSource = dsMain
      TabOrder = 4
    end
    object dbeCity: TDBEdit
      Left = 341
      Top = 80
      Width = 329
      Height = 21
      DataField = 'City'
      DataSource = dsMain
      TabOrder = 5
    end
    object dbePhone: TDBEdit
      Left = 200
      Top = 128
      Width = 186
      Height = 21
      DataField = 'Phone'
      DataSource = dsMain
      TabOrder = 6
    end
    object dbeCellPhone: TDBEdit
      Left = 392
      Top = 128
      Width = 186
      Height = 21
      DataField = 'CellPhone'
      DataSource = dsMain
      TabOrder = 7
    end
    object dbeEmail: TDBEdit
      Left = 200
      Top = 176
      Width = 1044
      Height = 21
      DataField = 'Email'
      DataSource = dsMain
      TabOrder = 8
    end
  end
  inherited dpTop: TAdvDockPanel
    Width = 691
    ExplicitWidth = 691
  end
  inherited dbgMain: TDBGrid
    Width = 691
    Height = 158
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
    end
    object dtsMainT_CODE: TStringField
      FieldKind = fkLookup
      FieldName = 'T_CODE'
      LookupDataSet = dtsTitles
      LookupKeyFields = 'Self'
      LookupResultField = 'SmallName'
      KeyFields = 'T_ID'
      Size = 10
      Lookup = True
    end
    object dtsMainT_IDSmallName: TStringField
      FieldName = 'T_ID.SmallName'
      Size = 15
    end
  end
  object dtsTitles: TAureliusDataset [5]
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
    OnObjectInsert = dtsMainObjectInsert
    OnObjectUpdate = dtsMainObjectUpdate
    OnObjectRemove = dtsMainObjectRemove
    Left = 344
    Top = 80
    object dtsTitlesSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object dtsTitlesID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object dtsTitlesName: TStringField
      FieldName = 'Name'
      Size = 32
    end
    object dtsTitlesSmallName: TStringField
      FieldName = 'SmallName'
      Size = 10
    end
  end
  object dsTitles: TDataSource [6]
    DataSet = dtsTitles
    Left = 440
    Top = 80
  end
end
