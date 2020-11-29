object frmParamForm: TfrmParamForm
  Left = 0
  Top = 0
  ClientHeight = 375
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 256
    Width = 418
    Height = 119
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
  end
  object dpTop: TAdvDockPanel
    Left = 0
    Top = 0
    Width = 418
    Height = 42
    MinimumSize = 3
    LockHeight = False
    Persistence.Location = plRegistry
    Persistence.Enabled = False
    UseRunTimeHeight = False
    Version = '6.7.1.4'
    object tbNavigator: TAdvToolBar
      Left = 3
      Top = 1
      Width = 223
      Height = 27
      AllowFloating = True
      Caption = 'Navigateur'
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      CompactImageIndex = -1
      ShowRightHandle = False
      TextAutoOptionMenu = 'Add or Remove Buttons'
      TextOptionMenu = 'Options'
      ParentOptionPicture = True
      ToolBarIndex = -1
      object tbFirst: TDBAdvToolBarButton
        Left = 9
        Top = 2
        Width = 21
        Height = 23
        Hint = 'Premier enregistrement'
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -12
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        AutoDisable = True
        ConfirmAction = False
        DataSource = dsMain
        DBButtonType = dbtFirst
        DisableControl = [drBOF, drEditing, drEmpty]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000F07FFFFFF70FF000F07FFFF7000F
          F000F07FF700000FF000F0770000000FF000F07FF700000FF000F07FFFF7000F
          F000F07FFFFFF70FF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        GlyphDisabled.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000F87FFFFFF78FF000F87FFFF7888F
          F000F87FF788888FF000F8778888888FF000F87FF788888FF000F87FFFF7888F
          F000F87FFFFFF78FF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        ParentFont = False
        Position = daTop
        Version = '6.7.1.4'
      end
      object tbPrior: TDBAdvToolBarButton
        Left = 30
        Top = 2
        Width = 21
        Height = 23
        Hint = 'Enregistrement pr'#233'c'#233'dent'
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -12
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        AutoDisable = True
        ConfirmAction = False
        DataSource = dsMain
        DBButtonType = dbtPrior
        DisableControl = [drBOF, drEditing, drEmpty]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFF70FFF000FFFFFF7000FF
          F000FFFF700000FFF000FF70000000FFF000FFFF700000FFF000FFFFFF7000FF
          F000FFFFFFFF70FFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        GlyphDisabled.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFF78FFF000FFFFFF7888FF
          F000FFFF788888FFF000FF78888888FFF000FFFF788888FFF000FFFFFF7888FF
          F000FFFFFFFF78FFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        ParentFont = False
        Position = daTop
        Version = '6.7.1.4'
      end
      object tbNext: TDBAdvToolBarButton
        Left = 51
        Top = 2
        Width = 21
        Height = 23
        Hint = 'Enregistrement suivant'
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -12
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        AutoDisable = True
        ConfirmAction = False
        DataSource = dsMain
        DBButtonType = dbtNext
        DisableControl = [drEOF, drEditing, drEmpty]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFF07FFFFFFFF000FFF0007FFFFF
          F000FFF000007FFFF000FFF00000007FF000FFF000007FFFF000FFF0007FFFFF
          F000FFF07FFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        GlyphDisabled.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFF87FFFFFFFF000FFF8887FFFFF
          F000FFF888887FFFF000FFF88888887FF000FFF888887FFFF000FFF8887FFFFF
          F000FFF87FFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        ParentFont = False
        Position = daTop
        Version = '6.7.1.4'
      end
      object tbLast: TDBAdvToolBarButton
        Left = 72
        Top = 2
        Width = 21
        Height = 23
        Hint = 'Dernier enregistrement'
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -12
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        AutoDisable = True
        ConfirmAction = False
        DataSource = dsMain
        DBButtonType = dbtLast
        DisableControl = [drEOF, drEditing, drEmpty]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000F07FFFFFF70FF000F0007FFFF70F
          F000F000007FF70FF000F0000000770FF000F000007FF70FF000F0007FFFF70F
          F000F07FFFFFF70FF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        GlyphDisabled.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000F87FFFFFF88FF000F8887FFFF88F
          F000F888887FF88FF000F8888888888FF000F888887FF88FF000F8887FFFF88F
          F000F87FFFFFF88FF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        ParentFont = False
        Position = daTop
        Version = '6.7.1.4'
      end
      object tbInsert: TDBAdvToolBarButton
        Left = 93
        Top = 2
        Width = 21
        Height = 23
        Hint = 'Ins'#233'rer enregistrement'
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -12
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        AutoDisable = True
        ConfirmAction = False
        DataSource = dsMain
        DBButtonType = dbtInsert
        DisableControl = [drReadonly, drEditing]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFF000FFFFF000FFFFF000FFFFF000FFFFF000FFFF
          F000FF000000000FF000FF000000000FF000FF000000000FF000FFFFF000FFFF
          F000FFFFF000FFFFF000FFFFF000FFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        GlyphDisabled.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFF888FFFFF000FFFFF888FFFFF000FFFFF888FFFF
          F000FF888888888FF000FF888888888FF000FF888888888FF000FFFFF888FFFF
          F000FFFFF888FFFFF000FFFFF888FFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        ParentFont = False
        Position = daTop
        Version = '6.7.1.4'
      end
      object tbDelete: TDBAdvToolBarButton
        Left = 114
        Top = 2
        Width = 21
        Height = 23
        Hint = 'Supprimer l'#39'enregistrement'
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -12
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        AutoDisable = True
        ConfirmAction = False
        ConfirmActionString = 'Supprimer l'#39'enregistrement ?'
        DataSource = dsMain
        DBButtonType = dbtDelete
        DisableControl = [drReadonly, drEditing, drEmpty]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000FF000000000FF000FF000000000FF000FF000000000FF000FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        GlyphDisabled.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000FF888888888FF000FF888888888FF000FF888888888FF000FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        ParentFont = False
        Position = daTop
        Version = '6.7.1.4'
      end
      object tbEdit: TDBAdvToolBarButton
        Left = 135
        Top = 2
        Width = 21
        Height = 23
        Hint = 'Modifier l'#39'enregistrement'
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -12
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        AutoDisable = True
        ConfirmAction = False
        DataSource = dsMain
        DBButtonType = dbtEdit
        DisableControl = [drReadonly, drEditing, drEmpty]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000F0000000000F
          F000FF00000000FFF000FFF000000FFFF000FFFF0000FFFFF000FFFFF00FFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        GlyphDisabled.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000F8888888888F
          F000FF88888888FFF000FFF888888FFFF000FFFF8888FFFFF000FFFFF88FFFFF
          F000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        ParentFont = False
        Position = daTop
        Version = '6.7.1.4'
      end
      object tbPost: TDBAdvToolBarButton
        Left = 156
        Top = 2
        Width = 21
        Height = 23
        Hint = 'Valider modifications'
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -12
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        AutoDisable = True
        ConfirmAction = False
        DataSource = dsMain
        DBButtonType = dbtPost
        DisableControl = [drNotEditing]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFF0FFFFFFFF000FFF000FFFFFFF000FF00000FFFFF
          F000F000F000FFFFF000F00FFF000FFFF000FFFFFFF000FFF000FFFFFFFF000F
          F000FFFFFFFFF000F000FFFFFFFFFF00F000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        GlyphDisabled.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FFFF8FFFFFFFF000FFF888FFFFFFF000FF88888FFFFF
          F000F888F888FFFFF000F88FFF888FFFF000FFFFFFF888FFF000FFFFFFFF888F
          F000FFFFFFFFF888F000FFFFFFFFFF88F000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        ParentFont = False
        Position = daTop
        Version = '6.7.1.4'
      end
      object tbCancel: TDBAdvToolBarButton
        Left = 177
        Top = 2
        Width = 21
        Height = 23
        Hint = 'Annuler les modifications'
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -12
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        AutoDisable = True
        ConfirmAction = False
        DataSource = dsMain
        DBButtonType = dbtCancel
        DisableControl = [drNotEditing]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FF00FFFFF00FF000FF000FFF000FF000FFF000F000FF
          F000FFFF00000FFFF000FFFFF000FFFFF000FFFF00000FFFF000FFF000F000FF
          F000FF000FFF000FF000FF00FFFFF00FF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        GlyphDisabled.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFFFFFFFFFFF000FF88FFFFF88FF000FF888FFF888FF000FFF888F888FF
          F000FFFF88888FFFF000FFFFF888FFFFF000FFFF88888FFFF000FFF888F888FF
          F000FF888FFF888FF000FF88FFFFF88FF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        ParentFont = False
        Position = daTop
        Version = '6.7.1.4'
      end
      object tbReload: TDBAdvToolBarButton
        Left = 198
        Top = 2
        Width = 21
        Height = 23
        Hint = 'Actualiser les donn'#233'es'
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -12
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        AutoDisable = True
        ConfirmAction = False
        DataSource = dsMain
        DBButtonType = dbtRefresh
        DisableControl = [drEditing]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFF707FFFFFF000FF7007FFFFFFF000FF007FFFFFFFF000F707FFFFFFFF
          F000F00FFFFFFFFFF000F00FFF00000FF000F007FFF7000FF000F7007F70000F
          F000FF000000070FF000FFF70007FF0FF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        GlyphDisabled.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          F000FFFF888FFFFFF000FF8888FFFFFFF000FF888FFFFFFFF000F888FFFFFFFF
          F000F88FFFFFFFFFF000F88FFF88888FF000F888FFF8888FF000F8888F88888F
          F000FF888888888FF000FFF88888FF8FF000FFFFFFFFFFFFF000FFFFFFFFFFFF
          F000}
        ParentFont = False
        Position = daTop
        Version = '6.7.1.4'
      end
    end
    object tbTools: TAdvToolBar
      Left = 229
      Top = 1
      Width = 185
      Height = 27
      AllowFloating = True
      Caption = 'Outils'
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      CompactImageIndex = -1
      ShowRightHandle = False
      TextAutoOptionMenu = 'Add or Remove Buttons'
      TextOptionMenu = 'Options'
      ParentOptionPicture = True
      ToolBarIndex = -1
      object tbEntityCopy: TAdvToolBarButton
        Left = 9
        Top = 2
        Width = 43
        Height = 23
        Action = actEntityCopy
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -12
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Position = daTop
        ShowCaption = True
        Version = '6.7.1.4'
      end
      object tbEntityPaste: TAdvToolBarButton
        Left = 52
        Top = 2
        Width = 39
        Height = 23
        Action = actEntityPaste
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -12
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Position = daTop
        ShowCaption = True
        Version = '6.7.1.4'
      end
      object tbPreviewReport: TAdvToolBarButton
        Left = 91
        Top = 2
        Width = 46
        Height = 23
        Action = actPreviewReport
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -12
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Position = daTop
        ShowCaption = True
        Version = '6.7.1.4'
      end
      object tbDesignReport: TAdvToolBarButton
        Left = 137
        Top = 2
        Width = 44
        Height = 23
        Action = actDesignReport
        Appearance.CaptionFont.Charset = DEFAULT_CHARSET
        Appearance.CaptionFont.Color = clWindowText
        Appearance.CaptionFont.Height = -12
        Appearance.CaptionFont.Name = 'Segoe UI'
        Appearance.CaptionFont.Style = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Position = daTop
        ShowCaption = True
        Version = '6.7.1.4'
      end
    end
  end
  object dbgMain: TDBGrid
    Left = 0
    Top = 42
    Width = 418
    Height = 214
    Align = alClient
    DataSource = dsMain
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgMainDblClick
  end
  object dtsMain: TAureliusDataset
    FieldDefs = <>
    OnObjectInsert = dtsMainObjectInsert
    OnObjectUpdate = dtsMainObjectUpdate
    OnObjectRemove = dtsMainObjectRemove
    Left = 192
    Top = 80
  end
  object dsMain: TDataSource
    DataSet = dtsMain
    Left = 264
    Top = 80
  end
  object alMain: TActionList
    Left = 32
    Top = 80
    object actEntityCopy: TAction
      Caption = 'Copier'
    end
    object actEntityPaste: TAction
      Caption = 'Coller'
    end
    object actPreviewReport: TAction
      Caption = 'Aper'#231'u'
      Visible = False
      OnExecute = actPreviewReportExecute
    end
    object actDesignReport: TAction
      Caption = 'Design'
      OnExecute = actDesignReportExecute
    end
  end
end
