object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 594
  ClientWidth = 851
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 851
    Height = 75
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object Button1: TButton
      Left = 703
      Top = 24
      Width = 55
      Height = 25
      Caption = 'Go'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 92
      Top = 27
      Width = 606
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      TabOrder = 4
      Text = 'https://www.hao123.com/'
    end
    object BitBtn1: TBitBtn
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
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
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
      OnClick = BitBtn2Click
    end
    object Button2: TButton
      Left = 764
      Top = 24
      Width = 75
      Height = 25
      Caption = 'DevTool'
      TabOrder = 3
      Visible = False
      OnClick = Button2Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 75
    Width = 851
    Height = 519
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
    end
  end
  object WkeApp1: TWkeApp
    UserAgent = 
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, l' +
      'ike Gecko) Chrome/49.0.1650.63 Safari/537.36 Langji.WKE 1.2'
    CookieEnabled = False
    CookiePath = '.\cache'
    TouchEnabled = False
    DragEnabled = False
    OnNewWindow = WkeApp1NewWindow
    Left = 616
    Top = 328
  end
end
