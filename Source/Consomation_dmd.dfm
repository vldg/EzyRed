object dmdConsomation: TdmdConsomation
  OldCreateOrder = False
  Height = 271
  Width = 215
  object qryDateList: TFDQuery
    Connection = dmdMain.dbMain
    SQL.Strings = (
      'SELECT DISTINCT CV.COV_DATE '
      'FROM CONSOMATION_VALUE CV'
      'JOIN RESIDENCE_LOT RL ON (CV.REL_ID = RL.REL_ID)'
      'JOIN RESIDENCE_ADDRESS RA ON (RA.REA_ID = RL.REA_ID)'
      'WHERE RA.RE_ID =:RE_ID'
      '')
    Left = 88
    Top = 56
    ParamData = <
      item
        Name = 'RE_ID'
        ParamType = ptInput
      end>
  end
  object qryConsoDate: TFDQuery
    Connection = dmdMain.dbMain
    SQL.Strings = (
      'SELECT RL.*, CV.COV_VALUE, CV.COT_ID, CV.COV_DATE, CV.COV_ID'
      'FROM RESIDENCE_LOT RL'
      
        'LEFT OUTER JOIN RESIDENCE_ADDRESS REA ON (REA.REA_ID = RL.REA_ID' +
        ')'
      
        'LEFT OUTER JOIN CONSOMATION_VALUE CV ON (RL.REL_ID = CV.REL_ID A' +
        'ND CV.COV_DATE =:COV_DATE)'
      'WHERE REA.RE_ID =:RE_ID '
      'ORDER BY REA.REA_ADDRESS, RL.REL_NUMBER')
    Left = 88
    Top = 120
    ParamData = <
      item
        Name = 'COV_DATE'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = '01/07/2013'
      end
      item
        Name = 'RE_ID'
        ParamType = ptInput
      end>
  end
  object qryGetConsomationDate: TFDQuery
    Connection = dmdMain.dbMain
    SQL.Strings = (
      'SELECT'
      '   CV.COV_VALUE'
      'FROM CONSOMATION_VALUE CV'
      'WHERE CV.COV_DATE =:COV_DATE'
      'AND CV.COT_ID =:COT_ID'
      'AND CV.REL_ID =:REL_ID')
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
