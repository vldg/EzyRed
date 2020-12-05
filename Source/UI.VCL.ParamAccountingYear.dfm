inherited frmParamAccoutingYear: TfrmParamAccoutingYear
  Caption = 'Param'#233'trage des ann'#233'es comptables'
  ClientWidth = 480
  ExplicitWidth = 496
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 480
    object lblName: TLabel
      Left = 8
      Top = 13
      Width = 21
      Height = 13
      Caption = 'Nom'
      FocusControl = dbeName
    end
    object Label1: TLabel
      Left = 278
      Top = 13
      Width = 23
      Height = 13
      Caption = 'Date'
    end
    object dbeName: TDBEdit
      Left = 8
      Top = 29
      Width = 264
      Height = 21
      DataField = 'Name'
      DataSource = dsMain
      TabOrder = 0
    end
    object dbdtDate: TAdvDBDateTimePicker
      Left = 280
      Top = 29
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
      DataField = 'Date'
      DataSource = dsMain
    end
    object dbdtConsoDate: TAdvDBDateTimePicker
      Left = 367
      Top = 29
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
      DataField = 'ConsoDate'
      DataSource = dsMain
    end
  end
  inherited dpTop: TAdvDockPanel
    Width = 480
  end
  inherited dbgMain: TDBGrid
    Width = 480
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
        Size = 20
      end
      item
        Name = 'Date'
        DataType = ftDateTime
      end
      item
        Name = 'ConsoDate'
        DataType = ftDateTime
      end
      item
        Name = 'RE_ID'
        Attributes = [faRequired]
        DataType = ftVariant
      end>
    OnNewRecord = dtsMainNewRecord
    DesignClass = 'Core.AccountingYear.TAccountingYear'
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
    end
    object dtsMainDate: TDateTimeField
      FieldName = 'Date'
    end
    object dtsMainConsoDate: TDateTimeField
      DisplayLabel = 'Date de relev'#233
      FieldName = 'ConsoDate'
    end
    object dtsMainRE_ID: TAureliusEntityField
      FieldName = 'RE_ID'
      Required = True
      Visible = False
    end
  end
end
