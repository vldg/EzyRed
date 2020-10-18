object dmdMain: TdmdMain
  OldCreateOrder = False
  Height = 206
  Width = 367
  object dbMain: TFDConnection
    Params.Strings = (
      'Database=F:\Software\EzyRed\Data\RESIDENCE.FDB'
      'User_Name=ADMIN'
      'Password=admin'
      'CharacterSet=UTF8'
      'DriverID=FB')
    LoginDialog = FDGUIxLoginDialog1
    LoginPrompt = False
    Left = 56
    Top = 40
  end
  object transRead: TFDTransaction
    Connection = dbMain
    Left = 168
    Top = 40
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 272
    Top = 40
  end
  object FDGUIxLoginDialog1: TFDGUIxLoginDialog
    Provider = 'Forms'
    Left = 56
    Top = 112
  end
end
