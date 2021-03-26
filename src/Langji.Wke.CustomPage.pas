unit Langji.Wke.CustomPage;

interface

uses
  Langji.Wke.lib, Langji.Wke.types, Langji.Wke.CoreInterface, Langji.Wke.WebCore, Classes, Controls, Windows, messages;

type
  TWkePopupPage = class(TWkeWebCore)
  private
    FVisable: boolean;
  protected
    property WindowType;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ShowWebPage;
    procedure HidePage;
    procedure ClosePage;
    property WebView;
    property WebViewHandle;
    property BoundsRect;
    property CanBack;
    property CanForward;
    property LocationUrl;
    property LocationTitle;
    property LoadFinished;
    property DocumentReady;
    property Proxy;
    property ZoomPercent;
    property Cookie;
  published
    property Caption;
    property Headless;
    property TouchEnabled;
    property DragEnabled;
    property UserAgent;
    property CookieEnabled;
    property CookiePath;
    property LocalStoragePath;
    property PopupEnabled;
    property CspEnabled;
    property Visible: boolean read FVisable write FVisable;
   //事件
    property OnTitleChange;
    property OnUrlChange;
    property OnBeforeLoad;
    property OnLoadEnd;
    property OnCreateView;
    property OnWindowClosing;
    property OnWindowDestroy;
    property OnDocumentReady;
    property OnAlertBox;
    property OnConfirmBox;
    property OnPromptBox;
    property OnDownloadFile;
    property OnMouseOverUrlChanged;
    property OnConsoleMessage;
    property OnLoadUrlBegin;
    property OnLoadUrlEnd;
  end;

  TWkeTransparentPage = class(TWkeWebCore)
  private
  protected
    property WindowType;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ShowWebPage;
    procedure ClosePage;
    property WebView;
    property WebViewHandle;
    property BoundsRect;
    property CanBack;
    property CanForward;
    property LocationUrl;
    property LocationTitle;
    property LoadFinished;
    property DocumentReady;
    property Proxy;
    property ZoomPercent;
    property Cookie;
  published
    property Caption;
    property Headless;
    property TouchEnabled;
    property DragEnabled;
    property UserAgent;
    property CookieEnabled;
    property CookiePath;
    property LocalStoragePath;
    property PopupEnabled;
    property CspEnabled;
   //事件
    property OnTitleChange;
    property OnUrlChange;
    property OnBeforeLoad;
    property OnLoadEnd;
    property OnCreateView;
    property OnWindowClosing;
    property OnWindowDestroy;
    property OnDocumentReady;
    property OnAlertBox;
    property OnConfirmBox;
    property OnPromptBox;
    property OnDownloadFile;
    property OnMouseOverUrlChanged;
    property OnConsoleMessage;
    property OnLoadUrlBegin;
    property OnLoadUrlEnd;
  end;

function WkeGetSourceFromUrl(const Aurl: string; const ADelay: Integer; const AShowWindow: boolean = false): string;


implementation

uses
  Forms;
{ TWkePopupPage }

constructor TWkePopupPage.Create(AOwner: TComponent);
begin
  inherited;
  FVisable := true;
end;

destructor TWkePopupPage.Destroy;
begin
  ClosePage;
  inherited;
end;

procedure TWkePopupPage.HidePage;
begin
  if Assigned(webview) and IsWindow(webviewhandle) then
    showwindow(webviewhandle, SW_HIDE);
end;

procedure TWkePopupPage.ShowWebPage;
begin
  if not IsWindow(webviewhandle) then
    CreateWebView;

  if FVisable then
    showwindow(webviewhandle, SW_NORMAL);
end;

procedure TWkePopupPage.ClosePage;
begin
  try
    CloseWebView;
  except
  end;
end;

function WkeGetSourceFromUrl(const Aurl: string; const ADelay: Integer; const AShowWindow: boolean = false): string;
var
  n: Integer;
begin
  n := 0;
  with TWkeWebCore.Create(nil) do
  begin
    try
      Headless := not AShowWindow;
      CreateWebView;
      if AShowWindow then
        showwindow(webviewhandle, SW_NORMAL);
      LoadUrl(Aurl);
      while not DocumentReady do
      begin
        Sleep(100);
        Application.ProcessMessages;
        Inc(n);
        if n > 100 then
          break;
      end;
      Sleep(100);
      result := GetSource;
      wkeDestroyWebWindow(webview);
    finally
      Free;
    end;
  end;
end;

{ TWkeTransparePage2 }

constructor TWkeTransparentPage.Create(AOwner: TComponent);
begin
  inherited;
  WindowType := WKE_WINDOW_TYPE_TRANSPARENT;
end;

destructor TWkeTransparentPage.Destroy;
begin
  ClosePage;
  inherited;
end;

procedure TWkeTransparentPage.ShowWebPage;
begin
  if not IsWindow(webviewhandle) then
    CreateWebView;
  showwindow(webviewhandle, SW_NORMAL);
end;

procedure TWkeTransparentPage.ClosePage;
begin
  try
  CloseWebView;
//    if Assigned(webview) and IsWindow(webviewhandle) then
//      wkeDestroyWebWindow(webview);
  except
  end;
end;



end.

