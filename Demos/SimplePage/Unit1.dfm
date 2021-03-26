object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 493
  ClientWidth = 831
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WkeWebBrowser1: TWkeWebbrowser
    Left = 0
    Top = 75
    Width = 831
    Height = 399
    Align = alClient
    Color = clWhite
    Taborder = 1
    UserAgent = 
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, l' +
      'ike Gecko) Chrome/31.0.1650.63 Safari/537.36 Langji.Wke 1.0'
    CspEnabled = True
    Headless = False
    TouchEnabled = False
    DragEnabled = False
    OnAlertBox = WkeWebBrowser1AlertBox
    OnLoadEnd = WkeWebBrowser1LoadEnd
    OnLoadUrlBegin = WkeWebBrowser1LoadUrlBegin
    OnLoadUrlEnd = WkeWebBrowser1LoadUrlEnd
    OnPromptBox = WkeWebBrowser1PromptBox
    OnTitleChange = WkeWebBrowser1TitleChange
    OnUrlChange = WkeWebBrowser1UrlChange
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 831
    Height = 75
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object Button2: TButton
      Left = 470
      Top = 24
      Width = 55
      Height = 25
      Caption = 'Go'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 92
      Top = 27
      Width = 365
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 6
      Text = 'https://www.baidu.com/'
      OnKeyDown = Edit1KeyDown
    end
    object btn_back: TBitBtn
      Left = 18
      Top = 23
      Width = 29
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #8592
      TabOrder = 0
      OnClick = btn_backClick
    end
    object btn_forward: TBitBtn
      Left = 52
      Top = 23
      Width = 29
      Height = 27
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #8594
      TabOrder = 1
      OnClick = btn_forwardClick
    end
    object Button1: TButton
      Left = 652
      Top = 24
      Width = 75
      Height = 25
      Caption = #21462#28304#30721
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 744
      Top = 24
      Width = 75
      Height = 25
      Caption = 'DevTool'
      TabOrder = 5
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 552
      Top = 24
      Width = 75
      Height = 25
      Caption = #25191#34892'JS'
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 474
    Width = 831
    Height = 19
    Panels = <>
    SimplePanel = True
  end
end
