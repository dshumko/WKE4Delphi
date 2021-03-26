unit Langji.Wke.CoreInterface;

interface

uses
  Langji.Wke.types, Classes, Windows;

type
  IWkeCore = interface
    // 方法
    procedure CreateWebView;
    procedure GoBack;
    procedure GoForward;
    procedure Refresh;
    procedure Stop;
    procedure CloseWebView;
    procedure ShowDevTool;
    procedure SetFocusToWebbrowser;
    procedure LoadCookies(const cks, Aurl: string);
    procedure LoadFile(const AFile: string);
    procedure LoadHtml(const Astr: string);
    procedure LoadUrl(const Aurl: string);
    procedure PostUrl(const Aurl: string; const ApostData : String);
    function GetSource: string;
    function GetJsBoolResult(const js: string): boolean;
    function GetJsTextResult(const js: string): string;
    procedure KeyEvent(const vkcode: Integer; const flag: Integer = 0);
    procedure MouseEvent(const msg: Cardinal; const x, y: Integer; const flag: Integer = WKE_LBUTTON);
    function ExecuteJavascript(const js: string): boolean; overload;
    function ExecuteJavascript(const js: string; var r: jsValue): boolean; overload;
    // 属性
    function GetBoundRect: Trect;
    function GetCanBack: boolean;
    function GetCanForward: boolean;
    function GetCaption: string;
    function GetContentHeight: Integer;
    function GetContentWidth: Integer;
    function GetCookie: string;
    function GetCookieDir: string;
    function GetCookieEnabled: boolean;
    function GetCspEnabled: boolean;
    function GetDocumentReady: boolean;
    function GetDragEnabled: boolean;
    function GetGlobalHttpProxy: string;
    function GetHeadless: boolean;
    function GetLoadFinished: boolean;
    function GetLocalStoragePath: string;
    function GetLocationTitle: string;
    function GetLocationUrl: string;
    function GetPopupEnabled: boolean;
    function GetProxy: TwkeProxy;
    function GetTouchEnabled: boolean;
    function GetUserAgent: string;
    function GetWebHandle: Hwnd;
    function GetWebViewDC: HDC;
    function GetWebview: TwkeWebView;
    function GetWindowtype: wkeWindowType;
    function GetZoom: Integer;
    procedure SetBoundsRect(const Value: Trect);
    procedure SetCaption(const Value: string);
    procedure SetCookie(const Value: string);
    procedure SetCookieDir(const Value: string);
    procedure SetCookieEnabled(const Value: boolean);
    procedure SetCspEnabled(const Value: boolean);
    procedure SetDeviceParam(const keyname, keyvalue: string); overload;
    procedure SetDeviceParam(const keyname: string; const keyvalue: Integer); overload;
    procedure SetDragEnabled(const Value: boolean);
    procedure SetGlobalHttpProxy(const Value: string);
    procedure SetHeadless(const Value: boolean);
    procedure SetHttpProxy(const Value: string);
    procedure SetLocaStoragePath(const Value: string);
    procedure SetPopupEnabled(const Value: boolean);
    procedure SetProxy(const Value: TwkeProxy);
    procedure SetTouchEnabled(const Value: boolean);
    procedure SetUserAgent(const Value: string);
    procedure SetWindowtype(Value: wkeWindowType);
    procedure SetZoom(const Value: Integer);
    // 事件
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

    // 不可视属性
    property BoundsRect: Trect read GetBoundRect write SetBoundsRect;
    property CanBack: boolean read GetCanBack;
    property CanForward: boolean read GetCanForward;
    property DocumentReady: boolean read GetDocumentReady;
    property HttpProxy: string write SetHttpProxy;
    property LoadFinished: boolean read GetLoadFinished; // 加载完成
    property LocationTitle: string read GetLocationTitle;
    property LocationUrl: string read GetLocationUrl;
    property Proxy: TwkeProxy read GetProxy write SetProxy;
    property WebView: TwkeWebView read GetWebview;
    property WebViewHandle: Hwnd read GetWebHandle;
    property WindowType: wkeWindowType read GetWindowtype write SetWindowtype;
    property ZoomPercent: Integer read GetZoom write SetZoom;
    // 可视属性
    property Caption: string read GetCaption write SetCaption;
    property Cookie: string read GetCookie write SetCookie;
    property CookieEnabled: boolean read GetCookieEnabled write SetCookieEnabled;
    property CookiePath: string read GetCookieDir write SetCookieDir;
    property CspEnabled: boolean read GetCspEnabled write SetCspEnabled;
    property DragEnabled: boolean read GetDragEnabled write SetDragEnabled;
    property GlobalHttpProxy: string read GetGlobalHttpProxy write SetGlobalHttpProxy;
    property Headless: boolean read GetHeadless write SetHeadless;
    property LocalStoragePath: string read GetLocalStoragePath write SetLocaStoragePath;
    property PopupEnabled: boolean read GetPopupEnabled write SetPopupEnabled;
    property TouchEnabled: boolean read GetTouchEnabled write SetTouchEnabled;
    property UserAgent: string read GetUserAgent write SetUserAgent;
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

end.
