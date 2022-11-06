unit Langji.Wke.App;

interface

uses
  windows, messages, controls, classes, Langji.Wke.lib, Langji.Wke.Webbrowser, Langji.Wke.types,
  Langji.Wke.CoreInterface, Langji.Wke.WebCore;

type
  TOnNewWindowEvent = procedure(Sender: TObject; sUrl: string; navigationType: wkeNavigationType;
    windowFeatures: PwkeWindowFeatures; var openflg: TNewWindowFlag; var webbrow: IWkeCore) of object;

  TWkeApp = class(TComponent)
  private
    FWebPages: TList{$IFDEF DELPHI15_UP}<IWkeCore>{$ENDIF};
    FUserAgent: string;
    FCspEnabled: boolean;
    FCookieEnabled: boolean;
    FTouchEnabled: boolean;
    FDragEnabled: boolean;
    FCookiePath: string;
    FLocalStoragePath: string;
    FOnNewWindow: TOnNewWindowEvent;
    function GetCookieDir: string;
    function GetCookieEnabled: boolean;
    function GetCspEnabled: boolean;
    function GetDragEnabled: boolean;
    function GetLocalStoragePath: string;
    function GetTouchEnabled: boolean;
    function GetUserAgent: string;
    procedure SetCookieDir(const Value: string);
    procedure SetCookieEnabled(const Value: boolean);
    procedure SetCspEnabled(const Value: boolean);
    procedure SetDragEnabled(const Value: boolean);
    procedure SetLocaStoragePath(const Value: string);
    procedure SetTouchEnabled(const Value: boolean);
    procedure SetUserAgent(const Value: string);
    procedure DoAppCreateView(Sender: TObject; sUrl: string; navigationType: wkeNavigationType;
      windowFeatures: PwkeWindowFeatures; var wvw: wkeWebView);
  protected
    procedure loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function CreateWebbrowser(Aparent: TWinControl): TWkeWebbrowser; overload;
    function CreateWebbrowser(Aparent: TWinControl; Ar: Trect): TWkeWebbrowser; overload;
    procedure CloseWebbrowser(Abrowser: TWkeWebbrowser);
  published
    property UserAgent: string read GetUserAgent write SetUserAgent;
    property CookieEnabled: boolean read GetCookieEnabled write SetCookieEnabled default true;
    property CookiePath: string read GetCookieDir write SetCookieDir;
    property LocalStoragePath: string read GetLocalStoragePath write SetLocaStoragePath;
    property CspEnabled: boolean read GetCspEnabled write SetCspEnabled default false;
    property TouchEnabled: boolean read GetTouchEnabled write SetTouchEnabled;
    property DragEnabled: boolean read GetDragEnabled write SetDragEnabled;
    property OnNewWindow: TOnNewWindowEvent read FOnNewWindow write FOnNewWindow;
  end;

implementation

{ TWkeApp }

constructor TWkeApp.Create(AOwner: TComponent);
begin
  inherited;
  FUserAgent := wkeUserAgent;
  FCookieEnabled := true;
  FCspEnabled := false;
  FTouchEnabled := false;
  FDragEnabled := false;
  FLocalStoragePath := '';
  FCookiePath := '';
  FWebPages := TList{$IFDEF DELPHI15_UP}<IWkeCore>{$ENDIF}.Create;
end;

destructor TWkeApp.Destroy;
begin
  FWebPages.Clear;
  FWebPages.Free;
  inherited;
end;

procedure TWkeApp.DoAppCreateView(Sender: TObject; sUrl: string; navigationType: wkeNavigationType;
  windowFeatures: PwkeWindowFeatures; var wvw: wkeWebView);
var
  Openflag: TNewWindowFlag;
  NewWebpage: IWkeCore;
begin
  NewWebpage := nil;
  wvw := nil;
  Openflag := nwf_NewPage;
  if Assigned(FOnNewWindow) then
    FOnNewWindow(self, sUrl, navigationType, windowFeatures, Openflag, NewWebpage);
  case Openflag of
    nwf_NewPage:
      begin
        if NewWebpage <> nil then
          wvw := NewWebpage.WebView;
      end;
    nwf_OpenInCurrent:
      begin
        wvw := TWkeWebbrowser(Sender).WebView;
      end;
    nwf_Cancel:
      begin
        wvw := nil;
      end;
  end;

end;

procedure TWkeApp.loaded;
begin
  inherited;
  if csDesigning in ComponentState then
    exit;
  WkeLoadLibAndInit;
end;

function TWkeApp.CreateWebbrowser(Aparent: TWinControl): TWkeWebbrowser;
var
  r: Trect;
begin
  GetWindowRect(Aparent.Handle, r);
  result := CreateWebbrowser(Aparent, r);
  result.Align := alClient;
end;

function TWkeApp.CreateWebbrowser(Aparent: TWinControl; Ar: Trect): TWkeWebbrowser;
var
  newpage: TWkeWebbrowser;
begin
  newpage := TWkeWebbrowser.Create(Aparent);
  with newpage do
  begin
    parent := Aparent;
    BoundsRect := Ar;
    UserAgent := FUserAgent;
    CspEnabled := FCspEnabled;
    CookieEnabled := FCookieEnabled;
    TouchEnabled := FTouchEnabled;
    DragEnabled := FDragEnabled;
    CookiePath := FCookiePath;
    LocalStoragePath := FLocalStoragePath;
    OnCreateView := DoAppCreateView;
  end;
  FWebPages.Add({$IFNDEF DELPHI15_UP}@{$ENDIF} newpage);
  result := newpage;
end;

procedure TWkeApp.CloseWebbrowser(Abrowser: TWkeWebbrowser);
begin
  FWebPages.Remove(Abrowser);
  Abrowser.Free;
end;

function TWkeApp.GetCookieDir: string;
begin
  result := FCookiePath;
end;

function TWkeApp.GetCookieEnabled: boolean;
begin
  result := FCookieEnabled;
end;

function TWkeApp.GetCspEnabled: boolean;
begin
  result := FCspEnabled;
end;

function TWkeApp.GetDragEnabled: boolean;
begin
  result := FDragEnabled;
end;

function TWkeApp.GetLocalStoragePath: string;
begin
  result := FLocalStoragePath;
end;

function TWkeApp.GetTouchEnabled: boolean;
begin
  result := FTouchEnabled;
end;

function TWkeApp.GetUserAgent: string;
begin
  result := FUserAgent;
end;

procedure TWkeApp.SetCookieDir(const Value: string);
begin
  FCookiePath := Value;
end;

procedure TWkeApp.SetCookieEnabled(const Value: boolean);
begin
  FCookieEnabled := Value;
end;

procedure TWkeApp.SetCspEnabled(const Value: boolean);
begin
  FCspEnabled := Value;
end;

procedure TWkeApp.SetDragEnabled(const Value: boolean);
begin
  FDragEnabled := Value;
end;

procedure TWkeApp.SetLocaStoragePath(const Value: string);
begin
  FLocalStoragePath := Value;
end;

procedure TWkeApp.SetTouchEnabled(const Value: boolean);
begin
  FTouchEnabled := Value;
end;

procedure TWkeApp.SetUserAgent(const Value: string);
begin
  FUserAgent := Value;
end;

end.
