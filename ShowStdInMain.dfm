object ShowStdInForm: TShowStdInForm
  Left = 335
  Top = 220
  Width = 603
  Height = 296
  Caption = 'STDIN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LogMemo: TTntMemo
    Left = 0
    Top = 0
    Width = 587
    Height = 258
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
end
