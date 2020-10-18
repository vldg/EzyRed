object dmdConsomation: TdmdConsomation
  OldCreateOrder = False
  Height = 271
  Width = 215
  object qryDateList: TFDQuery
    Connection = dmdMain.dbMain
    SQL.Strings = (
      'SELECT DISTINCT COV_DATE FROM CONSOMATION_VALUE')
    Left = 88
    Top = 56
  end
  object qryConsoDate: TFDQuery
    Connection = dmdMain.dbMain
    SQL.Strings = (
      'SELECT RL.*, CV.COV_VALUE, CV.COT_ID, CV.COV_DATE, CV.COV_ID '
      'FROM RESIDENCE_LOT RL'
      
        'LEFT OUTER JOIN RESIDENCE_ADDRESS REA ON (REA.REA_ID = RL.REA_ID' +
        ')'
      
        'LEFT OUTER JOIN CONSOMATION_VALUE CV ON (RL.REL_ID = CV.REL_ID A' +
        'ND CV.COV_DATE =:COV_DATE)'
      'ORDER BY REA.REA_ADDRESS, RL.REL_NUMBER')
    Left = 88
    Top = 120
    ParamData = <
      item
        Name = 'COV_DATE'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = '01/07/2013'
      end>
  end
  object qryGetConsomationDate: TFDQuery
    Connection = dmdMain.dbMain
    SQL.Strings = (
      'SELECT'
      '   COV_VALUE'
      'FROM CONSOMATION_VALUE'
      'WHERE COV_DATE =:COV_DATE'
      'AND COT_ID =:COT_ID'
      'AND REL_ID =:REL_ID')
    Left = 96
    Top = 184
    ParamData = <
      item
        Name = 'COV_DATE'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'COT_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'REL_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
end
