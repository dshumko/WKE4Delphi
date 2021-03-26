unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Langji.Wke.Webbrowser, jpeg, // QWorker,
  Langji.Wke.types, Langji.Wke.lib, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    WkeWebBrowser1: TWkeWebbrowser;
    Button1: TButton;
    Panel1: TPanel;
    Button2: TButton;
    Edit1: TEdit;
    btn_back: TBitBtn;
    btn_forward: TBitBtn;
    Button3: TButton;
    Button4: TButton;
    StatusBar1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure WkeWebBrowser1TitleChange(Sender: TObject; sTitle: string);
    procedure Button1Click(Sender: TObject);
    procedure btn_backClick(Sender: TObject);
    procedure btn_forwardClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure WkeWebBrowser1LoadEnd(Sender: TObject; sUrl: string; loadresult: wkeLoadingResult);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WkeWebBrowser1LoadUrlBegin(Sender: TObject; sUrl: string; out bHook, bHandled: Boolean);
    procedure WkeWebBrowser1LoadUrlEnd(Sender: TObject; sUrl: string; buf: Pointer; len: Integer);
    procedure WkeWebBrowser1AlertBox(Sender: TObject; sMsg: string);
    procedure FormCreate(Sender: TObject);
    procedure WkeWebBrowser1UrlChange(Sender: TObject; sUrl: string);
    procedure WkeWebBrowser1PromptBox(Sender: TObject; sMsg: string;
      var sValue: string; var bresult: Boolean);
  private
    procedure showtip(const s: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn_backClick(Sender: TObject);
begin
  WkeWebBrowser1.GoBack;
end;

procedure TForm1.btn_forwardClick(Sender: TObject);
begin
  WkeWebBrowser1.GoForward;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage(WkeWebBrowser1.GetSource);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  WkeWebBrowser1.LoadUrl(Edit1.Text);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  WkeWebBrowser1.ShowDevTool;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  WkeWebBrowser1.ExecuteJavascript('alert("hello world 中文");');    //
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    WkeWebBrowser1.LoadUrl(Edit1.Text);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 // WkeWebBrowser1.GlobalHttpProxy :='119.101.55.158:40773';
    WkeWebBrowser1.UserAgent :='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/82.0.4059.0 Safari/537.36 Edg/82.0.437.0';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  WkeWebBrowser1.LoadUrl('http://www.langjisoft.com/');

  //  WkeWebBrowser1.LoadFile('F:\Html5\1.html');
end;

procedure TForm1.showtip(const s: string);
begin
  StatusBar1.SimpleText := s;
  OutputDebugString(PChar(s));
end;

procedure TForm1.WkeWebBrowser1AlertBox(Sender: TObject; sMsg: string);
begin
  ShowMessage(sMsg);
end;

procedure TForm1.WkeWebBrowser1LoadEnd(Sender: TObject; sUrl: string; loadresult: wkeLoadingResult);
begin
 //ShowMessage('loadend');
  showtip('loadend:' + sUrl);
  Edit1.Text := WkeWebBrowser1.LocationUrl;
  btn_back.Enabled := WkeWebBrowser1.CanBack;
  btn_forward.Enabled := WkeWebBrowser1.CanForward;
end;

procedure TForm1.WkeWebBrowser1LoadUrlBegin(Sender: TObject; sUrl: string; out bHook, bHandled: Boolean);
begin
  if Pos('.png', sUrl) > 0 then
  begin
    bHandled := True;
   //  bhook:=true;
  end;
end;

procedure TForm1.WkeWebBrowser1LoadUrlEnd(Sender: TObject; sUrl: string; buf: Pointer; len: Integer);
begin
  showtip(sUrl);
end;

procedure TForm1.WkeWebBrowser1PromptBox(Sender: TObject; sMsg: string;
  var sValue: string; var bresult: Boolean);
begin
   if InputQuery('caption',sMsg,sValue ) then
     bresult :=true;
end;

procedure TForm1.WkeWebBrowser1TitleChange(Sender: TObject; sTitle: string);
begin
  Caption := sTitle;
end;

procedure TForm1.WkeWebBrowser1UrlChange(Sender: TObject; sUrl: string);
begin
  showtip('urlChange:' + sUrl);
end;

end.

