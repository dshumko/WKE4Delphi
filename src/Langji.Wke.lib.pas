unit Langji.Wke.lib;

interface

uses
  windows, sysutils,
  Langji.Wke.types;

// ================================wkeWebView============================
var
  wkeLibHandle: THandle = 0;
  wkeUserAgent
    : string =
    'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.1650.63 Safari/537.36 Langji.WKE 1.2';
{$IFDEF WIN64}
  wkeLibFileName: string = 'miniblink_x64.dll';
{$ELSE}
  wkeLibFileName: string = 'miniblink.dll';
{$ENDIF}
  wkePluginDir: string = '';
  wkeIsInDll: Boolean = false; // 是否在dll中运行
  wkeIsInit: Boolean = false;

  // -------------------------------------
  wkeInitialize: procedure; cdecl;
  wkeInitializeEx: procedure(settings: PwkeSettings); cdecl;
  wkeConfigure: procedure(settings: PwkeSettings); cdecl;
  wkeFinalize: procedure; cdecl;
  wkeUpdate: procedure; cdecl;
  wkeGetVersion: function(): Integer; cdecl;
  wkeGetVersionString: function(): putf8; cdecl;
  wkeSetFileSystem: procedure(pfn_open: FILE_OPEN; pfn_close: FILE_CLOSE; pfn_size: FILE_SIZE; pfn_read: FILE_READ;
    pfn_seek: FILE_SEEK); cdecl;
  wkeCreateWebView: function(): wkeWebView; cdecl;
  wkeGetWebView: function(name: Pchar): wkeWebView; cdecl;
  wkeDestroyWebView: procedure(webView: wkeWebView); cdecl;
  wkeGetName: function(webView: wkeWebView): PAnsiChar; cdecl;
  wkeSetName: procedure(webView: wkeWebView; name: PAnsiChar); cdecl;
  wkeIsTransparent: function(webView: wkeWebView): Boolean; cdecl;
  wkeSetTransparent: procedure(webView: wkeWebView; transparent: Boolean); cdecl;
  wkeSetUserAgent: procedure(webView: wkeWebView; userAgent: putf8); cdecl;
  wkeSetUserAgentW: procedure(webView: wkeWebView; userAgent: Pwchar_t); cdecl;
  wkeLoadURL: procedure(webView: wkeWebView; url: putf8); cdecl;
  wkeLoadURLW: procedure(webView: wkeWebView; url: Pwchar_t); cdecl;
  wkePostURL: procedure(wkeView: wkeWebView; url: putf8; postData: PAnsiChar; postLen: Integer); cdecl;
  wkePostURLW: procedure(wkeView: wkeWebView; url: Pwchar_t; postData: PAnsiChar; postLen: Integer); cdecl;
  wkeLoadHTML: procedure(webView: wkeWebView; html: putf8); cdecl;
  wkeLoadHTMLW: procedure(webView: wkeWebView; html: Pwchar_t); cdecl;
  wkeLoadFile: procedure(webView: wkeWebView; filename: putf8); cdecl;
  wkeLoadFileW: procedure(webView: wkeWebView; filename: Pwchar_t); cdecl;
  wkeLoad: procedure(webView: wkeWebView; str: putf8); cdecl;
  wkeLoadW: procedure(webView: wkeWebView; str: Pwchar_t); cdecl;
  wkeIsLoading: function(webView: wkeWebView): Boolean; cdecl;
  wkeIsDocumentReady: function(webView: wkeWebView): Boolean; cdecl;
  wkeStopLoading: procedure(webView: wkeWebView); cdecl;
  wkeReload: procedure(webView: wkeWebView); cdecl;
  wkeGetTitle: function(webView: wkeWebView): putf8; cdecl;
  wkeGetTitleW: function(webView: wkeWebView): Pwchar_t; cdecl;
  wkeResize: procedure(webView: wkeWebView; w: Integer; h: Integer); cdecl;
  wkeGetWidth: function(webView: wkeWebView): Integer; cdecl;
  wkeGetHeight: function(webView: wkeWebView): Integer; cdecl;
  wkeGetContentWidth: function(webView: wkeWebView): Integer; cdecl;
  wkeGetContentHeight: function(webView: wkeWebView): Integer; cdecl;
  wkePaint: procedure(webView: wkeWebView; bits: Pointer; bufWid: Integer; bufHei: Integer; xDst: Integer;
    yDst: Integer; w: Integer; h: Integer; xSrc: Integer; ySrc: Integer; bCopyAlpha: Boolean); cdecl;
  wkePaint2: procedure(webView: wkeWebView; bits: Pointer; pitch: Integer); cdecl;
  wkeGetViewDC: function(webView: wkeWebView): HDC; cdecl;
  wkeCanGoBack: function(webView: wkeWebView): Boolean; cdecl;
  wkeGoBack: function(webView: wkeWebView): Boolean; cdecl;
  wkeCanGoForward: function(webView: wkeWebView): Boolean; cdecl;
  wkeGoForward: function(webView: wkeWebView): Boolean; cdecl;
  wkeEditorSelectAll: procedure(webView: wkeWebView); cdecl;
  wkeEditorCopy: procedure(webView: wkeWebView); cdecl;
  wkeEditorCut: procedure(webView: wkeWebView); cdecl;
  wkeEditorPaste: procedure(webView: wkeWebView); cdecl;
  wkeEditorDelete: procedure(webView: wkeWebView); cdecl;
  wkeEditorUndo: procedure(webView: wkeWebView); cdecl;
  wkeGetCookieW: function(webView: wkeWebView): Pwchar_t; cdecl;
  wkeGetCookie: function(webView: wkeWebView): putf8; cdecl;
  wkeSetCookieEnabled: procedure(webView: wkeWebView; enable: Boolean); cdecl;
  wkeIsCookieEnabled: function(webView: wkeWebView): Boolean; cdecl;
  wkeSetMediaVolume: procedure(webView: wkeWebView; volume: Single); cdecl;
  wkeGetMediaVolume: function(webView: wkeWebView): Single; cdecl;
  wkeFireMouseEvent: function(webView: wkeWebView; AMessage: Cardinal; x: Integer; y: Integer; flags: LongInt)
    : Boolean; cdecl;
  wkeFireContextMenuEvent: function(webView: wkeWebView; x: Integer; y: Integer; flags: LongInt): Boolean; cdecl;
  wkeFireMouseWheelEvent: function(webView: wkeWebView; x: Integer; y: Integer; delta: Integer; flags: LongInt)
    : Boolean; cdecl;
  wkeFireKeyUpEvent: function(webView: wkeWebView; virtualKeyCode: LongInt; flags: LongInt; systemKey: Boolean)
    : Boolean; cdecl;
  wkeFireKeyDownEvent: function(webView: wkeWebView; virtualKeyCode: LongInt; flags: LongInt; systemKey: Boolean)
    : Boolean; cdecl;
  wkeFireKeyPressEvent: function(webView: wkeWebView; charCode: LongInt; flags: LongInt; systemKey: Boolean)
    : Boolean; cdecl;
  wkeSetFocus: procedure(webView: wkeWebView); cdecl;
  wkeKillFocus: procedure(webView: wkeWebView); cdecl;
  wkeGetCaretRect: function(webView: wkeWebView): wkeRect; cdecl;
  wkeRunJS: function(webView: wkeWebView; script: putf8): jsValue; cdecl;
  wkeRunJSW: function(webView: wkeWebView; script: Pwchar_t): jsValue; cdecl;
  wkeGlobalExec: function(webView: wkeWebView): jsExecState; cdecl;
  wkeSleep: procedure(webView: wkeWebView); cdecl;
  wkeWake: procedure(webView: wkeWebView); cdecl;
  wkeIsAwake: function(webView: wkeWebView): Boolean; cdecl;
  wkeSetZoomFactor: procedure(webView: wkeWebView; factor: Single); cdecl;
  wkeGetZoomFactor: function(webView: wkeWebView): Single; cdecl;
  wkeSetEditable: procedure(webView: wkeWebView; editable: Boolean); cdecl;

  wkeGetString: function(AString: wkeString): putf8; cdecl;
  wkeGetStringW: function(AString: wkeString): Pwchar_t; cdecl;
  wkeSetString: procedure(AString: wkeString; str: putf8; len: size_t); cdecl;
  wkeSetStringW: procedure(AString: wkeString; str: Pwchar_t; len: size_t); cdecl;
  wkeOnTitleChanged: procedure(webView: wkeWebView; callback: wkeTitleChangedCallback; callbackParam: Pointer); cdecl;
  wkeOnURLChanged: procedure(webView: wkeWebView; callback: wkeURLChangedCallback; callbackParam: Pointer); cdecl;
  wkeOnPaintUpdated: procedure(webView: wkeWebView; callback: wkePaintUpdatedCallback; callbackParam: Pointer); cdecl;
  wkeOnAlertBox: procedure(webView: wkeWebView; callback: wkeAlertBoxCallback; callbackParam: Pointer); cdecl;
  wkeOnConfirmBox: procedure(webView: wkeWebView; callback: wkeConfirmBoxCallback; callbackParam: Pointer); cdecl;
  wkeOnPromptBox: procedure(webView: wkeWebView; callback: wkePromptBoxCallback; callbackParam: Pointer); cdecl;
  wkeOnNavigation: procedure(webView: wkeWebView; callback: wkeNavigationCallback; param: Pointer); cdecl;
  wkeOnCreateView: procedure(webView: wkeWebView; callback: wkeCreateViewCallback; param: Pointer); cdecl;
  wkeOnDocumentReady: procedure(webView: wkeWebView; callback: wkeDocumentReadyCallback; param: Pointer); cdecl;
  wkeOnLoadingFinish: procedure(webView: wkeWebView; callback: wkeLoadingFinishCallback; param: Pointer); cdecl;
  wkeOnConsoleMessage: procedure(webView: wkeWebView; callback: wkeConsoleMessageCallback;
    callbackParam: Pointer); cdecl;
  wkeNetOnResponse: procedure(webView: wkeWebView; callback: wkeNetResponseCallback; param: Pointer); cdecl;
  wkeCreateWebWindow: function(AType: wkeWindowType; parent: HWND; x: Integer; y: Integer; width: Integer;
    height: Integer): wkeWebView; cdecl;
  wkeDestroyWebWindow: procedure(webWindow: wkeWebView); cdecl;
  wkeGetWindowHandle: function(webWindow: wkeWebView): HWND; cdecl;
  wkeOnWindowClosing: procedure(webWindow: wkeWebView; callback: wkeWindowClosingCallback; param: Pointer); cdecl;
  wkeOnWindowDestroy: procedure(webWindow: wkeWebView; callback: wkeWindowDestroyCallback; param: Pointer); cdecl;
  wkeShowWindow: procedure(webWindow: wkeWebView; show: Boolean); cdecl;
  wkeEnableWindow: procedure(webWindow: wkeWebView; enable: Boolean); cdecl;
  wkeMoveWindow: procedure(webWindow: wkeWebView; x: Integer; y: Integer; width: Integer; height: Integer); cdecl;
  wkeMoveToCenter: procedure(webWindow: wkeWebView); cdecl;
  wkeResizeWindow: procedure(webWindow: wkeWebView; width: Integer; height: Integer); cdecl;
  wkeSetWindowTitle: procedure(webWindow: wkeWebView; title: putf8); cdecl;
  wkeSetWindowTitleW: procedure(webWindow: wkeWebView; title: Pwchar_t); cdecl;
  wkeSetCspCheckEnable: procedure(webWindow: wkeWebView; b: Boolean); cdecl;
  wkeSetNpapiPluginsEnabled: procedure(webWindow: wkeWebView; b: Boolean); cdecl;





  // ==============================================================================
  // 以下函数为MiniBlink特有
  // ==============================================================================

  wkeEditorUnSelect: procedure(webView: wkeWebView); cdecl; // 2019-09-06
  wkeGetHostHWND: function(webView: wkeWebView): HWND; cdecl; // 2019-09-06
  wkeClearCookie: procedure(webView: wkeWebView); cdecl; // 2019-09-06

  wkeGetURL: function(webWindow: wkeWebView): putf8; cdecl;
  /// <summary>
  /// 设置Cookie , cookie格式必须是:Set-cookie: PRODUCTINFO=webxpress; domain=.fidelity.com; path=/; secure
  /// </summary>
  wkeSetCookie: procedure(webWindow: wkeWebView; const url, cookie: putf8); cdecl; // minibink 新增
  wkeSetCookieJarPath: procedure(webWindow: wkeWebView; const path: Pwchar_t); cdecl;
  wkeWebFrameGetMainFrame: function(webWindow: wkeWebView): THandle; cdecl;
  // minibink 新增  2018.1.17
  wkeIsMainFrame: function(webWindow: wkeWebView; frameId: THandle): Boolean; cdecl; // minibink 新增  2018.1.17
  wkeRunJsByFrame: function(webWindow: wkeWebView; frameId: THandle; const script: putf8; isInClosure: Boolean)
    : jsValue; cdecl;
  // isInClosure表示是否在外层包个function() {}形式的闭包  注意：如果需要返回值，在isInClosure为true时，需要写return，为false则不用

  // const utf8* wkeGetFrameUrl(wkeWebView webView, wkeWebFrameHandle frameId)
  wkeGetFrameUrl: function(webWindow: wkeWebView; frameId: THandle): putf8; cdecl;
  wkeVisitAllCookie: procedure(webWindow: wkeWebView; params: Pointer; const visitor: wkeCookieVisitor); cdecl;
  wkeSetLocalStorageFullPath: procedure(webWindow: wkeWebView; const path: Pwchar_t); cdecl;
  wkePerformCookieCommand: procedure(command: wkeCookieCommand); cdecl;
  wkeSetHeadlessEnabled: procedure(webWindow: wkeWebView; b: Boolean); cdecl;
  wkeSetTouchEnabled: procedure(webWindow: wkeWebView; b: Boolean); cdecl;
  wkeSetMouseEnabled: procedure(webWindow: wkeWebView; b: Boolean); cdecl;
  wkeSetUIThreadCallback: procedure(webView: wkeWebView; callback: wkeCallUiThread; param: Pointer); cdecl;
  wkeOnLoadUrlBegin: procedure(webView: wkeWebView; callback: wkeLoadUrlBeginCallback; param: Pointer); cdecl;
  wkeOnLoadUrlEnd: procedure(webView: wkeWebView; callback: wkeLoadUrlEndCallback; param: Pointer); cdecl;
  wkeOnDownload: procedure(webView: wkeWebView; callback: wkeDownloadCallback; param: Pointer); cdecl;
  wkeOnDocumentReady2: procedure(webView: wkeWebView; callback: wkeDocumentReadyCallback2; param: Pointer); cdecl;
  wkeOnURLChanged2: procedure(webView: wkeWebView; callback: wkeURLChangedCallback2; callbackParam: Pointer); cdecl;
  wkeSetProxy: procedure(const proxy: pwkeProxy); cdecl;
  wkeSetViewProxy: procedure(webView: wkeWebView; proxy: pwkeProxy); cdecl;
  wkeSetDragEnable: procedure(webView: wkeWebView; b: Boolean); cdecl;
  wkeOnMouseOverUrlChanged: procedure(webView: wkeWebView; callback: wkeTitleChangedCallback;
    callbackParam: Pointer); cdecl;
  wkeAddPluginDirectory: procedure(webView: wkeWebView; const path: Pwchar_t); cdecl;
  wkeNetGetPostBody: function(job: Pointer): PwkePostBodyElements; cdecl;
  wkeNetGetRequestMethod: function(job: Pointer): wkeRequestType; cdecl;
  wkeSetDeviceParameter: procedure(webView: wkeWebView; const device, paramStr: putf8; paramInt: Integer;
    paramFloat: real); cdecl;

  // 设备的字符串。可取值有："navigator.maxTouchPoints"此时 paramInt 需要被设置，表示 touch 的点数
  // "navigator.platform"此时 paramStr 需要被设置，表示js里获取的 navigator.platform字符串。
  // "navigator.hardwareConcurrency"此时 paramInt 需要被设置，表示js里获取的 navigator.hardwareConcurrency 整数值。
  // "screen.width"此时 paramInt 需要被设置，表示js里获取的 screen.width 整数值。
  // "screen.height"此时 paramInt 需要被设置，表示js里获取的 screen.height 整数值。
  // "screen.availWidth"此时 paramInt 需要被设置，表示js里获取的 screen.availWidth 整数值。
  // "screen.availHeight"此时 paramInt 需要被设置，表示js里获取的 screen.availHeight 整数值。
  // "screen.pixelDepth"此时 paramInt 需要被设置，表示js里获取的 screen.pixelDepth
  // "screen.pixelDepth"目前等价于"screen.pixelDepth"。"window.devicePixelRatio"同上

  wkeGetSource: function(webView: wkeWebView): putf8; cdecl;
  wkeNetHookRequest: procedure(job: Pointer); cdecl;
  wkeSetNavigationToNewWindowEnable: procedure(webView: wkeWebView; b: Boolean); cdecl;
  wkeCreateWebCustomWindow: procedure(const info: pwkeWindowCreateInfo); cdecl;
  wkeUtilSerializeToMHTML: function(webView: wkeWebView): PAnsiChar; cdecl;

  // WKE_API void wkeSetDebugConfig(wkeWebView webView, const char* debugString, const char* param);
  { devtools功能。开启方式是：wkeSetDebugConfig(m_wkeView, "showDevTools", "E:/mycode/devtools/front_end/inspector.html(utf8编码)"); }
  wkeSetDebugConfig: procedure(webView: wkeWebView; const debugString, param: putf8); cdecl;
  {
    "showDevTools"	开启开发者工具，此时param要填写开发者工具的资源路径，如file:///c:/miniblink-release/front_end/inspector.html。注意param此时必须是utf8编码
    "wakeMinInterval"	设置帧率，默认值是10，值越大帧率越低
    "drawMinInterval"	设置帧率，默认值是3，值越大帧率越低
    "antiAlias"	设置抗锯齿渲染。param必须设置为"1"
    "minimumFontSize"	最小字体
    "minimumLogicalFontSize"	最小逻辑字体
    "defaultFontSize"	默认字体
    "defaultFixedFontSize"	默认fixed字体
    imageEnable：是否打开无图模式，param为“0”表示开启无图模式。
    jsEnable：是否禁用js，param为“0”表示禁用。
  }

  wkeFireWindowsMessage: function(webView: wkeWebView; HWND: HWND; msg: UInt; wParam: wParam; lParam: lParam;
    result: Pointer): Boolean; cdecl; // LRESULT
  // 向mb发送任意windows消息。不过目前mb主要用来处理光标相关。mb在无窗口模式下，要响应光标事件，需要通过本函数手动发送光标消息
  wkeNetSetHTTPHeaderField: procedure(webView: wkeWebView; key: PWideChar; value: PWideChar; response: Boolean); cdecl;



  // void wkeOnDidCreateScriptContext(wkeWebView webView, wkeDidCreateScriptContextCallback callback, void* callbackParam)
  // javascript的v8执行环境被创建时触发此回调 每个frame创建时都会触发此回调
  // void wkeOnWillReleaseScriptContext(wkeWebView webView, wkeWillReleaseScriptContextCallback callback, void* callbackParam)
  // 每个frame的javascript的v8执行环境被关闭时触发此回调
  // void wkeOnWillMediaLoad(wkeWebView webView, wkeWillMediaLoadCallback callback, void* callbackParam)
  // video等多媒体标签创建时触发此回调
  // void wkeSetUserKeyValue(wkeWebView webView, const char* key, void* value)
  // 对webView设置一个key value键值对。可以用来保存用户自己定义的任何指针
  // void* wkeGetUserKeyValue(wkeWebView webView, const char* key)



  // void wkeLoadHtmlWithBaseUrl(wkeWebView webView, const utf8* html, const utf8* baseUrl)
  // 加载一段html，但可以指定baseURL，也就是相对于哪个目录的url
  // void wkeNetSetHTTPHeaderField(void* jobPtr, wchar_t* key, wchar_t* value, bool response)
  // 在wkeOnLoadUrlBegin回调里调用，表示设置http请求（或者file:///协议）的 http header field。response一直要被设置成false
  // const wkeSlist* wkeNetGetRawHttpHead(wkeNetJob jobPtr)     在wkeOnLoadUrlBegin回调里调用，获取curl返回的原生请求头
  // void wkeNetSetMIMEType(void* jobPtr, char* type)         wkeOnLoadUrlBegin回调里调用 表示设置http请求的MIME type
  // const char* wkeNetGetMIMEType(void* jobPtr, wkeString mime)  第2个参数可以传nullptr;

  // void wkeNetSetData(void* jobPtr, void* buf, int len)   在wkeOnLoadUrlEnd里被调用 表示设置hook后缓存的数据

  wkeNetCancelRequest: procedure(jobprt: Pointer); cdecl;
  // 在wkeOnLoadUrlBegin回调里调用，设置后，此请求将被取消。
  // int wkeNetGetFavicon(wkeWebView webView, wkeOnNetGetFavicon callback, void* param) 此接口必须在wkeOnLoadingFinish回调里调用。

  // wkePostBodyElements* wkeNetCreatePostBodyElements(wkeWebView webView, size_t length)
  // wkePostBodyElement* wkeNetCreatePostBodyElement(wkeWebView webView)
  // void wkeNetFreePostBodyElement(wkePostBodyElement* element)
  // void wkeNetFreePostBodyElements(wkePostBodyElements* elements)

  // void wkeJsBindFunction(const char* name, wkeJsNativeFunction fn, void* param, unsigned int argCount)
  // 和jsBindFunction功能类似，但更方便一点，可以传一个param做自定义数据。wkeJsBindFunction必须在webview创建前调用

  // 2021-3-1
  // void wkeSetViewSettings(wkeWebView webView, const wkeViewSettings* settings)
  wkeEnableHighDPISupport: procedure(); cdecl;
  wkeIsInitialize: procedure(); cdecl;
  wkeSetViewSettings: procedure(webWindow: wkeWebView; const settings: wkeViewSettings); cdecl;
  // 设置一些webview相关的设置.目前只有背景颜色可以设置
  wkeSetMemoryCacheEnable: procedure(webWindow: wkeWebView; b: Boolean); cdecl;
  // 开启内存缓存。网页的图片等都会在内存缓存里。关闭后，内存使用会降低一些，但容易引起一些问题，如果不懂怎么用，最好别开

  wkeSetHandle: procedure(webWindow: wkeWebView; h: HWND); cdecl;

  // **************************************2022-09-20*************************************//
  // void * wkeGetDebugConfig(wkeWebView webView, const char* debugString)
  wkeGetDebugConfig: function(webWindow: wkeWebView; const param: putf8): Pointer; cdecl;
  wkeSetSystemTouchEnabled: procedure(webWindow: wkeWebView; b: Boolean); cdecl;
  // void wkeSetContextMenuItemShow(wkeWebView webView, wkeMenuItemId item, bool isShow)
  // typedef enum _wkeMenuItemId {
  // kWkeMenuSelectedAllId = 1 << 1,
  // kWkeMenuSelectedTextId = 1 << 2,
  // kWkeMenuUndoId = 1 << 3,
  // kWkeMenuCopyImageId = 1 << 4,
  // kWkeMenuInspectElementAtId = 1 << 5,
  // kWkeMenuCutId = 1 << 6,
  // kWkeMenuPasteId = 1 << 7,
  // kWkeMenuPrintId = 1 << 8,
  // kWkeMenuGoForwardId = 1 << 9,
  // kWkeMenuGoBackId = 1 << 10,
  // kWkeMenuReloadId = 1 << 11,
  // kWkeMenuSaveImageId = 1 << 12,
  // } wkeMenuItemId;       设置指定的菜单项是否显示

  wkeSetContextMenuItemShow: procedure(webWindow: wkeWebView; itm: Integer; b: Boolean); cdecl;
  // void wkeSetLanguage(wkeWebView webView, const char* language)
  wkeSetLanguage: procedure(webWindow: wkeWebView; const lng: putf8); cdecl;
  // BOOL wkeIsLoadingFailed(wkeWebView webView)
  // BOOL wkeIsLoadingCompleted(wkeWebView webView)
  // void wkeUnlockViewDC(wkeWebView webView)
  // void wkeOnLoadUrlFail(wkeWebView webView, wkeLoadUrlFailCallback callback, void* callbackParam)
  // typedef void(WKE_CALL_TYPE* wkeLoadUrlFailCallback)(wkeWebView webView, void* param, const utf8* url, wkeNetJob job);
  // const char* wkeNetGetUrlByJob(wkeNetJob jobPtr)     通过jobPtr获取当前请求的url。
  // const wkeSlist* wkeNetGetRawHttpHead(wkeNetJob jobPtr)    获取Raw格式的HTTP请求数据
  // const wkeSlist* wkeNetGetRawResponseHead(wkeNetJob jobPtr)     获取Raw格式的HTTP响应数据。
  // typedef struct _wkeSlist {
  // char* data;
  // struct _wkeSlist* next;
  // } wkeSlist;

  // void wkeNetChangeRequestUrl(wkeNetJob jobPtr, const char* url)    修改当前请求的url。
  // wkeWebUrlRequestPtr wkeNetCreateWebUrlRequest(const utf8* url, const utf8* method, const utf8* mime)   创建一个网络请求
  // typedef blink::WebURLRequest* blinkWebURLRequestPtr;

  // void wkeNetDeleteBlinkWebURLRequestPtr(blinkWebURLRequestPtr request)     取消网络请求。
  // void wkeNetAddHTTPHeaderFieldToUrlRequest(wkeWebUrlRequestPtr request, const utf8* name, const utf8* value)在指定网络请求中插入一个请求头。
  // int wkeNetStartUrlRequest(wkeWebView webView, wkeWebUrlRequestPtr request, void* param, const wkeUrlRequestCallbacks* callbacks)开始网络请求，
  // typedef struct wkeWebUrlRequest* wkeWebUrlRequestPtr;
  // typedef struct wkeWebUrlResponse* wkeWebUrlResponsePtr;
  //
  // typedef void(WKE_CALL_TYPE* wkeOnUrlRequestWillRedirectCallback)(wkeWebView webView, void* param, wkeWebUrlRequestPtr oldRequest, wkeWebUrlRequestPtr request, wkeWebUrlResponsePtr redirectResponse);
  // typedef void(WKE_CALL_TYPE* wkeOnUrlRequestDidReceiveResponseCallback)(wkeWebView webView, void* param, wkeWebUrlRequestPtr request, wkeWebUrlResponsePtr response);
  // typedef void(WKE_CALL_TYPE* wkeOnUrlRequestDidReceiveDataCallback)(wkeWebView webView, void* param, wkeWebUrlRequestPtr request, const char* data, int dataLength);
  // typedef void(WKE_CALL_TYPE* wkeOnUrlRequestDidFailCallback)(wkeWebView webView, void* param, wkeWebUrlRequestPtr request, const utf8* error);
  // typedef void(WKE_CALL_TYPE* wkeOnUrlRequestDidFinishLoadingCallback)(wkeWebView webView, void* param, wkeWebUrlRequestPtr request, double finishTime);
  //
  // typedef struct _wkeUrlRequestCallbacks {
  // wkeOnUrlRequestWillRedirectCallback willRedirectCallback;
  // wkeOnUrlRequestDidReceiveResponseCallback didReceiveResponseCallback;
  // wkeOnUrlRequestDidReceiveDataCallback didReceiveDataCallback;
  // wkeOnUrlRequestDidFailCallback didFailCallback;
  // wkeOnUrlRequestDidFinishLoadingCallback didFinishLoadingCallback;
  // } wkeUrlRequestCallbacks;

  // int wkeNetGetHttpStatusCode(wkeWebUrlResponsePtr response)      获取HTTP响应状态码。
  // __int64 wkeNetGetExpectedContentLength(wkeWebUrlResponsePtr response)    获取响应数据大小。
  // const utf8* wkeNetGetResponseUrl(wkeWebUrlResponsePtr response)        获取响应url。
  // void wkeNetCancelWebUrlRequest(int requestId)              取消网络请求。

  // const wkePdfDatas* wkeUtilPrintToPdf(wkeWebView webView, wkeWebFrameHandle frameId, const wkePrintSettings* settings) 将页面输出为PDF格式，

  // const wkeMemBuf* wkePrintToBitmap(wkeWebView webView, wkeWebFrameHandle frameId, const wkeScreenshotSettings* settings)
  // 把页面输出为图片，wkeScreenshotSettings定义为：

  // typedef struct _wkeMemBuf {
  // int unuse;
  // void* data;
  // size_t length;
  // } wkeMemBuf;
  //
  // typedef struct _wkeScreenshotSettings {
  // int structSize;
  // int width;
  // int height;
  // } wkeScreenshotSettings;

  // ================================JScript============================

  jsBindFunction: procedure(name: PAnsiChar; fn: jsNativeFunction; AArgCount: LongInt); cdecl;
  jsBindGetter: procedure(name: PAnsiChar; fn: jsNativeFunction); cdecl;
  jsBindSetter: procedure(name: PAnsiChar; fn: jsNativeFunction); cdecl;
  jsArgCount: function(es: jsExecState): Integer; cdecl;
  jsArgType: function(es: jsExecState; argIdx: Integer): jsType; cdecl;
  jsArg: function(es: jsExecState; argIdx: Integer): jsValue; cdecl;
  jsTypeOf: function(v: jsValue): jsType; cdecl;
  jsIsNumber: function(v: jsValue): Boolean; cdecl;
  jsIsString: function(v: jsValue): Boolean; cdecl;
  jsIsBoolean: function(v: jsValue): Boolean; cdecl;
  jsIsObject: function(v: jsValue): Boolean; cdecl;
  jsIsFunction: function(v: jsValue): Boolean; cdecl;
  jsIsUndefined: function(v: jsValue): Boolean; cdecl;
  jsIsNull: function(v: jsValue): Boolean; cdecl;
  jsIsArray: function(v: jsValue): Boolean; cdecl;
  jsIsTrue: function(v: jsValue): Boolean; cdecl;
  jsIsFalse: function(v: jsValue): Boolean; cdecl;
  jsToInt: function(es: jsExecState; v: jsValue): Integer; cdecl;
  jsToFloat: function(es: jsExecState; v: jsValue): Single; cdecl;
  jsToDouble: function(es: jsExecState; v: jsValue): Double; cdecl;
  jsToBoolean: function(es: jsExecState; v: jsValue): Boolean; cdecl;
  jsToTempString: function(es: jsExecState; v: jsValue): putf8; cdecl;
  jsToTempStringW: function(es: jsExecState; v: jsValue): Pwchar_t; cdecl;
  jsInt: function(n: Integer): jsValue; cdecl;
  jsFloat: function(f: Single): jsValue; cdecl;
  jsDouble: function(d: Double): jsValue; cdecl;
  jsBoolean: function(b: Boolean): jsValue; cdecl;
  jsUndefined: function(): jsValue; cdecl;
  jsNull: function(): jsValue; cdecl;
  jsTrue: function(): jsValue; cdecl;
  jsFalse: function(): jsValue; cdecl;
  jsString: function(es: jsExecState; str: putf8): jsValue; cdecl;
  jsStringW: function(es: jsExecState; str: Pwchar_t): jsValue; cdecl;
  jsEmptyObject: function(es: jsExecState): jsValue; cdecl;
  jsEmptyArray: function(es: jsExecState): jsValue; cdecl;
  jsObject: function(es: jsExecState; obj: PjsData): jsValue; cdecl;
  jsFunction: function(es: jsExecState; obj: PjsData): jsValue; cdecl;
  jsGetData: function(es: jsExecState; AObject: jsValue): PjsData; cdecl;
  jsGet: function(es: jsExecState; AObject: jsValue; prop: PAnsiChar): jsValue; cdecl;
  jsSet: procedure(es: jsExecState; AObject: jsValue; prop: PAnsiChar; v: jsValue); cdecl;
  jsGetAt: function(es: jsExecState; AObject: jsValue; index: Integer): jsValue; cdecl;
  jsSetAt: procedure(es: jsExecState; AObject: jsValue; index: Integer; v: jsValue); cdecl;
  jsGetLength: function(es: jsExecState; AObject: jsValue): Integer; cdecl;
  jsSetLength: procedure(es: jsExecState; AObject: jsValue; length: Integer); cdecl;
  jsGlobalObject: function(es: jsExecState): jsValue; cdecl;
  jsGetWebView: function(es: jsExecState): wkeWebView; cdecl;
  jsEval: function(es: jsExecState; str: putf8): jsValue; cdecl;
  jsEvalW: function(es: jsExecState; str: Pwchar_t): jsValue; cdecl;
  jsCall: function(es: jsExecState; func: jsValue; thisObject: jsValue; args: PjsValue; argCount: Integer)
    : jsValue; cdecl;
  jsCallGlobal: function(es: jsExecState; func: jsValue; args: PjsValue; argCount: Integer): jsValue; cdecl;
  jsGetGlobal: function(es: jsExecState; prop: PAnsiChar): jsValue; cdecl;
  jsSetGlobal: procedure(es: jsExecState; prop: PAnsiChar; v: jsValue); cdecl;
  jsGC: procedure(); cdecl;

{$IFDEF UseVcFastCall}
procedure ProcessVcFastCall;
{$ENDIF UseVcFastCall}
function LoadWkeLibaraly(const wkeLibFilePath: string = ''): Boolean;

procedure UnLoadWkeLibaraly();

function WkeLoadLibAndInit: Boolean;

procedure WkeFinalizeAndUnloadLib;

function WkeStringtoString(const s: wkeString): string;

implementation

uses // dialogs,
  math;

{$IFDEF UseVcFastCall}

// 必须放在函数开始的第一行位置，否则会破坏ecx寄存器
procedure ProcessVcFastCall;
asm
  {$IFDEF DEBUG}
  MOV     [EBP - 4], ECX
  {$ELSE}
  MOV     EBX, ECX
  {$ENDIF DEBUG}
end;
{$ENDIF UseVcFastCall}

function WkeLoadLibAndInit: Boolean;
begin
  result := false;

  if wkeLibHandle = 0 then
  begin
    if LoadWkeLibaraly() then
    begin
      wkeInitialize;
      if wkePluginDir <> '' then
        wkeAddPluginDirectory(nil, PWideChar(WideString(wkePluginDir)));
      wkeIsInit := true;
      result := true;
    end;
  end;
end;

procedure WkeFinalizeAndUnloadLib;
begin
  if wkeLibHandle <> 0 then
  begin
    wkeFinalize;
    wkeIsInit := false;
    UnLoadWkeLibaraly;
  end;
end;

function LoadWkeLibaraly(const wkeLibFilePath: string = ''): Boolean;
begin
  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);
  result := false;

  wkeLibHandle := GetModuleHandle(Pchar(ExtractFileName(wkeLibFileName)));
  if wkeLibHandle = 0 then
  begin
    if (wkeLibFilePath <> '') and Fileexists(wkeLibFilePath) then
      wkeLibFileName := wkeLibFilePath;
    if Fileexists(wkeLibFileName) then
      wkeLibHandle := LoadLibrary(Pchar(wkeLibFileName));
  end;
  if wkeLibHandle = 0 then
    raise Exception.Create('Load ' + wkeLibFileName +
      ' Error,Please check the file(copy the dll file to application path)!');
  wkeInitialize := GetProcAddress(wkeLibHandle, 'wkeInitialize');
  wkeInitializeEx := GetProcAddress(wkeLibHandle, 'wkeInitializeEx');
  wkeConfigure := GetProcAddress(wkeLibHandle, 'wkeConfigure');
  wkeFinalize := GetProcAddress(wkeLibHandle, 'wkeFinalize');
  wkeUpdate := GetProcAddress(wkeLibHandle, 'wkeUpdate');
  wkeGetVersion := GetProcAddress(wkeLibHandle, 'wkeGetVersion');
  wkeGetVersionString := GetProcAddress(wkeLibHandle, 'wkeGetVersionString');
  wkeSetFileSystem := GetProcAddress(wkeLibHandle, 'wkeSetFileSystem');
  wkeCreateWebView := GetProcAddress(wkeLibHandle, 'wkeCreateWebView');
  wkeGetWebView := GetProcAddress(wkeLibHandle, 'wkeGetWebView');
  wkeDestroyWebView := GetProcAddress(wkeLibHandle, 'wkeDestroyWebView');
  wkeGetName := GetProcAddress(wkeLibHandle, 'wkeGetName');
  wkeSetName := GetProcAddress(wkeLibHandle, 'wkeSetName');
  wkeIsTransparent := GetProcAddress(wkeLibHandle, 'wkeIsTransparent');
  wkeSetTransparent := GetProcAddress(wkeLibHandle, 'wkeSetTransparent');
  wkeSetUserAgent := GetProcAddress(wkeLibHandle, 'wkeSetUserAgent');
  wkeSetUserAgentW := GetProcAddress(wkeLibHandle, 'wkeSetUserAgentW');
  wkeLoadURL := GetProcAddress(wkeLibHandle, 'wkeLoadURL');
  wkeLoadURLW := GetProcAddress(wkeLibHandle, 'wkeLoadURLW');
  wkePostURL := GetProcAddress(wkeLibHandle, 'wkePostURL');
  wkePostURLW := GetProcAddress(wkeLibHandle, 'wkePostURLW');
  wkeLoadHTML := GetProcAddress(wkeLibHandle, 'wkeLoadHTML');
  wkeLoadHTMLW := GetProcAddress(wkeLibHandle, 'wkeLoadHTMLW');
  wkeLoadFile := GetProcAddress(wkeLibHandle, 'wkeLoadFile');
  wkeLoadFileW := GetProcAddress(wkeLibHandle, 'wkeLoadFileW');
  wkeLoad := GetProcAddress(wkeLibHandle, 'wkeLoad');
  wkeLoadW := GetProcAddress(wkeLibHandle, 'wkeLoadW');
  wkeIsLoading := GetProcAddress(wkeLibHandle, 'wkeIsLoading');
  wkeIsDocumentReady := GetProcAddress(wkeLibHandle, 'wkeIsDocumentReady');
  wkeStopLoading := GetProcAddress(wkeLibHandle, 'wkeStopLoading');
  wkeReload := GetProcAddress(wkeLibHandle, 'wkeReload');
  wkeGetTitle := GetProcAddress(wkeLibHandle, 'wkeGetTitle');
  wkeGetTitleW := GetProcAddress(wkeLibHandle, 'wkeGetTitleW');
  wkeResize := GetProcAddress(wkeLibHandle, 'wkeResize');
  wkeGetWidth := GetProcAddress(wkeLibHandle, 'wkeGetWidth');
  wkeGetHeight := GetProcAddress(wkeLibHandle, 'wkeGetHeight');
  wkeGetContentWidth := GetProcAddress(wkeLibHandle, 'wkeGetContentWidth');
  wkeGetContentHeight := GetProcAddress(wkeLibHandle, 'wkeGetContentHeight');

  wkePaint := GetProcAddress(wkeLibHandle, 'wkePaint');
  wkePaint2 := GetProcAddress(wkeLibHandle, 'wkePaint2');
  wkeGetViewDC := GetProcAddress(wkeLibHandle, 'wkeGetViewDC');
  wkeCanGoBack := GetProcAddress(wkeLibHandle, 'wkeCanGoBack');
  wkeGoBack := GetProcAddress(wkeLibHandle, 'wkeGoBack');
  wkeCanGoForward := GetProcAddress(wkeLibHandle, 'wkeCanGoForward');
  wkeGoForward := GetProcAddress(wkeLibHandle, 'wkeGoForward');
  wkeEditorSelectAll := GetProcAddress(wkeLibHandle, 'wkeEditorSelectAll');
  wkeEditorCopy := GetProcAddress(wkeLibHandle, 'wkeEditorCopy');
  wkeEditorCut := GetProcAddress(wkeLibHandle, 'wkeEditorCut');
  wkeEditorPaste := GetProcAddress(wkeLibHandle, 'wkeEditorPaste');
  wkeEditorDelete := GetProcAddress(wkeLibHandle, 'wkeEditorDelete');
  wkeGetCookieW := GetProcAddress(wkeLibHandle, 'wkeGetCookieW');
  wkeGetCookie := GetProcAddress(wkeLibHandle, 'wkeGetCookie');
  wkeSetCookieEnabled := GetProcAddress(wkeLibHandle, 'wkeSetCookieEnabled');
  wkeIsCookieEnabled := GetProcAddress(wkeLibHandle, 'wkeIsCookieEnabled');
  wkeSetMediaVolume := GetProcAddress(wkeLibHandle, 'wkeSetMediaVolume');
  wkeGetMediaVolume := GetProcAddress(wkeLibHandle, 'wkeGetMediaVolume');
  wkeFireMouseEvent := GetProcAddress(wkeLibHandle, 'wkeFireMouseEvent');
  wkeFireContextMenuEvent := GetProcAddress(wkeLibHandle, 'wkeFireContextMenuEvent');
  wkeFireMouseWheelEvent := GetProcAddress(wkeLibHandle, 'wkeFireMouseWheelEvent');
  wkeFireKeyUpEvent := GetProcAddress(wkeLibHandle, 'wkeFireKeyUpEvent');
  wkeFireKeyDownEvent := GetProcAddress(wkeLibHandle, 'wkeFireKeyDownEvent');
  wkeFireKeyPressEvent := GetProcAddress(wkeLibHandle, 'wkeFireKeyPressEvent');
  wkeSetFocus := GetProcAddress(wkeLibHandle, 'wkeSetFocus');
  wkeKillFocus := GetProcAddress(wkeLibHandle, 'wkeKillFocus');
  wkeGetCaretRect := GetProcAddress(wkeLibHandle, 'wkeGetCaretRect');
  wkeRunJS := GetProcAddress(wkeLibHandle, 'wkeRunJS');
  wkeRunJSW := GetProcAddress(wkeLibHandle, 'wkeRunJSW');
  wkeGlobalExec := GetProcAddress(wkeLibHandle, 'wkeGlobalExec');
  wkeSleep := GetProcAddress(wkeLibHandle, 'wkeSleep');
  wkeWake := GetProcAddress(wkeLibHandle, 'wkeWake');
  wkeIsAwake := GetProcAddress(wkeLibHandle, 'wkeIsAwake');
  wkeSetZoomFactor := GetProcAddress(wkeLibHandle, 'wkeSetZoomFactor');
  wkeGetZoomFactor := GetProcAddress(wkeLibHandle, 'wkeGetZoomFactor');
  wkeSetEditable := GetProcAddress(wkeLibHandle, 'wkeSetEditable');
  wkeGetString := GetProcAddress(wkeLibHandle, 'wkeGetString');
  wkeGetStringW := GetProcAddress(wkeLibHandle, 'wkeGetStringW');
  wkeSetString := GetProcAddress(wkeLibHandle, 'wkeSetString');
  wkeSetStringW := GetProcAddress(wkeLibHandle, 'wkeSetStringW');
  wkeOnTitleChanged := GetProcAddress(wkeLibHandle, 'wkeOnTitleChanged');
  wkeOnURLChanged := GetProcAddress(wkeLibHandle, 'wkeOnURLChanged');
  wkeOnPaintUpdated := GetProcAddress(wkeLibHandle, 'wkeOnPaintUpdated');
  wkeOnAlertBox := GetProcAddress(wkeLibHandle, 'wkeOnAlertBox');
  wkeOnConfirmBox := GetProcAddress(wkeLibHandle, 'wkeOnConfirmBox');
  wkeOnPromptBox := GetProcAddress(wkeLibHandle, 'wkeOnPromptBox');
  wkeOnNavigation := GetProcAddress(wkeLibHandle, 'wkeOnNavigation');
  wkeOnCreateView := GetProcAddress(wkeLibHandle, 'wkeOnCreateView');
  wkeOnDocumentReady := GetProcAddress(wkeLibHandle, 'wkeOnDocumentReady');
  wkeOnLoadingFinish := GetProcAddress(wkeLibHandle, 'wkeOnLoadingFinish');
  wkeOnConsoleMessage := GetProcAddress(wkeLibHandle, 'wkeOnConsole');
  wkeNetOnResponse := GetProcAddress(wkeLibHandle, 'wkeNetOnResponse');
  wkeCreateWebWindow := GetProcAddress(wkeLibHandle, 'wkeCreateWebWindow');
  wkeDestroyWebWindow := GetProcAddress(wkeLibHandle, 'wkeDestroyWebWindow');
  wkeGetWindowHandle := GetProcAddress(wkeLibHandle, 'wkeGetWindowHandle');
  wkeOnWindowClosing := GetProcAddress(wkeLibHandle, 'wkeOnWindowClosing');
  wkeOnWindowDestroy := GetProcAddress(wkeLibHandle, 'wkeOnWindowDestroy');
  wkeShowWindow := GetProcAddress(wkeLibHandle, 'wkeShowWindow');
  wkeEnableWindow := GetProcAddress(wkeLibHandle, 'wkeEnableWindow');
  wkeMoveWindow := GetProcAddress(wkeLibHandle, 'wkeMoveWindow');
  wkeMoveToCenter := GetProcAddress(wkeLibHandle, 'wkeMoveToCenter');
  wkeResizeWindow := GetProcAddress(wkeLibHandle, 'wkeResizeWindow');
  wkeSetWindowTitle := GetProcAddress(wkeLibHandle, 'wkeSetWindowTitle');
  wkeSetWindowTitleW := GetProcAddress(wkeLibHandle, 'wkeSetWindowTitleW');

  wkeSetCookieJarPath := GetProcAddress(wkeLibHandle, 'wkeSetCookieJarPath');
  wkeSetCookie := GetProcAddress(wkeLibHandle, 'wkeSetCookie');
  wkeGetURL := GetProcAddress(wkeLibHandle, 'wkeGetURL');
  wkeWebFrameGetMainFrame := GetProcAddress(wkeLibHandle, 'wkeWebFrameGetMainFrame');
  wkeIsMainFrame := GetProcAddress(wkeLibHandle, 'wkeIsMainFrame');
  wkeRunJsByFrame := GetProcAddress(wkeLibHandle, 'wkeRunJsByFrame');

  wkeVisitAllCookie := GetProcAddress(wkeLibHandle, 'wkeVisitAllCookie');
  wkeSetLocalStorageFullPath := GetProcAddress(wkeLibHandle, 'wkeSetLocalStorageFullPath');
  wkePerformCookieCommand := GetProcAddress(wkeLibHandle, 'wkePerformCookieCommand');
  wkeNetCancelRequest := GetProcAddress(wkeLibHandle, 'wkeNetCancelRequest');
  wkeSetHeadlessEnabled := GetProcAddress(wkeLibHandle, 'wkeSetHeadlessEnabled');
  wkeSetTouchEnabled := GetProcAddress(wkeLibHandle, 'wkeSetTouchEnabled');
  wkeSetMouseEnabled := GetProcAddress(wkeLibHandle, 'wkeSetMouseEnabled');
  wkeSetUIThreadCallback := GetProcAddress(wkeLibHandle, 'wkeSetUIThreadCallback');
  wkeOnLoadUrlBegin := GetProcAddress(wkeLibHandle, 'wkeOnLoadUrlBegin');
  wkeOnLoadUrlEnd := GetProcAddress(wkeLibHandle, 'wkeOnLoadUrlEnd');
  wkeOnDownload := GetProcAddress(wkeLibHandle, 'wkeOnDownload');
  wkeOnDocumentReady2 := GetProcAddress(wkeLibHandle, 'wkeOnDocumentReady2');
  wkeOnURLChanged2 := GetProcAddress(wkeLibHandle, 'wkeOnURLChanged2');
  wkeSetProxy := GetProcAddress(wkeLibHandle, 'wkeSetProxy');
  wkeSetViewProxy := GetProcAddress(wkeLibHandle, 'wkeSetViewProxy');
  wkeGetFrameUrl := GetProcAddress(wkeLibHandle, 'wkeGetFrameUrl');
  wkeNetGetPostBody := GetProcAddress(wkeLibHandle, 'wkeNetGetPostBody');
  wkeNetGetRequestMethod := GetProcAddress(wkeLibHandle, 'wkeNetGetRequestMethod');
  wkeSetDebugConfig := GetProcAddress(wkeLibHandle, 'wkeSetDebugConfig');
  wkeSetDragEnable := GetProcAddress(wkeLibHandle, 'wkeSetDragEnable');
  wkeOnMouseOverUrlChanged := GetProcAddress(wkeLibHandle, 'wkeOnMouseOverUrlChanged');
  wkeSetDeviceParameter := GetProcAddress(wkeLibHandle, 'wkeSetDeviceParameter');
  wkeAddPluginDirectory := GetProcAddress(wkeLibHandle, 'wkeAddPluginDirectory');
  wkeGetSource := GetProcAddress(wkeLibHandle, 'wkeGetSource');
  wkeNetHookRequest := GetProcAddress(wkeLibHandle, 'wkeNetHookRequest');
  wkeSetNavigationToNewWindowEnable := GetProcAddress(wkeLibHandle, 'wkeSetNavigationToNewWindowEnable');
  wkeSetNpapiPluginsEnabled := GetProcAddress(wkeLibHandle, 'wkeSetNpapiPluginsEnabled');
  wkeSetCspCheckEnable := GetProcAddress(wkeLibHandle, 'wkeSetCspCheckEnable');
  wkeCreateWebCustomWindow := GetProcAddress(wkeLibHandle, 'wkeCreateWebCustomWindow');
  wkeUtilSerializeToMHTML := GetProcAddress(wkeLibHandle, 'wkeUtilSerializeToMHTML');
  wkeFireWindowsMessage := GetProcAddress(wkeLibHandle, 'wkeFireWindowsMessage');
  wkeNetSetHTTPHeaderField := GetProcAddress(wkeLibHandle, 'wkeNetSetHTTPHeaderField');

  //
  wkeEnableHighDPISupport := GetProcAddress(wkeLibHandle, 'wkeEnableHighDPISupport');
  wkeIsInitialize := GetProcAddress(wkeLibHandle, 'wkeIsInitialize');

  wkeSetViewSettings := GetProcAddress(wkeLibHandle, 'wkeSetViewSettings');
  wkeSetMemoryCacheEnable := GetProcAddress(wkeLibHandle, 'wkeSetMemoryCacheEnable');
  wkeSetHandle := GetProcAddress(wkeLibHandle, 'wkeSetHandle');
  wkeSetContextMenuItemShow := GetProcAddress(wkeLibHandle, 'wkeSetContextMenuItemShow');
  wkeSetLanguage := GetProcAddress(wkeLibHandle, 'wkeSetLanguage');
  wkeGetDebugConfig := GetProcAddress(wkeLibHandle, 'wkeGetDebugConfig');

  wkeSetSystemTouchEnabled := GetProcAddress(wkeLibHandle, 'wkeSetSystemTouchEnabled');
  //
  jsBindFunction := GetProcAddress(wkeLibHandle, 'jsBindFunction');
  jsBindGetter := GetProcAddress(wkeLibHandle, 'jsBindGetter');
  jsBindSetter := GetProcAddress(wkeLibHandle, 'jsBindSetter');
  jsArgCount := GetProcAddress(wkeLibHandle, 'jsArgCount');
  jsArgType := GetProcAddress(wkeLibHandle, 'jsArgType');
  jsArg := GetProcAddress(wkeLibHandle, 'jsArg');
  jsTypeOf := GetProcAddress(wkeLibHandle, 'jsTypeOf');
  jsIsNumber := GetProcAddress(wkeLibHandle, 'jsIsNumber');
  jsIsString := GetProcAddress(wkeLibHandle, 'jsIsString');
  jsIsBoolean := GetProcAddress(wkeLibHandle, 'jsIsBoolean');
  jsIsObject := GetProcAddress(wkeLibHandle, 'jsIsObject');
  jsIsFunction := GetProcAddress(wkeLibHandle, 'jsIsFunction');
  jsIsUndefined := GetProcAddress(wkeLibHandle, 'jsIsUndefined');
  jsIsNull := GetProcAddress(wkeLibHandle, 'jsIsNull');
  jsIsArray := GetProcAddress(wkeLibHandle, 'jsIsArray');
  jsIsTrue := GetProcAddress(wkeLibHandle, 'jsIsTrue');
  jsIsFalse := GetProcAddress(wkeLibHandle, 'jsIsFalse');
  jsToInt := GetProcAddress(wkeLibHandle, 'jsToInt');
  jsToFloat := GetProcAddress(wkeLibHandle, 'jsToFloat');
  jsToDouble := GetProcAddress(wkeLibHandle, 'jsToDouble');
  jsToBoolean := GetProcAddress(wkeLibHandle, 'jsToBoolean');
  jsToTempString := GetProcAddress(wkeLibHandle, 'jsToTempString');
  jsToTempStringW := GetProcAddress(wkeLibHandle, 'jsToTempStringW');
  jsInt := GetProcAddress(wkeLibHandle, 'jsInt');
  jsFloat := GetProcAddress(wkeLibHandle, 'jsFloat');
  jsDouble := GetProcAddress(wkeLibHandle, 'jsDouble');
  jsBoolean := GetProcAddress(wkeLibHandle, 'jsBoolean');
  jsUndefined := GetProcAddress(wkeLibHandle, 'jsUndefined');
  jsNull := GetProcAddress(wkeLibHandle, 'jsNull');
  jsTrue := GetProcAddress(wkeLibHandle, 'jsTrue');
  jsFalse := GetProcAddress(wkeLibHandle, 'jsFalse');
  jsString := GetProcAddress(wkeLibHandle, 'jsString');
  jsStringW := GetProcAddress(wkeLibHandle, 'jsStringW');
  jsEmptyObject := GetProcAddress(wkeLibHandle, 'jsEmptyObject');
  jsEmptyArray := GetProcAddress(wkeLibHandle, 'jsEmptyArray');
  jsObject := GetProcAddress(wkeLibHandle, 'jsObject');
  jsFunction := GetProcAddress(wkeLibHandle, 'jsFunction');
  jsGetData := GetProcAddress(wkeLibHandle, 'jsGetData');
  jsGet := GetProcAddress(wkeLibHandle, 'jsGet');
  jsSet := GetProcAddress(wkeLibHandle, 'jsSet');
  jsGetAt := GetProcAddress(wkeLibHandle, 'jsGetAt');
  jsSetAt := GetProcAddress(wkeLibHandle, 'jsSetAt');
  jsGetLength := GetProcAddress(wkeLibHandle, 'jsGetLength');
  jsSetLength := GetProcAddress(wkeLibHandle, 'jsSetLength');
  jsGlobalObject := GetProcAddress(wkeLibHandle, 'jsGlobalObject');
  jsGetWebView := GetProcAddress(wkeLibHandle, 'jsGetWebView');
  jsEval := GetProcAddress(wkeLibHandle, 'jsEval');
  jsEvalW := GetProcAddress(wkeLibHandle, 'jsEvalW');
  jsCall := GetProcAddress(wkeLibHandle, 'jsCall');
  jsCallGlobal := GetProcAddress(wkeLibHandle, 'jsCallGlobal');
  jsGetGlobal := GetProcAddress(wkeLibHandle, 'jsGetGlobal');
  jsSetGlobal := GetProcAddress(wkeLibHandle, 'jsSetGlobal');
  jsGC := GetProcAddress(wkeLibHandle, 'jsGC');

  result := (wkeLibHandle <> 0);

end;

function WkeStringtoString(const s: wkeString): string;
begin
{$IFDEF UNICODE}
  result := wkeGetStringW(s);
{$ELSE}
  result := {$IFDEF FPC}wkeGetString(s){$ELSE}Utf8ToAnsi(wkeGetString(s)){$ENDIF};
{$ENDIF}
end;

procedure UnLoadWkeLibaraly();
begin
  if wkeLibHandle > 0 then
  begin
    FreeLibrary(wkeLibHandle);
    wkeLibHandle := 0;
  end;
end;

end.
