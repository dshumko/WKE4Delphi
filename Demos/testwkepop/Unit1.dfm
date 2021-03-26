object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 24
    Width = 74
    Height = 13
    Caption = 'QQ:231850275'
  end
  object Button1: TButton
    Left = 144
    Top = 184
    Width = 75
    Height = 25
    Caption = #21462#28304#30721
    TabOrder = 3
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 264
    Top = 0
    Width = 371
    Height = 299
    Align = alRight
    Lines.Strings = (
      #24377#20986#31383#21475#21644#21462#28304#30721#26159#20004#20010#29420#31435#30340#21151#33021#12290)
    TabOrder = 0
  end
  object Button2: TButton
    Left = 32
    Top = 184
    Width = 75
    Height = 25
    Caption = #24377#20986#31383#21475
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 32
    Top = 112
    Width = 187
    Height = 21
    TabOrder = 1
    Text = 'http://www.langjisoft.com'
  end
  object Button3: TButton
    Left = 96
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 4
    OnClick = Button3Click
  end
  object WkePopupPage1: TWkePopupPage
    Headless = False
    TouchEnabled = False
    DragEnabled = False
    UserAgent = 
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, l' +
      'ike Gecko) Chrome/31.0.1650.63 Safari/537.36 Langji.Wke 1.0'
    Visible = True
    OnLoadEnd = WkePopupPage1LoadEnd
    Left = 40
    Top = 24
  end
end
