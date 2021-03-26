unit Langji.Wke.Webbrowser;

interface

uses
  Windows, Messages, Controls, Classes, Langji.Wke.lib, Langji.Wke.types, Langji.Wke.CoreInterface, Langji.Wke.WebCore;

type
  TWkeWebbrowser = class(TWinControl, IWkeCore)
  private
    FWkeCore: IWkeCore;
    FOnDocumentReady: TNotifyEvent;
    FOnLoadEnd: TOnLoadEndEvent;
    FOnTitleChange: TOnTitleChangeEvent;
    FOnLoadUrlBegin: TOnLoadUrlBeginEvent;
    FOnConsoleMessage: TOnConsoleMessgeEvent;
    FOnWindowClosing: TOnWindowClosingEvent;
    FOnMouseOverUrlChange: TOnUrlChangeEvent;
    FOnCreateView: TOnCreateViewEvent;
    FOnLoadStart: TOnBeforeLoadEvent;
    FOnUrlChange: TOnUrlChangeEvent;
    FOnWindowDestroy: TNotifyEvent;
    FOnPromptBox: TOnPromptBoxEvent;
    FOnAlertBox: TOnAlertBoxEvent;
    FOnDownload: TOnDownloadEvent;
    FOnConfirmBox: TOnConfirmBoxEvent;
    FOnLoadUrlEnd: TOnLoadUrlEndEvent;
    function GetCaption: string;
    procedure SetCaption(const Value: string);
    function GetBoundRect: Trect;
    procedure SetBoundsRect(const Value: Trect);
    function GetCanBack: boolean;
    function GetCanForward: boolean;
    function GetLocationTitle: string;
    function GetLocationUrl: string;
    function GetLoadFinished: boolean;
    function GetWebHandle: Hwnd;
      /// <summary>
      /// 格式为：PRODUCTINFO=webxpress; domain=.fidelity.com; path=/; secure
      /// </summary>
    procedure SetCookie(const Value: string);
    function GetCookie: string;
    procedure SetLocaStoragePath(const Value: string);
    function GetHeadless: boolean;
    procedure SetHeadless(const Value: boolean);
    function GetTouchEnabled: boolean;
    procedure SetTouchEnabled(const Value: boolean);
    function GetProxy: TwkeProxy;
    procedure SetProxy(const Value: TwkeProxy);
    function GetDragEnabled: boolean;
    procedure SetDragEnabled(const Value: boolean);
    procedure SetPopupEnabled(const Value: boolean);
    function GetContentHeight: Integer;
    function GetContentWidth: Integer;
    procedure setUserAgent(const Value: string);
    procedure SetCspEnabled(const Value: boolean);
    function GetZoom: Integer;
    procedure SetZoom(const Value: Integer);
    function GetWebview: TwkeWebView;
    function GetWindowtype: wkeWindowType;
    procedure SetWindowtype(Value: wkeWindowType);
    function GetDocumentReady: boolean;
    function GetCookieDir: string;
    function GetCookieEnabled: boolean;
    function GetCspEnabled: boolean;
    function GetLocalStoragePath: string;
    function GetPopupEnabled: boolean;
    function GetUserAgent: string;
    procedure SetCookieDir(const Value: string);
    procedure SetCookieEnabled(const Value: boolean);
    procedure SetHttpProxy(const Value: string);
      // ----------------------
    procedure DoWebTitleChange(Sender: TObject; sTitle: string);
    procedure DoWebUrlChange(Sender: TObject; sUrl: string);
    procedure DoWebBeforeLoad(Sender: TObject; sUrl: string; navigationType: wkeNavigationType; var Cancel: boolean);
    procedure DoWebLoadEnd(Sender: TObject; sUrl: string; loadresult: wkeLoadingResult);
    procedure DoWebCreateView(Sender: TObject; sUrl: string; navigationType: wkeNavigationType; windowFeatures: PwkeWindowFeatures; var wvw: wkeWebView);
    procedure DoWebWindowClosing(Sender: TObject; var bAllowClose: boolean);
    procedure DoWebWindowDestroy(Sender: TObject);
    procedure DoWebDocumentReady(Sender: TObject);
    procedure DoWebAlertBox(Sender: TObject; sMsg: string);
    procedure DoWebConfirmBox(Sender: TObject; sMsg: string; var bresult: boolean);
    procedure DoWebPromptBox(Sender: TObject; sMsg: string;var sValue:string;  var bresult: boolean);
    procedure DoWebDownloadFile(Sender: TObject; sUrl: string);
    procedure DoWebMouseOverUrlChaged(Sender: TObject; sUrl: string);
    procedure DoWebConsoleMessage(Sender: TObject; const sMsg, source: string; const sline: Integer);
    procedure DoWebLoadUrlBegin(Sender: TObject; sUrl: string; out bHook, bHandled: boolean);
    procedure DoWebLoadUrlEnd(Sender: TObject; sUrl: string; buf: Pointer; len: Integer);
    function GetGlobalHttpProxy: string;
    procedure SetGlobalHttpProxy(const Value: string);
    function GetOnAlertBox: TOnAlertBoxEvent;
    function GetOnConfirmBox: TOnConfirmBoxEvent;
    function GetOnConsoleMessage: TOnConsoleMessgeEvent;
    function GetOnCreateView: TOnCreateViewEvent;
    function GetOnDocumentReady: TNotifyEvent;
    function GetOnDownload: TOnDownloadEvent;
    function GetOnLoadEnd: TOnLoadEndEvent;
    function GetOnLoadStart: TOnBeforeLoadEvent;
    function GetOnLoadUrlBegin: TOnLoadUrlBeginEvent;
    function GetOnLoadUrlEnd: TOnLoadUrlEndEvent;
    function GetOnMouseOverUrlChange: TOnUrlChangeEvent;
    function GetOnPromptBox: TOnPromptBoxEvent;
    function GetOnTitleChange: TOnTitleChangeEvent;
    function GetOnUrlChange: TOnUrlChangeEvent;
    function GetOnWindowClosing: TOnWindowClosingEvent;
    function GetOnWindowDestroy: TNotifyEvent;
    procedure SetOnAlertBox(const Value: TOnAlertBoxEvent);
    procedure SetOnConfirmBox(const Value: TOnConfirmBoxEvent);
    procedure SetOnConsoleMessage(const Value: TOnConsoleMessgeEvent);
    procedure SetOnCreateView(const Value: TOnCreateViewEvent);
    procedure SetOnDocumentReady(const Value: TNotifyEvent);
    procedure SetOnDownload(const Value: TOnDownloadEvent);
    procedure SetOnLoadEnd(const Value: TOnLoadEndEvent);
    procedure SetOnLoadStart(const Value: TOnBeforeLoadEvent);
    procedure SetOnLoadUrlBegin(const Value: TOnLoadUrlBeginEvent);
    procedure SetOnLoadUrlEnd(const Value: TOnLoadUrlEndEvent);
    procedure SetOnMouseOverUrlChange(const Value: TOnUrlChangeEvent);
    procedure SetOnPromptBox(const Value: TOnPromptBoxEvent);
    procedure SetOnTitleChange(const Value: TOnTitleChangeEvent);
    procedure SetOnUrlChange(const Value: TOnUrlChangeEvent);
    procedure SetOnWindowClosing(const Value: TOnWindowClosingEvent);
    procedure SetOnWindowDestroy(const Value: TNotifyEvent);
  protected
    procedure CreateWebView;
    procedure CloseWebView;
    property Caption: string read GetCaption write SetCaption;
    property WindowType: wkeWindowType read GetWindowtype write SetWindowtype;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure WndProc(var msg: TMessage); override;
    procedure WM_SIZE(var msg: TMessage); message WM_SIZE;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure GoBack;
    procedure GoForward;
    procedure Refresh;
    procedure Stop;
    procedure PostUrl(const Aurl: string; const ApostData : String);
    procedure LoadUrl(const Aurl: string);
      /// <summary>
      /// 加载HTMLCODE
      /// </summary>
    procedure LoadHtml(const Astr: string);
      /// <summary>
      /// 加载文件
      /// </summary>
    procedure LoadFile(const AFile: string);
      /// <summary>
      /// 执行js 返回值 为执行成功与否
      /// </summary>
    function ExecuteJavascript(const js: string): boolean; overload;
    function ExecuteJavascript(const js: string; var r: jsValue): boolean; overload;

      /// <summary>
      /// 执行js并得到string返回值
      /// </summary>
    function GetJsTextResult(const js: string): string;
      /// <summary>
      /// 执行js并得到boolean返回值
      /// </summary>
    function GetJsBoolResult(const js: string): boolean;

      /// <summary>
      /// 取webview 的DC
      /// </summary>
    function GetWebViewDC: HDC;
    procedure SetFocusToWebbrowser;
    procedure ShowDevTool;
      /// <summary>
      /// 取源码
      /// </summary>
    function GetSource: string;

      /// <summary>
      /// 模拟鼠标
      /// </summary>
      /// <param name=" msg">WM_MouseMove 等</param>
      /// <param name=" x,y">坐标</param>
      /// <param name=" flag">wke_lbutton 左键 、右键等 </param>
    procedure MouseEvent(const msg: Cardinal; const x, y: Integer; const flag: Integer = WKE_LBUTTON);
      /// <summary>
      /// 模拟键盘
      /// </summary>
      /// <param name=" flag">WKE_REPEAT等</param>
    procedure KeyEvent(const vkcode: Integer; const flag: Integer = 0);
    procedure LoadCookies(const cks, Aurl: string);
    procedure SetDeviceParam(const keyname, keyvalue: string); overload;
    procedure SetDeviceParam(const keyname: string; const keyvalue: Integer); overload;

      // -----------------------------------
    property WebView: TwkeWebView read GetWebview;
    property WebViewHandle: Hwnd read GetWebHandle;
    property BoundsRect: Trect read GetBoundRect write SetBoundsRect;
    property CanBack: boolean read GetCanBack;
    property CanForward: boolean read GetCanForward;
    property LocationUrl: string read GetLocationUrl;
    property LocationTitle: string read GetLocationTitle;
    property LoadFinished: boolean read GetLoadFinished; // 加载完成
    property DocumentReady: boolean read GetDocumentReady;
    property Cookie: string read GetCookie write SetCookie;
    property Proxy: TwkeProxy read GetProxy write SetProxy;
    property HttpProxy: string write SetHttpProxy;
    property ZoomPercent: Integer read GetZoom write SetZoom;
  published
    property Align;
    property Color;
    property Taborder;
    property Tag;
    property UserAgent: string read GetUserAgent write setUserAgent;
    property CookieEnabled: boolean read GetCookieEnabled write SetCookieEnabled default true;
    property CookiePath: string read GetCookieDir write SetCookieDir;
    property LocalStoragePath: string read GetLocalStoragePath write SetLocaStoragePath;
    property PopupEnabled: boolean read GetPopupEnabled write SetPopupEnabled default true;
    property CspEnabled: boolean read GetCspEnabled write SetCspEnabled default false;
    property Headless: boolean read GetHeadless write SetHeadless;
    property TouchEnabled: boolean read GetTouchEnabled write SetTouchEnabled;
    property DragEnabled: boolean read GetDragEnabled write SetDragEnabled;
    property GlobalHttpProxy: string read GetGlobalHttpProxy write SetGlobalHttpProxy;

      // 事件
    property OnAlertBox: TOnAlertBoxEvent read GetOnAlertBox write SetOnAlertBox;
    property OnBeforeLoad: TOnBeforeLoadEvent read GetOnLoadStart write SetOnLoadStart;
    property OnConfirmBox: TOnConfirmBoxEvent read GetOnConfirmBox write SetOnConfirmBox;
    property OnConsoleMessage: TOnConsoleMessgeEvent read GetOnConsoleMessage write SetOnConsoleMessage;
    property OnCreateView: TOnCreateViewEvent read GetOnCreateView write SetOnCreateView;
    property OnDocumentReady: TNotifyEvent read GetOnDocumentReady write SetOnDocumentReady;
    property OnDownloadFile: TOnDownloadEvent read GetOnDownload write SetOnDownload;
    property OnLoadEnd: TOnLoadEndEvent read GetOnLoadEnd write SetOnLoadEnd;
    property OnLoadUrlBegin: TOnLoadUrlBeginEvent read GetOnLoadUrlBegin write SetOnLoadUrlBegin;
    property OnLoadUrlEnd: TOnLoadUrlEndEvent read GetOnLoadUrlEnd write SetOnLoadUrlEnd;
    property OnMouseOverUrlChanged: TOnUrlChangeEvent read GetOnMouseOverUrlChange write SetOnMouseOverUrlChange;
    property OnPromptBox: TOnPromptBoxEvent read GetOnPromptBox write SetOnPromptBox;
    property OnTitleChange: TOnTitleChangeEvent read GetOnTitleChange write SetOnTitleChange;
    property OnUrlChange: TOnUrlChangeEvent read GetOnUrlChange write SetOnUrlChange;
    property OnWindowClosing: TOnWindowClosingEvent read GetOnWindowClosing write SetOnWindowClosing;
    property OnWindowDestroy: TNotifyEvent read GetOnWindowDestroy write SetOnWindowDestroy;
  end;

implementation
      uses Dialogs;
{ TWkeWebbrowser }

procedure TWkeWebbrowser.CloseWebView;
begin
//
end;

constructor TWkeWebbrowser.Create(AOwner: TComponent);
begin
  inherited;
  FWkeCore := TWkeWebCore.Create(self);   
  with FWkeCore do
  begin
    OnTitleChange := DoWebTitleChange;
    OnUrlChange := DoWebUrlChange;
    OnBeforeLoad := DoWebBeforeLoad;
    OnLoadEnd := DoWebLoadEnd;
    OnCreateView := DoWebCreateView;
    OnWindowClosing := DoWebWindowClosing;
    OnWindowDestroy := DoWebWindowDestroy;
    OnDocumentReady := DoWebDocumentReady;
    OnAlertBox := DoWebAlertBox;
    OnConfirmBox := DoWebConfirmBox;
    OnPromptBox := DoWebPromptBox;
    OnDownloadFile := DoWebDownloadFile;
    OnMouseOverUrlChanged := DoWebMouseOverUrlChaged;
    OnConsoleMessage := DoWebConsoleMessage;
    OnLoadUrlBegin := DoWebLoadUrlBegin;
    OnLoadUrlEnd := DoWebLoadUrlEnd;
  end;          
  FWkeCore.WindowType := WKE_WINDOW_TYPE_CONTROL;
end;

destructor TWkeWebbrowser.Destroy;
begin
  FWkeCore := nil;
  inherited;
end;

procedure TWkeWebbrowser.DoWebAlertBox(Sender: TObject; sMsg: string);
begin
  if Assigned(FOnAlertBox) then
    FOnAlertBox(self, sMsg);
end;

procedure TWkeWebbrowser.DoWebBeforeLoad(Sender: TObject; sUrl: string; navigationType: wkeNavigationType; var Cancel: boolean);
begin
  if Assigned(FOnLoadStart) then
    FOnLoadStart(self, sUrl, navigationType, Cancel);
end;

procedure TWkeWebbrowser.DoWebConfirmBox(Sender: TObject; sMsg: string; var bresult: boolean);
begin
  if Assigned(FOnConfirmBox) then
    FOnConfirmBox(self, sMsg, bresult);
end;

procedure TWkeWebbrowser.DoWebConsoleMessage(Sender: TObject; const sMsg, source: string; const sline: Integer);
begin
  if Assigned(FOnConsoleMessage) then
    FOnConsoleMessage(self, sMsg, source, sline);
end;

procedure TWkeWebbrowser.DoWebCreateView(Sender: TObject; sUrl: string; navigationType: wkeNavigationType; windowFeatures: PwkeWindowFeatures; var wvw: wkeWebView);
begin
  if Assigned(FOnCreateView) then
    FOnCreateView(self, sUrl, navigationType, windowFeatures, wvw);
end;

procedure TWkeWebbrowser.DoWebDocumentReady(Sender: TObject);
begin
  if Assigned(FOnDocumentReady) then
    FOnDocumentReady(self);
end;

procedure TWkeWebbrowser.DoWebDownloadFile(Sender: TObject; sUrl: string);
begin
  if Assigned(FOnDownload) then
    FOnDownload(self, sUrl);
end;

procedure TWkeWebbrowser.DoWebLoadEnd(Sender: TObject; sUrl: string; loadresult: wkeLoadingResult);
begin
  if Assigned(FOnLoadEnd) then
    FOnLoadEnd(self, sUrl, loadresult);
end;

procedure TWkeWebbrowser.DoWebLoadUrlBegin(Sender: TObject; sUrl: string; out bHook, bHandled: boolean);
begin
  if Assigned(FOnLoadUrlBegin) then
    FOnLoadUrlBegin(self, sUrl, bHook, bHandled);
end;

procedure TWkeWebbrowser.DoWebLoadUrlEnd(Sender: TObject; sUrl: string; buf: Pointer; len: Integer);
begin
  if Assigned(FOnLoadUrlEnd) then
    FOnLoadUrlEnd(self, sUrl, buf, len);
end;

procedure TWkeWebbrowser.DoWebMouseOverUrlChaged(Sender: TObject; sUrl: string);
begin
  if Assigned(FOnMouseOverUrlChange) then
    FOnMouseOverUrlChange(self, sUrl);
end;

procedure TWkeWebbrowser.DoWebPromptBox(Sender: TObject; sMsg: string;var sValue:string; var bresult: boolean);
begin
  if Assigned(FOnPromptBox) then
    FOnPromptBox(self, sMsg, svalue, bresult);
end;

procedure TWkeWebbrowser.DoWebTitleChange(Sender: TObject; sTitle: string);
begin
  if Assigned(FOnTitleChange) then
    FOnTitleChange(self, sTitle);
  //showmessage(sTitle);
end;

procedure TWkeWebbrowser.DoWebUrlChange(Sender: TObject; sUrl: string);
begin
  if Assigned(FOnUrlChange) then
    FOnUrlChange(self, sUrl);
end;

procedure TWkeWebbrowser.DoWebWindowClosing(Sender: TObject; var bAllowClose: boolean);
begin
  if Assigned(FOnWindowClosing) then
    FOnWindowClosing(self, bAllowClose);
end;

procedure TWkeWebbrowser.DoWebWindowDestroy(Sender: TObject);
begin
  if Assigned(FOnWindowDestroy) then
    FOnWindowDestroy(self);
end;

procedure TWkeWebbrowser.CreateWebView;
begin
  if FWkeCore <> nil then
  begin
    FWkeCore.CreateWebView;
    ShowWindow(FWkeCore.WebViewHandle, SW_NORMAL);
  end;
end;

procedure TWkeWebbrowser.CreateWindowHandle(const Params: TCreateParams);
begin
  inherited;
  if (csDesigning in ComponentState) then
    exit;
  if FWkeCore <> nil then
    CreateWebView;
end;

function TWkeWebbrowser.ExecuteJavascript(const js: string; var r: jsValue): boolean;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.ExecuteJavascript(js, r);
end;

function TWkeWebbrowser.ExecuteJavascript(const js: string): boolean;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.ExecuteJavascript(js);
end;

function TWkeWebbrowser.GetBoundRect: Trect;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.BoundsRect;
end;

function TWkeWebbrowser.GetCanBack: boolean;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.CanBack;
end;

function TWkeWebbrowser.GetCanForward: boolean;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.CanForward;
end;

function TWkeWebbrowser.GetCaption: string;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.Caption;
end;

function TWkeWebbrowser.GetContentHeight: Integer;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.GetContentHeight;
end;

function TWkeWebbrowser.GetContentWidth: Integer;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.GetContentWidth;
end;

function TWkeWebbrowser.GetCookie: string;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.Cookie;
end;

function TWkeWebbrowser.GetCookieDir: string;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.CookiePath;
end;

function TWkeWebbrowser.GetCookieEnabled: boolean;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.CookieEnabled;
end;

function TWkeWebbrowser.GetCspEnabled: boolean;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.CspEnabled;
end;

function TWkeWebbrowser.GetDocumentReady: boolean;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.DocumentReady;
end;

function TWkeWebbrowser.GetDragEnabled: boolean;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.DragEnabled;
end;

function TWkeWebbrowser.GetGlobalHttpProxy: string;
begin
  Result := FWkeCore.GlobalHttpProxy;
end;

function TWkeWebbrowser.GetHeadless: boolean;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.Headless;
end;

function TWkeWebbrowser.GetJsBoolResult(const js: string): boolean;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.GetJsBoolResult(js);
end;

function TWkeWebbrowser.GetJsTextResult(const js: string): string;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.GetJsTextResult(js);
end;

function TWkeWebbrowser.GetLoadFinished: boolean;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.LoadFinished;
end;

function TWkeWebbrowser.GetLocalStoragePath: string;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.LocalStoragePath;
end;

function TWkeWebbrowser.GetLocationTitle: string;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.LocationTitle;
end;

function TWkeWebbrowser.GetLocationUrl: string;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.LocationUrl;
end;

function TWkeWebbrowser.GetOnAlertBox: TOnAlertBoxEvent;
begin
  result := FOnAlertBox;
end;

function TWkeWebbrowser.GetOnConfirmBox: TOnConfirmBoxEvent;
begin
  result := FOnConfirmBox;
end;

function TWkeWebbrowser.GetOnConsoleMessage: TOnConsoleMessgeEvent;
begin
  result := FOnConsoleMessage;
end;

function TWkeWebbrowser.GetOnCreateView: TOnCreateViewEvent;
begin
  result := FOnCreateView;
end;

function TWkeWebbrowser.GetOnDocumentReady: TNotifyEvent;
begin
  result := FOnDocumentReady;
end;

function TWkeWebbrowser.GetOnDownload: TOnDownloadEvent;
begin
  result := FOnDownload;
end;

function TWkeWebbrowser.GetOnLoadEnd: TOnLoadEndEvent;
begin
  result := FOnLoadEnd;
end;

function TWkeWebbrowser.GetOnLoadStart: TOnBeforeLoadEvent;
begin
  Result := FOnLoadStart;
end;

function TWkeWebbrowser.GetOnLoadUrlBegin: TOnLoadUrlBeginEvent;
begin
  result := FOnLoadUrlBegin;
end;

function TWkeWebbrowser.GetOnLoadUrlEnd: TOnLoadUrlEndEvent;
begin
  result := FOnLoadUrlEnd;
end;

function TWkeWebbrowser.GetOnMouseOverUrlChange: TOnUrlChangeEvent;
begin
  result := FOnMouseOverUrlChange;
end;

function TWkeWebbrowser.GetOnPromptBox: TOnPromptBoxEvent;
begin
  result := FOnPromptBox;
end;

function TWkeWebbrowser.GetOnTitleChange: TOnTitleChangeEvent;
begin
  result := FOnTitleChange;
end;

function TWkeWebbrowser.GetOnUrlChange: TOnUrlChangeEvent;
begin
  result := FOnUrlChange;
end;

function TWkeWebbrowser.GetOnWindowClosing: TOnWindowClosingEvent;
begin
  result := FOnWindowClosing;
end;

function TWkeWebbrowser.GetOnWindowDestroy: TNotifyEvent;
begin
  result := FOnWindowDestroy;
end;

function TWkeWebbrowser.GetPopupEnabled: boolean;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.PopupEnabled;
end;

function TWkeWebbrowser.GetProxy: TwkeProxy;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.Proxy;
end;

function TWkeWebbrowser.GetSource: string;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.GetSource;
end;

function TWkeWebbrowser.GetTouchEnabled: boolean;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.TouchEnabled;
end;

function TWkeWebbrowser.GetUserAgent: string;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.UserAgent;
end;

function TWkeWebbrowser.GetWebHandle: Hwnd;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.WebViewHandle;
end;

function TWkeWebbrowser.GetWebview: TwkeWebView;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.WebView;
end;

function TWkeWebbrowser.GetWebViewDC: HDC;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.GetWebViewDC;
end;

function TWkeWebbrowser.GetWindowtype: wkeWindowType;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.WindowType;
end;

function TWkeWebbrowser.GetZoom: Integer;
begin
  if FWkeCore <> nil then
    Result := FWkeCore.ZoomPercent;
end;

procedure TWkeWebbrowser.GoBack;
begin
  if FWkeCore <> nil then
    FWkeCore.GoBack;
end;

procedure TWkeWebbrowser.GoForward;
begin
  if FWkeCore <> nil then
    FWkeCore.GoForward;
end;

procedure TWkeWebbrowser.KeyEvent(const vkcode, flag: Integer);
begin
  if FWkeCore <> nil then
    FWkeCore.KeyEvent(vkcode, flag);
end;

procedure TWkeWebbrowser.LoadCookies(const cks, Aurl: string);
begin
  if FWkeCore <> nil then
    FWkeCore.LoadCookies(cks, Aurl);
end;

procedure TWkeWebbrowser.LoadFile(const AFile: string);
begin
  if FWkeCore <> nil then
    FWkeCore.LoadFile(AFile);
end;

procedure TWkeWebbrowser.LoadHtml(const Astr: string);
begin
  if FWkeCore <> nil then
    FWkeCore.LoadHtml(Astr);
end;

procedure TWkeWebbrowser.LoadUrl(const Aurl: string);
begin
  if FWkeCore <> nil then
    FWkeCore.LoadUrl(Aurl);
end;

procedure TWkeWebbrowser.PostUrl(const Aurl: string; const ApostData : String);
begin
  if FWkeCore <> nil then
    FWkeCore.PostUrl(Aurl, ApostData);
end;

procedure TWkeWebbrowser.MouseEvent(const msg: Cardinal; const x, y, flag: Integer);
begin
  if FWkeCore <> nil then
    FWkeCore.MouseEvent(msg, x, y, flag);
end;

procedure TWkeWebbrowser.Refresh;
begin
  if FWkeCore <> nil then
    FWkeCore.Refresh;
end;

procedure TWkeWebbrowser.SetBoundsRect(const Value: Trect);
begin
  if FWkeCore <> nil then
    FWkeCore.BoundsRect := Value;
end;

procedure TWkeWebbrowser.SetCaption(const Value: string);
begin
  if FWkeCore <> nil then
    FWkeCore.Caption := Value;
end;

procedure TWkeWebbrowser.SetCookie(const Value: string);
begin
  if FWkeCore <> nil then
    FWkeCore.Cookie := Value;
end;

procedure TWkeWebbrowser.SetCookieDir(const Value: string);
begin
  if FWkeCore <> nil then
    FWkeCore.CookiePath := Value;
end;

procedure TWkeWebbrowser.SetCookieEnabled(const Value: boolean);
begin
  if FWkeCore <> nil then
    FWkeCore.CookieEnabled := Value;
end;

procedure TWkeWebbrowser.SetCspEnabled(const Value: boolean);
begin
  if FWkeCore <> nil then
    FWkeCore.CspEnabled := Value;
end;

procedure TWkeWebbrowser.SetDeviceParam(const keyname, keyvalue: string);
begin
  if FWkeCore <> nil then
    FWkeCore.SetDeviceParam(keyname, keyvalue);
end;

procedure TWkeWebbrowser.SetDeviceParam(const keyname: string; const keyvalue: Integer);
begin
  if FWkeCore <> nil then
    FWkeCore.SetDeviceParam(keyname, keyvalue);
end;

procedure TWkeWebbrowser.SetDragEnabled(const Value: boolean);
begin
  if FWkeCore <> nil then
    FWkeCore.DragEnabled := Value;
end;

procedure TWkeWebbrowser.SetFocusToWebbrowser;
begin
  if FWkeCore <> nil then
    FWkeCore.SetFocusToWebbrowser;
end;

procedure TWkeWebbrowser.SetGlobalHttpProxy(const Value: string);
begin
  if FWkeCore <> nil then
    FWkeCore.GlobalHttpProxy := Value;
end;

procedure TWkeWebbrowser.SetHeadless(const Value: boolean);
begin
  if FWkeCore <> nil then
    FWkeCore.Headless := Value;
end;

procedure TWkeWebbrowser.SetHttpProxy(const Value: string);
begin
  if FWkeCore <> nil then
    FWkeCore.SetHttpProxy(Value);
end;

procedure TWkeWebbrowser.SetLocaStoragePath(const Value: string);
begin
  if FWkeCore <> nil then
    FWkeCore.LocalStoragePath := Value;
end;

procedure TWkeWebbrowser.SetOnAlertBox(const Value: TOnAlertBoxEvent);
begin
  FOnAlertBox := Value;
end;

procedure TWkeWebbrowser.SetOnConfirmBox(const Value: TOnConfirmBoxEvent);
begin
  FOnConfirmBox := Value;
end;

procedure TWkeWebbrowser.SetOnConsoleMessage(const Value: TOnConsoleMessgeEvent);
begin
  FOnConsoleMessage := Value;
end;

procedure TWkeWebbrowser.SetOnCreateView(const Value: TOnCreateViewEvent);
begin
  FOnCreateView := Value;
end;

procedure TWkeWebbrowser.SetOnDocumentReady(const Value: TNotifyEvent);
begin
  FOnDocumentReady := Value;
end;

procedure TWkeWebbrowser.SetOnDownload(const Value: TOnDownloadEvent);
begin
  FOnDownload := Value;
end;

procedure TWkeWebbrowser.SetOnLoadEnd(const Value: TOnLoadEndEvent);
begin
  FOnLoadEnd := Value;
end;

procedure TWkeWebbrowser.SetOnLoadStart(const Value: TOnBeforeLoadEvent);
begin
  FOnLoadStart := Value;
end;

procedure TWkeWebbrowser.SetOnLoadUrlBegin(const Value: TOnLoadUrlBeginEvent);
begin
  FOnLoadUrlBegin := Value;
end;

procedure TWkeWebbrowser.SetOnLoadUrlEnd(const Value: TOnLoadUrlEndEvent);
begin
  FOnLoadUrlEnd := Value;
end;

procedure TWkeWebbrowser.SetOnMouseOverUrlChange(const Value: TOnUrlChangeEvent);
begin
  FOnMouseOverUrlChange := Value;
end;

procedure TWkeWebbrowser.SetOnPromptBox(const Value: TOnPromptBoxEvent);
begin
  FOnPromptBox := Value;
end;

procedure TWkeWebbrowser.SetOnTitleChange(const Value: TOnTitleChangeEvent);
begin
  FOnTitleChange := Value;
end;

procedure TWkeWebbrowser.SetOnUrlChange(const Value: TOnUrlChangeEvent);
begin
  FOnUrlChange := Value;
end;

procedure TWkeWebbrowser.SetOnWindowClosing(const Value: TOnWindowClosingEvent);
begin
  FOnWindowClosing := Value;
end;

procedure TWkeWebbrowser.SetOnWindowDestroy(const Value: TNotifyEvent);
begin
  FOnWindowDestroy := Value;
end;

procedure TWkeWebbrowser.SetPopupEnabled(const Value: boolean);
begin
  if FWkeCore <> nil then
    FWkeCore.PopupEnabled := Value;
end;

procedure TWkeWebbrowser.SetProxy(const Value: TwkeProxy);
begin
  if FWkeCore <> nil then
    FWkeCore.Proxy := Value;
end;

procedure TWkeWebbrowser.SetTouchEnabled(const Value: boolean);
begin
  if FWkeCore <> nil then
    FWkeCore.TouchEnabled := Value;
end;

procedure TWkeWebbrowser.setUserAgent(const Value: string);
begin
  if FWkeCore <> nil then
    FWkeCore.UserAgent := Value;
end;

procedure TWkeWebbrowser.SetWindowtype(Value: wkeWindowType);
begin
  if FWkeCore <> nil then
    FWkeCore.WindowType := Value;
end;

procedure TWkeWebbrowser.SetZoom(const Value: Integer);
begin
  if FWkeCore <> nil then
    FWkeCore.ZoomPercent := Value;
end;

procedure TWkeWebbrowser.ShowDevTool;
begin
  if FWkeCore <> nil then
    FWkeCore.ShowDevTool;
end;

procedure TWkeWebbrowser.Stop;
begin
  if FWkeCore <> nil then
    FWkeCore.Stop;
end;

procedure TWkeWebbrowser.WM_SIZE(var msg: TMessage);
begin
  if FWkeCore <> nil then
    MoveWindow(WebViewHandle, 0, 0, Width, height, true);
end;

procedure TWkeWebbrowser.WndProc(var msg: TMessage);
var
  hndl: Hwnd;
begin
  case msg.msg of
    WM_SETFOCUS:
      begin
        hndl := GetWindow(handle, GW_CHILD);
        if hndl <> 0 then
          PostMessage(hndl, WM_SETFOCUS, msg.WParam, 0);
        inherited WndProc(msg);
      end;
    CM_WANTSPECIALKEY: // VK_RETURN,
      if not (TWMKey(msg).CharCode in [VK_LEFT..VK_DOWN, VK_ESCAPE, VK_TAB]) then // 2018.07.26
        msg.Result := 1
      else
        inherited WndProc(msg);
    WM_GETDLGCODE:
      msg.Result := DLGC_WANTARROWS or DLGC_WANTCHARS or DLGC_WANTTAB;
  else
    inherited WndProc(msg);
  end;
end;

end.

