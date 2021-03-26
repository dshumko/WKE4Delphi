{ ******************************************************* }
{ }
{ WKE FOR DELPHI }
{ }
{ 版权所有 (C) 2018 Langji }
{ }
{ QQ:231850275 }
{ }
{ ******************************************************* }

unit Langji.Wke.WebCore;

interface

uses
  Langji.Wke.CoreInterface, Langji.Wke.lib, Langji.Wke.types, classes, controls, messages, windows;

type
  TWkeWebCore = class(TComponent, IWkeCore)
    private
      FOwner               : TComponent;
      theWebView           : TwkeWebView;
      FWindowtype          : wkeWindowType;
      FZoomValue           : Integer;
      FCookieEnabled       : boolean;
      FpopupEnabled        : boolean;
      FCspEnabled          : boolean;
      FHeadless            : boolean;
      FTouchEnabled        : boolean;
      FDragEnabled         : boolean;
      FLoadFinished        : boolean;
      FDocumentReady       : boolean;
      FLocalStorageDir     : string;
      FCookieDir           : string;
      FUserAgent           : string;
      FLanguage            : string;
      FWindowTitle         : string;
      FHttpProxy           : string;
      FProxy               : wkeProxy;
      FBoundsRect          : Trect;
      FOnDocumentReady     : TNotifyEvent;
      FOnLoadEnd           : TOnLoadEndEvent;
      FOnTitleChange       : TOnTitleChangeEvent;
      FOnLoadUrlBegin      : TOnLoadUrlBeginEvent;
      FOnConsoleMessage    : TOnConsoleMessgeEvent;
      FOnWindowClosing     : TOnWindowClosingEvent;
      FOnMouseOverUrlChange: TOnUrlChangeEvent;
      FOnCreateView        : TOnCreateViewEvent;
      FOnLoadStart         : TOnBeforeLoadEvent;
      FOnUrlChange         : TOnUrlChangeEvent;
      FOnWindowDestroy     : TNotifyEvent;
      FOnPromptBox         : TOnPromptBoxEvent;
      FOnAlertBox          : TOnAlertBoxEvent;
      FOnDownload          : TOnDownloadEvent;
      FOnConfirmBox        : TOnConfirmBoxEvent;
      FOnLoadUrlEnd        : TOnLoadUrlEndEvent;
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
      function GetGlobalHttpProxy: string;
      procedure SetGlobalHttpProxy(const Value: string);
      procedure DoWebViewTitleChange(Sender: TObject; const sTitle: string);
      procedure DoWebViewUrlChange(Sender: TObject; const sUrl: string);
      procedure DoWebViewMouseOverUrlChange(Sender: TObject; sUrl: string);
      procedure DoWebViewLoadStart(Sender: TObject; sUrl: string; navigationType: wkeNavigationType;
        var Cancel: boolean);
      procedure DoWebViewLoadEnd(Sender: TObject; sUrl: string; loadresult: wkeLoadingResult);
      procedure DoWebViewCreateView(Sender: TObject; sUrl: string; navigationType: wkeNavigationType;
        windowFeatures: PwkeWindowFeatures; var wvw: Pointer);
      procedure DoWebViewAlertBox(Sender: TObject; smsg: string);
      function DoWebViewConfirmBox(Sender: TObject; smsg: string): boolean;
      function DoWebViewPromptBox(Sender: TObject; smsg:string; var Strres: string): boolean;
      procedure DoWebViewConsoleMessage(Sender: TObject; const AMessage, sourceName: string; sourceLine: Cardinal;
        const stackTrack: string);
      procedure DoWebViewDocumentReady(Sender: TObject);
      procedure DoWebViewWindowClosing(Sender: TObject; var bclose: boolean);
      procedure DoWebViewWindowDestroy(Sender: TObject);
      function DoWebViewDownloadFile(Sender: TObject; sUrl: string): boolean;
      procedure DoWebViewLoadUrlEnd(Sender: TObject; sUrl: string; job: Pointer; buf: Pointer; len: Integer);
      procedure DoWebViewLoadUrlStart(Sender: TObject; sUrl: string; out bhook, bHandle: boolean);
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
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure CreateWebView;
      procedure GoBack;
      procedure GoForward;
      procedure Refresh;
      procedure Stop;
      procedure CloseWebView;
      procedure PostUrl(const Aurl: string; const ApostData : string);
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
      property WindowType: wkeWindowType read GetWindowtype write SetWindowtype;
      property Caption: string read GetCaption write SetCaption;
      property UserAgent: string read GetUserAgent write setUserAgent;
      property CookieEnabled: boolean read GetCookieEnabled write SetCookieEnabled default true;
      property CookiePath: string read GetCookieDir write SetCookieDir;
      property LocalStoragePath: string read GetLocalStoragePath write SetLocaStoragePath;
      property PopupEnabled: boolean read GetPopupEnabled write SetPopupEnabled default true;
      property CspEnabled: boolean read GetCspEnabled write SetCspEnabled default false;
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
      property GlobalHttpProxy: string read GetGlobalHttpProxy write SetGlobalHttpProxy;
      property ZoomPercent: Integer read GetZoom write SetZoom;
      property Headless: boolean read GetHeadless write SetHeadless;
      property TouchEnabled: boolean read GetTouchEnabled write SetTouchEnabled;
      property DragEnabled: boolean read GetDragEnabled write SetDragEnabled;

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

uses
  dialogs, sysutils;
{ TWkeWebCore }



// ==============================================================================
// 回调事件
// ==============================================================================

var
  tmpSource: string = '';

function DoGetSource(p1, p2, es: jsExecState): jsValue;
begin
  tmpSource := Utf8ToAnsi(jsToTempString(es, jsArg(es, 0)));
  result    := 0;
end;

procedure doDucumentReadyCallback(WebView: wkeWebView; param: Pointer; frameid: wkeFrameHwnd); cdecl;
begin
  if wkeIsMainFrame(WebView, Cardinal(frameid)) then
    TWkeWebCore(param).DoWebViewDocumentReady(TWkeWebCore(param));
end;

procedure DoTitleChange(WebView: wkeWebView; param: Pointer; title: wkeString); cdecl;
begin
  TWkeWebCore(param).DoWebViewTitleChange(TWkeWebCore(param), WkeStringtoString(title));
end;

procedure DoUrlChange(WebView: wkeWebView; param: Pointer; url: wkeString); cdecl;
begin
  TWkeWebCore(param).DoWebViewUrlChange(TWkeWebCore(param), WkeStringtoString(url));
end;

procedure DoUrlChange2(WebView: wkeWebView; param: Pointer; frameid: wkeFrameHwnd; url: wkeString); cdecl;
begin
  if wkeIsMainFrame(WebView, Cardinal(frameid)) then
    TWkeWebCore(param).DoWebViewUrlChange(TWkeWebCore(param), WkeStringtoString(url));
end;

procedure DoMouseOverUrlChange(WebView: wkeWebView; param: Pointer; url: wkeString); cdecl;
begin
  TWkeWebCore(param).DoWebViewMouseOverUrlChange(TWkeWebCore(param), WkeStringtoString(url));
end;

procedure DoLoadEnd(WebView: wkeWebView; param: Pointer; url: wkeString; result: wkeLoadingResult;
  failedReason: wkeString); cdecl;
begin
  TWkeWebCore(param).DoWebViewLoadEnd(TWkeWebCore(param), WkeStringtoString(url), result);
end;

function DoLoadStart(WebView: wkeWebView; param: Pointer; navigationType: wkeNavigationType; url: wkeString)
  : boolean; cdecl;
var
  Cancel: boolean;
begin
  Cancel := false;
  TWkeWebCore(param).DoWebViewLoadStart(TWkeWebCore(param), WkeStringtoString(url), navigationType, Cancel);
  result := not Cancel;
end;

function DoCreateView(WebView: wkeWebView; param: Pointer; navigationType: wkeNavigationType; url: wkeString;
  windowFeatures: PwkeWindowFeatures): wkeWebView; cdecl;
var
  pt: Pointer;
begin
  TWkeWebCore(param).DoWebViewCreateView(TWkeWebCore(param), WkeStringtoString(url), navigationType,
    windowFeatures, pt);
  result := wkeWebView(pt);
end;

procedure DoPaintUpdated(WebView: wkeWebView; param: Pointer; HDC: HDC; x: Integer; y: Integer; cx: Integer;
  cy: Integer); cdecl;
begin

end;

procedure DoAlertBox(WebView: wkeWebView; param: Pointer; msg: wkeString); cdecl;
begin
  TWkeWebCore(param).DoWebViewAlertBox(TWkeWebCore(param), WkeStringtoString(msg));
end;

function DoConfirmBox(WebView: wkeWebView; param: Pointer; msg: wkeString): boolean; cdecl;
begin
  result := TWkeWebCore(param).DoWebViewConfirmBox(TWkeWebCore(param), WkeStringtoString(msg));
end;

function DoPromptBox(WebView: wkeWebView; param: Pointer; msg: wkeString; defaultResult: wkeString; sresult: wkeString)
  : boolean; cdecl;
  var svalue:string;
    s:AnsiString;
begin
  svalue :=  WkeStringtoString(defaultResult)  ;
  result := TWkeWebCore(param).DoWebViewPromptBox(TWkeWebCore(param), WkeStringtoString(msg),       svalue);
  if Result then
  begin
    s:=AnsiString(UTF8Encode(svalue));
    wkeSetString( sresult ,  PAnsiChar( s) ,strlen(PAnsiChar(s)));
  end;

end;

procedure DoConsoleMessage(WebView: wkeWebView; param: Pointer; level: wkeMessageLevel;
  const AMessage, sourceName: wkeString; sourceLine: Cardinal; const stackTrack: wkeString); cdecl;
begin
  TWkeWebCore(param).DoWebViewConsoleMessage(TWkeWebCore(param), WkeStringtoString(AMessage),
    WkeStringtoString(sourceName), sourceLine, WkeStringtoString(stackTrack));
end;

procedure DocumentReady(WebView: wkeWebView; param: Pointer); cdecl;
begin
  TWkeWebCore(param).DoWebViewDocumentReady(TWkeWebCore(param));
end;

function DoWindowClosing(webWindow: wkeWebView; param: Pointer): boolean; cdecl;
begin
  result := true;
  TWkeWebCore(param).DoWebViewWindowClosing(TWkeWebCore(param), result);
end;

procedure DoWindowDestroy(webWindow: wkeWebView; param: Pointer); cdecl;
begin
  TWkeWebCore(param).DoWebViewWindowDestroy(TWkeWebCore(param));
end;

function DodownloadFile(WebView: wkeWebView; param: Pointer; url: PansiChar): boolean; cdecl;
begin
  result := TWkeWebCore(param).DoWebViewDownloadFile(TWkeWebCore(param), StrPas(url));
end;

procedure DoOnLoadUrlEnd(WebView: wkeWebView; param: Pointer; const url: PansiChar; job: Pointer; buf: Pointer;
  len: Integer); cdecl;
begin
  TWkeWebCore(param).DoWebViewLoadUrlEnd(TWkeWebCore(param), StrPas(url), job, buf, len);
end;

function DoOnLoadUrlBegin(WebView: wkeWebView; param: Pointer; url: PansiChar; job: Pointer): boolean; cdecl;
var
  bhook, bHandled: boolean;
begin
   wkeNetSetHTTPHeaderField(job, PwideChar('Accept-Language'), PWideChar('en-us,en'), False);

  bhook    := false;
  bHandled := false;
  TWkeWebCore(param).DoWebViewLoadUrlStart(TWkeWebCore(param), StrPas(url), bhook, bHandled);
  if bhook then
    if Assigned(wkeNetHookRequest) then
      wkeNetHookRequest(job);
  if bHandled  then
    wkeNetCancelRequest(job);
  result := bHandled;
end;


// ****************************************回调结束------------------------------//


// type TCOMState=(csLoading, csReading, csWriting, csDestroying,
// csDesigning, csAncestor, csUpdating, csFixups, csFreeNotification,
// csInline, csDesignInstance);

procedure TWkeWebCore.CloseWebView;
begin
  if Assigned(thewebview) and IsWindow(webviewhandle) then
  begin

// SendMessage( WebviewHandle ,WM_CLOSE,0,0   )  ;
    LoadUrl('about:blank');
    if  Win32MajorVersion>7 then
      wkeDestroyWebView(theWebView)      //win7会出错
    else
       CloseWindow( WebviewHandle )  ;     //win10关闭不了
  end;
  theWebView :=nil;
end;

constructor TWkeWebCore.Create(AOwner: TComponent);
var
  i: TComponentState;
  // x:TCOMState;
begin
  inherited;
  FOwner           := AOwner;
  theWebView       := nil;
  FWindowtype      := WKE_WINDOW_TYPE_POPUP;
  FZoomValue       := 100;
  FCookieEnabled   := true;
  FpopupEnabled    := true;
  FCspEnabled      := false;
  FDocumentReady   := false;
  FHeadless        := false;
  FTouchEnabled    := false;
  FDragEnabled     := false;
  FLoadFinished    := false;
  FDocumentReady   := false;
  FLocalStorageDir := '';
  FCookieDir       := '';
  FUserAgent       := wkeUserAgent;
  FLanguage        := 'en-us,en';
  FBoundsRect      := Rect(100, 50, 900, 650);

  if csDesigning in ComponentState then
    exit;

  if not wkeisInit then
    WkeLoadLibAndInit;
end;

destructor TWkeWebCore.Destroy;
begin
  CloseWebView;
  inherited;
end;

procedure TWkeWebCore.CreateWebView;
var
  r: Trect;
  h: Hwnd;
begin
  case FWindowtype of
    WKE_WINDOW_TYPE_POPUP, WKE_WINDOW_TYPE_TRANSPARENT:
      begin
        theWebView := wkeCreateWebWindow(FWindowtype, 0, FBoundsRect.Left, FBoundsRect.Top,
          FBoundsRect.Right - FBoundsRect.Left, FBoundsRect.Bottom - FBoundsRect.Top);
      end;
    WKE_WINDOW_TYPE_CONTROL:
      begin
        if FOwner is TWinControl then
        begin
          h := (FOwner as TWinControl).Handle;
          getwindowrect(h, r);
          theWebView := wkeCreateWebWindow(WKE_WINDOW_TYPE_CONTROL, h, 0, 0, r.Right - r.Left, r.Bottom - r.Top);
        end;
        SetWindowLong(GetWebHandle, GWL_STYLE, GetWindowLong(GetWebHandle, GWL_STYLE) or WS_CHILD or WS_TABSTOP or
          WS_CLIPCHILDREN or WS_CLIPSIBLINGS);
      end;
  end;

  if FHttpProxy <> '' then
    SetGlobalHttpProxy(FHttpProxy);

  if Assigned(theWebView) then
  begin
    // ShowWindow(GetWebHandle, SW_NORMAL);
    wkeOnTitleChanged(theWebView, DoTitleChange, Self);
    wkeOnURLChanged(theWebView, DoUrlChange, Self);
    wkeOnNavigation(theWebView, DoLoadStart, Self);
    wkeOnLoadingFinish(theWebView, DoLoadEnd, Self);
    wkeOnDocumentReady2(theWebView, doDucumentReadyCallback, Self);
    wkeOnWindowClosing(theWebView, DoWindowClosing, Self);
    wkeOnWindowDestroy(theWebView, DoWindowDestroy, Self);
    wkeOnPaintUpdated(theWebView, DoPaintUpdated, Self);
    if Assigned(FOnCreateView) then
      wkeOnCreateView(theWebView, DoCreateView, Self);
    if Assigned(FOnAlertBox) then
      wkeOnAlertBox(theWebView, DoAlertBox, Self);
    if Assigned(FOnConfirmBox) then
      wkeOnConfirmBox(theWebView, DoConfirmBox, Self);
    if Assigned(FOnPromptBox) then
      wkeOnPromptBox(theWebView, DoPromptBox, Self);
    wkeOnConsoleMessage(theWebView, DoConsoleMessage, Self);
    wkeOnLoadUrlBegin(theWebView, DoOnLoadUrlBegin, Self);
    wkeOnLoadUrlEnd(theWebView, DoOnLoadUrlEnd, Self);
    if Assigned(FOnDownload) then
      wkeOnDownload(theWebView, DodownloadFile, Self);
    if Assigned(FOnMouseOverUrlChange) then
      wkeOnMouseOverUrlChanged(theWebView, DoMouseOverUrlChange, Self);
    if FUserAgent <> '' then
{$IFDEF UNICODE}
      wkeSetUserAgentw(theWebView, PChar(FUserAgent));
{$ELSE}
      wkeSetUserAgent(theWebView, PansiChar(AnsiString(FUserAgent)));
{$ENDIF}

    wkeSetCookieEnabled(theWebView, FCookieEnabled);

    if DirectoryExists(FCookieDir) and Assigned(wkeSetCookieJarPath) then
      wkeSetCookieJarPath(theWebView, PwideChar(FCookieDir));
    if DirectoryExists(FLocalStorageDir) and Assigned(wkeSetLocalStorageFullPath) then
      wkeSetLocalStorageFullPath(theWebView, PwideChar(FLocalStorageDir));
    // 设置标题
    if FWindowTitle <> '' then
{$IFDEF UNICODE}
      wkeSetWindowTitleW(theWebView, PChar(FWindowTitle));
{$ELSE}
      wkeSetWindowTitle(theWebView, PansiChar(ansitoutf8(FWindowTitle)));
{$ENDIF}
    wkeSetNavigationToNewWindowEnable(theWebView, FpopupEnabled);
    wkeSetCspCheckEnable(theWebView, FCspEnabled); // 关闭跨域检查
    jsBindFunction('GetSource', DoGetSource, 1);
  end;
end;

procedure TWkeWebCore.DoWebViewAlertBox(Sender: TObject; smsg: string);
begin
  if Assigned(FOnAlertBox) then
    FOnAlertBox(Self, smsg);
end;

function TWkeWebCore.DoWebViewConfirmBox(Sender: TObject; smsg: string): boolean;
begin
  result := false;
  if Assigned(FOnConfirmBox) then
    FOnConfirmBox(Self, smsg, result);
end;

procedure TWkeWebCore.DoWebViewConsoleMessage(Sender: TObject; const AMessage, sourceName: string; sourceLine: Cardinal;
  const stackTrack: string);
begin
  if Assigned(FOnConsoleMessage) then
    FOnConsoleMessage(Self, AMessage, sourceName, sourceLine);
end;

procedure TWkeWebCore.DoWebViewCreateView(Sender: TObject; sUrl: string; navigationType: wkeNavigationType;
  windowFeatures: PwkeWindowFeatures; var wvw: Pointer);
var
  view: wkeWebView;
begin
  wvw := nil;
  if Assigned(FOnCreateView) then
  begin
    FOnCreateView(Self, sUrl, navigationType, windowFeatures, view);
    wvw := view;
  end;
  if not Assigned(wvw) then
  begin
    wvw := wkeCreateWebWindow(WKE_WINDOW_TYPE_POPUP, 0, windowFeatures.x, windowFeatures.y, windowFeatures.Width,
      windowFeatures.height);
    wkeShowWindow(wvw, true);
    wkeSetWindowTitleW(wvw, PwideChar(sUrl));
  end else begin
    if wkeGetWindowHandle(wvw) = 0 then
      wvw := theWebView;
  end;
end;

procedure TWkeWebCore.DoWebViewDocumentReady(Sender: TObject);
begin
  FDocumentReady := true;
  if Assigned(FOnDocumentReady) then
    FOnDocumentReady(Self);
end;

function TWkeWebCore.DoWebViewDownloadFile(Sender: TObject; sUrl: string): boolean;
begin
  if Assigned(FOnDownload) then
    FOnDownload(Self, sUrl);
end;

procedure TWkeWebCore.DoWebViewLoadEnd(Sender: TObject; sUrl: string; loadresult: wkeLoadingResult);
begin
  FLoadFinished := true;
  if Assigned(FOnLoadEnd) then
    FOnLoadEnd(Self, sUrl, loadresult);
end;

procedure TWkeWebCore.DoWebViewLoadStart(Sender: TObject; sUrl: string; navigationType: wkeNavigationType;
  var Cancel: boolean);
begin
  FLoadFinished  := false;
  FDocumentReady := false;
  if Assigned(FOnLoadStart) then
    FOnLoadStart(Self, sUrl, navigationType, Cancel);
end;

procedure TWkeWebCore.DoWebViewLoadUrlEnd(Sender: TObject; sUrl: string; job, buf: Pointer; len: Integer);
begin
  if Assigned(FOnLoadUrlEnd) then
    FOnLoadUrlEnd(Self, sUrl, buf, len);
end;

procedure TWkeWebCore.DoWebViewLoadUrlStart(Sender: TObject; sUrl: string; out bhook, bHandle: boolean);
begin
  // bhook:=true 表示hook会触发onloadurlend 如果只是设置 bhandle=true表示 ，只是拦截这个URL
  if Assigned(FOnLoadUrlBegin) then
    FOnLoadUrlBegin(Self, sUrl, bhook, bHandle);
end;

procedure TWkeWebCore.DoWebViewMouseOverUrlChange(Sender: TObject; sUrl: string);
begin
  if Assigned(FOnMouseOverUrlChange) then
    FOnMouseOverUrlChange(Self, sUrl);
end;

function TWkeWebCore.DoWebViewPromptBox(Sender: TObject; smsg:string; var Strres: string): boolean;
begin
  if Assigned(FOnPromptBox) then
    FOnPromptBox(Self, smsg,  Strres, result);
end;

procedure TWkeWebCore.DoWebViewTitleChange(Sender: TObject; const sTitle: string);
begin
  if Assigned(FOnTitleChange) then
    FOnTitleChange(Self, sTitle);   
end;

procedure TWkeWebCore.DoWebViewUrlChange(Sender: TObject; const sUrl: string);
begin
  if Assigned(FOnUrlChange) then
    FOnUrlChange(Self, sUrl);
end;

procedure TWkeWebCore.DoWebViewWindowClosing(Sender: TObject; var bclose: boolean);
var
  r: boolean;
begin
  r := bclose;
  if Assigned(FOnWindowClosing) then
    FOnWindowClosing(Self, r);
end;

procedure TWkeWebCore.DoWebViewWindowDestroy(Sender: TObject);
begin
  if Assigned(FOnWindowDestroy) then
    FOnWindowDestroy(Self);
end;

function TWkeWebCore.ExecuteJavascript(const js: string): boolean;
var
  newjs: AnsiString;
  r    : jsValue;
  es   : jsExecState;
begin
  result := false;
  newjs  := 'try { ' + js + '; return 1; } catch(err){ return 0;}';
  if Assigned(theWebView) then
  begin
    r  := wkeRunJS(theWebView, PansiChar(ansitoutf8(newjs)));
    es := wkeGlobalExec(theWebView);
    if jsIsNumber(r) then
    begin
      if jsToint(es, r) = 1 then
        result := true;
    end;
  end;
end;

function TWkeWebCore.ExecuteJavascript(const js: string; var r: jsValue): boolean;
var
  newjs: AnsiString;
  es   : jsExecState;
begin
  result := false;
  newjs  := 'try { funtion(){' + js + '}();  } catch(err){ return null;}';
  if Assigned(theWebView) then
  begin
    r      := wkeRunJS(theWebView, PansiChar(ansitoutf8(newjs)));
    es     := wkeGlobalExec(theWebView);
    result := not jsIsnull(r);
  end;
end;

function TWkeWebCore.GetJsBoolResult(const js: string): boolean;
var
  r : jsValue;
  es: jsExecState;
begin
  if Assigned(theWebView) then
  begin
    r  := wkeRunJS(theWebView, PansiChar(ansitoutf8(js)));
    es := wkeGlobalExec(theWebView);
    if jsIsBoolean(r) then
      result := jsToBoolean(es, r);
  end;
end;

function TWkeWebCore.GetJsTextResult(const js: string): string;
var
  r : jsValue;
  es: jsExecState;
begin
  result := '';
  if Assigned(theWebView) then
  begin
    r  := wkeRunJS(theWebView, PansiChar(ansitoutf8(js)));
    es := wkeGlobalExec(theWebView);
    if jsIsString(r) then
      result := jsToTempString(es, r);
  end;
end;

function TWkeWebCore.GetBoundRect: Trect;
var
  r: Trect;
begin
  getwindowrect(GetWebHandle, r);
  result := r;
end;

function TWkeWebCore.GetCanBack: boolean;
begin
  if Assigned(theWebView) then
    result := wkeCanGoBack(theWebView);
end;

function TWkeWebCore.GetCanForward: boolean;
begin
  if Assigned(theWebView) then
    result := wkeCanGoForward(theWebView);
end;

function TWkeWebCore.GetCaption: string;
begin
  if Assigned(theWebView) then
    result := FWindowTitle
  else
    result := '';
end;

function TWkeWebCore.GetContentHeight: Integer;
begin
  result := 0;
  if Assigned(theWebView) then
    result := wkeGetContentHeight(theWebView);
end;

function TWkeWebCore.GetContentWidth: Integer;
begin
  result := 0;
  if Assigned(theWebView) then
    result := wkeGetContentWidth(theWebView);
end;

function TWkeWebCore.GetCookie: string;
begin
  if Assigned(theWebView) then
  begin
{$IFDEF UNICODE}
    result := wkeGetCookieW(theWebView);
{$ELSE}
    result := Utf8ToAnsi(wkeGetCookie(theWebView));
{$ENDIF}
  end;
end;

function TWkeWebCore.GetCookieDir: string;
begin
  if DirectoryExists(FCookieDir) then
    result := FCookieDir
  else
    result := '';
end;

function TWkeWebCore.GetCookieEnabled: boolean;
begin
  if Assigned(theWebView) then
    FCookieEnabled := wkeIsCookieEnabled(theWebView);
  result           := FCookieEnabled;
end;

function TWkeWebCore.GetCspEnabled: boolean;
begin
  result := FCspEnabled;
end;

function TWkeWebCore.GetDocumentReady: boolean;
begin
  result := FDocumentReady;
end;

function TWkeWebCore.GetDragEnabled: boolean;
begin
  result := FDragEnabled;
end;

function TWkeWebCore.GetGlobalHttpProxy: string;
begin
  result := FHttpProxy;
end;

function TWkeWebCore.GetHeadless: boolean;
begin
  result := FHeadless;
end;

function TWkeWebCore.GetLoadFinished: boolean;
begin
  if Assigned(theWebView) then
    result := FLoadFinished
  else
    result := false;
end;

function TWkeWebCore.GetLocalStoragePath: string;
begin
  if DirectoryExists(FLocalStorageDir) then
    result := FLocalStorageDir
  else
    result := '';
end;

function TWkeWebCore.GetLocationTitle: string;
begin
  if Assigned(theWebView) then
  begin
{$IFDEF UNICODE}
    result := wkeGetTitleW(theWebView);
{$ELSE}
    result := Utf8ToAnsi(wkeGetTitle(theWebView));
{$ENDIF}
  end
  else
    result := '';
end;

function TWkeWebCore.GetLocationUrl: string;
begin
  if Assigned(theWebView) then
    result := Utf8ToAnsi(wkeGetUrl(theWebView))
  else
    result := '';
end;

function TWkeWebCore.GetOnAlertBox: TOnAlertBoxEvent;
begin
  result := FOnAlertBox;
end;

function TWkeWebCore.GetOnConfirmBox: TOnConfirmBoxEvent;
begin
  result := FOnConfirmBox;
end;

function TWkeWebCore.GetOnConsoleMessage: TOnConsoleMessgeEvent;
begin
  result := FOnConsoleMessage;
end;

function TWkeWebCore.GetOnCreateView: TOnCreateViewEvent;
begin
  result := FOnCreateView;
end;

function TWkeWebCore.GetOnDocumentReady: TNotifyEvent;
begin
  result := FOnDocumentReady;
end;

function TWkeWebCore.GetOnDownload: TOnDownloadEvent;
begin
  result := FOnDownload;
end;

function TWkeWebCore.GetOnLoadEnd: TOnLoadEndEvent;
begin
  result := FOnLoadEnd;
end;

function TWkeWebCore.GetOnLoadStart: TOnBeforeLoadEvent;
begin
  result := FOnLoadStart;
end;

function TWkeWebCore.GetOnLoadUrlBegin: TOnLoadUrlBeginEvent;
begin
  result := FOnLoadUrlBegin;
end;

function TWkeWebCore.GetOnLoadUrlEnd: TOnLoadUrlEndEvent;
begin
  result := FOnLoadUrlEnd;
end;

function TWkeWebCore.GetOnMouseOverUrlChange: TOnUrlChangeEvent;
begin
  result := FOnMouseOverUrlChange;
end;

function TWkeWebCore.GetOnPromptBox: TOnPromptBoxEvent;
begin
  result := FOnPromptBox;
end;

function TWkeWebCore.GetOnTitleChange: TOnTitleChangeEvent;
begin
  result := FOnTitleChange;
end;

function TWkeWebCore.GetOnUrlChange: TOnUrlChangeEvent;
begin
  result := FOnUrlChange;
end;

function TWkeWebCore.GetOnWindowClosing: TOnWindowClosingEvent;
begin
  result := FOnWindowClosing;
end;

function TWkeWebCore.GetOnWindowDestroy: TNotifyEvent;
begin
  result := FOnWindowDestroy;
end;

function TWkeWebCore.GetPopupEnabled: boolean;
begin
  result := FpopupEnabled;
end;

function TWkeWebCore.GetProxy: TwkeProxy;
begin
  result := FProxy;
end;

function TWkeWebCore.GetSource: string;
begin
  tmpSource := '';
  if Assigned(theWebView) then
  begin
    ExecuteJavascript('GetSource(document.getElementsByTagName("html")[0].outerHTML);');
    Sleep(100);
    result := tmpSource;
  end;
end;

function TWkeWebCore.GetTouchEnabled: boolean;
begin
  result := FTouchEnabled;
end;

function TWkeWebCore.GetUserAgent: string;
begin
  result := FUserAgent;
end;

function TWkeWebCore.GetWebHandle: Hwnd;
begin
  result := 0;
  if Assigned(theWebView) then
    result := wkeGetWindowHandle(theWebView);
end;

function TWkeWebCore.GetWebview: TwkeWebView;
begin
  result := theWebView;
end;

function TWkeWebCore.GetWebViewDC: HDC;
begin
  result := 0;
  if Assigned(theWebView) then
    result := wkeGetViewDC(theWebView);
end;

function TWkeWebCore.GetWindowtype: wkeWindowType;
begin
  result := FWindowtype;
end;

function TWkeWebCore.GetZoom: Integer;
begin
  if Assigned(theWebView) then
  begin
    // result := Trunc(power(1.2, thewebview.ZoomFactor) * 100)
    result := Trunc(wkeGetZoomFactor(theWebView));
  end
  else
    result := 100;
end;

procedure TWkeWebCore.GoBack;
begin
  if Assigned(theWebView) then
  begin
    if Self.CanBack then
      wkeGoBack(theWebView);
  end;
end;

procedure TWkeWebCore.GoForward;
begin
  if Assigned(theWebView) then
  begin
    if CanForward then
      wkeGoForward(theWebView);
  end;
end;

procedure TWkeWebCore.KeyEvent(const vkcode, flag: Integer);
begin
  if Assigned(theWebView) then
  begin
    wkeFireKeyDownEvent(theWebView, vkcode, flag, false);
    Sleep(10);
    wkeFireKeyUpEvent(theWebView, vkcode, flag, false);
  end;
end;

procedure TWkeWebCore.LoadCookies(const cks, Aurl: string);
var
  i: Integer;
begin
  if Assigned(theWebView) then
  begin
    with TStringList.Create do
    begin
      try
        Delimiter     := ';';
        DelimitedText := cks;
        for i         := 0 to Count - 1 do
        begin
          wkeSetCookie(theWebView, PansiChar(ansitoutf8(Aurl)), PansiChar(ansitoutf8(Strings[i])));
        end;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TWkeWebCore.LoadFile(const AFile: string);
begin
  if Assigned(theWebView) and FileExists(AFile) then
  begin
    FLoadFinished := false;
{$IFDEF UNICODE}
    wkeLoadFileW(theWebView, PChar(AFile));
{$ELSE}
    wkeLoadFile(theWebView, PansiChar(ansitoutf8(AFile)));
{$ENDIF}
  end;
end;

procedure TWkeWebCore.LoadHtml(const Astr: string);
begin
  if Assigned(theWebView) then
  begin
{$IFDEF UNICODE}
    wkeLoadHTMLw(theWebView, PChar(Astr));
{$ELSE}
    wkeLoadHTML(theWebView, PansiChar(ansitoutf8(Astr)));
{$ENDIF}
  end;
end;

procedure TWkeWebCore.LoadUrl(const Aurl: string);
begin
  if Assigned(theWebView) then
  begin
{$IFDEF UNICODE}
    wkeLoadURLw(theWebView, PChar(Aurl));
{$ELSE}
    wkeLoadURL(theWebView, PansiChar(ansitoutf8(Aurl)));
{$ENDIF}
  end;
end;

procedure TWkeWebCore.PostUrl(const Aurl: string; const ApostData: string);
begin
  if Assigned(theWebView) then
  begin
{$IFDEF UNICODE}
    wkePostURLW(theWebView, PChar(Aurl), PAnsiChar(AnsiString(APostData)) , ApostData.Length);
{$ELSE}
    wkePostURL(theWebView, PChar(Aurl), PansiChar(ansitoutf8(ApostData)), strlen(PansiChar(ansitoutf8(ApostData))));
{$ENDIF}
  end;
end;

procedure TWkeWebCore.MouseEvent(const msg: Cardinal; const x, y, flag: Integer);
begin
  if Assigned(theWebView) then
    wkeFireMouseEvent(theWebView, msg, x, y, flag);
end;

procedure TWkeWebCore.Refresh;
begin
  if Assigned(theWebView) then
    wkeReload(theWebView);
end;

procedure TWkeWebCore.SetBoundsRect(const Value: Trect);
begin
  if Assigned(theWebView) then
    MoveWindow(GetWebHandle, Value.Left, Value.Top, Value.Right - Value.Left, Value.Bottom - Value.Top, true);
  FBoundsRect := Value;
end;

procedure TWkeWebCore.SetCaption(const Value: string);
begin
  FWindowTitle := Value;
  if Assigned(theWebView) then
{$IFDEF UNICODE}
    wkeSetWindowTitleW(theWebView, PChar(Value));
{$ELSE}
    wkeSetWindowTitle(theWebView, PansiChar(ansitoutf8(Value)));
{$ENDIF}
end;

procedure TWkeWebCore.SetCookie(const Value: string);
begin
  if Assigned(theWebView) then
    wkeSetCookie(theWebView, PansiChar(ansitoutf8(LocationUrl)), PansiChar(ansitoutf8(Value)));
end;

procedure TWkeWebCore.SetCookieEnabled(const Value: boolean);
begin
  FCookieEnabled := Value;
  if Assigned(theWebView) then
    wkeSetCookieEnabled(theWebView, FCookieEnabled);
end;

procedure TWkeWebCore.SetCspEnabled(const Value: boolean);
begin
  FCspEnabled := Value;
  if Assigned(theWebView) then
    wkeSetCspCheckEnable(theWebView, Value);
end;

procedure TWkeWebCore.SetDeviceParam(const keyname: string; const keyvalue: Integer);
begin
  if Assigned(theWebView) then
    wkeSetDeviceParameter(theWebView, PansiChar(AnsiString(keyname)), '', keyvalue, 0.0);
end;

procedure TWkeWebCore.SetDeviceParam(const keyname, keyvalue: string);
begin
  if Assigned(theWebView) then
    wkeSetDeviceParameter(theWebView, PansiChar(AnsiString(keyname)), PansiChar(AnsiString(keyvalue)), 0, 0.0);
end;

procedure TWkeWebCore.SetDragEnabled(const Value: boolean);
begin
  FDragEnabled := Value;
  if Assigned(theWebView) then
    wkeSetDragEnable(theWebView, Value);
end;

procedure TWkeWebCore.SetFocusToWebbrowser;
begin
  if Assigned(theWebView) then
  begin
    wkeSetFocus(theWebView);
    SendMessage(WebViewHandle, WM_ACTIVATE, 1, 0);
  end;
end;

procedure TWkeWebCore.SetGlobalHttpProxy(const Value: string);
var
  aproxy      : TwkeProxy;
  phost, pport: string;
begin

  FHttpProxy := Value;
  if not(Pos(':', Value) > 0) then
    exit;
  phost := Copy(Value, 1, Pos(':', Value) - 1);
  pport := Copy(Value, Pos(':', Value) + 1, Length(Value) - Pos(':', Value));
  with aproxy do
  begin
    AType := WKE_PROXY_HTTP;
    StrPCopy(hostname, AnsiString(phost));
    port     := StrToIntDef(pport, 8080);
    username := '';
    password := '';
  end;
  if wkeisInit then
    wkeSetproxy(@aproxy);
end;

procedure TWkeWebCore.SetHeadless(const Value: boolean);
begin
  FHeadless := Value;
  if Assigned(theWebView) then
    wkeSetHeadlessEnabled(theWebView, Value);
end;

procedure TWkeWebCore.SetHttpProxy(const Value: string);
var
  aproxy      : TwkeProxy;
  phost, pport: string;
begin
  if not(Pos(':', Value) > 0) then
    exit;
  phost := Copy(Value, 1, Pos(':', Value) - 1);
  pport := Copy(Value, Pos(':', Value) + 1, Length(Value) - Pos(':', Value));
  with aproxy do
  begin
    AType := WKE_PROXY_HTTP;
    StrPCopy(hostname, AnsiString(phost));
    port     := StrToIntDef(pport, 8080);
    username := '';
    password := '';
  end;
  if Assigned(theWebView) then
    wkeSetViewProxy(theWebView, @aproxy);
  // wkeSetproxy(@aproxy);
end;

procedure TWkeWebCore.SetLocaStoragePath(const Value: string);
begin
  if Value <> FLocalStorageDir then
  begin
    FLocalStorageDir := Value;
    if Assigned(theWebView) then
      wkeSetLocalStorageFullPath(theWebView, PwideChar(Value));
  end;
end;

procedure TWkeWebCore.SetOnAlertBox(const Value: TOnAlertBoxEvent);
begin
  FOnAlertBox := Value;
end;

procedure TWkeWebCore.SetOnConfirmBox(const Value: TOnConfirmBoxEvent);
begin
  FOnConfirmBox := Value;
end;

procedure TWkeWebCore.SetOnConsoleMessage(const Value: TOnConsoleMessgeEvent);
begin
  FOnConsoleMessage := Value;
end;

procedure TWkeWebCore.SetOnCreateView(const Value: TOnCreateViewEvent);
begin
  FOnCreateView := Value;
end;

procedure TWkeWebCore.SetOnDocumentReady(const Value: TNotifyEvent);
begin
  FOnDocumentReady := Value;
end;

procedure TWkeWebCore.SetOnDownload(const Value: TOnDownloadEvent);
begin
  FOnDownload := Value;
end;

procedure TWkeWebCore.SetOnLoadEnd(const Value: TOnLoadEndEvent);
begin
  FOnLoadEnd := Value;
end;

procedure TWkeWebCore.SetOnLoadStart(const Value: TOnBeforeLoadEvent);
begin
  FOnLoadStart := Value;
end;

procedure TWkeWebCore.SetOnLoadUrlBegin(const Value: TOnLoadUrlBeginEvent);
begin
  FOnLoadUrlBegin := Value;
end;

procedure TWkeWebCore.SetOnLoadUrlEnd(const Value: TOnLoadUrlEndEvent);
begin
  FOnLoadUrlEnd := Value;
end;

procedure TWkeWebCore.SetOnMouseOverUrlChange(const Value: TOnUrlChangeEvent);
begin
  FOnMouseOverUrlChange := Value;
end;

procedure TWkeWebCore.SetOnPromptBox(const Value: TOnPromptBoxEvent);
begin
  FOnPromptBox := Value;
end;

procedure TWkeWebCore.SetOnTitleChange(const Value: TOnTitleChangeEvent);
begin
  FOnTitleChange := Value;
end;

procedure TWkeWebCore.SetOnUrlChange(const Value: TOnUrlChangeEvent);
begin
  FOnUrlChange := Value;
end;

procedure TWkeWebCore.SetOnWindowClosing(const Value: TOnWindowClosingEvent);
begin
  FOnWindowClosing := Value;
end;

procedure TWkeWebCore.SetOnWindowDestroy(const Value: TNotifyEvent);
begin
  FOnWindowDestroy := Value;
end;

procedure TWkeWebCore.SetPopupEnabled(const Value: boolean);
begin
  FpopupEnabled := Value;
  if Assigned(theWebView) then
    wkeSetNavigationToNewWindowEnable(theWebView, Value);
end;

procedure TWkeWebCore.SetProxy(const Value: TwkeProxy);
begin
  FProxy := Value;
  if Assigned(theWebView) then
    wkeSetproxy(@Value);
end;

procedure TWkeWebCore.SetTouchEnabled(const Value: boolean);
begin
  FTouchEnabled := Value;
  if Assigned(theWebView) then
    wkeSetTouchEnabled(theWebView, Value);
end;

procedure TWkeWebCore.setUserAgent(const Value: string);
begin
  FUserAgent := Value;
  if Assigned(theWebView) then
  begin
{$IFDEF UNICODE}
    wkeSetUserAgentw(theWebView, PChar(Value));
{$ELSE}
    wkeSetUserAgent(theWebView, PansiChar(AnsiString(Value)));
{$ENDIF}
  end;
end;

procedure TWkeWebCore.SetWindowtype(Value: wkeWindowType);
begin
  FWindowtype := Value;
end;

procedure TWkeWebCore.SetCookieDir(const Value: string);
begin
  if DirectoryExists(Value) then
    FCookieDir := Value;
  if Assigned(theWebView) then
    wkeSetCookieJarPath(theWebView, PwideChar(Value));
end;

procedure TWkeWebCore.SetZoom(const Value: Integer);
begin
  if Assigned(theWebView) then
  begin
    // thewebview.ZoomFactor := LogN(1.2, Value / 100);
    wkeSetZoomFactor(theWebView, Value);
  end;
end;

procedure TWkeWebCore.ShowDevTool;
begin
  if Assigned(theWebView) then
    wkeSetDebugConfig(theWebView, 'showDevTools',
      PansiChar(ansitoutf8(ExtractFilePath(ParamStr(0)) + '\front_end\inspector.html')));
end;

procedure TWkeWebCore.Stop;
begin
  if Assigned(theWebView) then
    wkeStopLoading(theWebView);
end;

end.
