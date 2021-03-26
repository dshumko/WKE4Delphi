unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Vcl.StdCtrls,  Langji.Wke.types,
   Langji.Wke.CustomPage , Langji.Wke.WebCore;

type
  TForm1 = class(TForm)
    Button1: TButton;
    WkePopupPage1: TWkePopupPage;
    Memo1: TMemo;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure WkePopupPage1LoadEnd(Sender: TObject; sUrl: string;
      loadresult: wkeLoadingResult);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin

 // Memo1.Text := GetSourceByWke(Edit1.Text, false, 2000);
 Memo1.Text := WkeGetSourceFromUrl(Edit1.Text, 1200);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  WkePopupPage1.ShowwebPage;
  WkePopupPage1.Caption := 'ÀË¼£Èí¼þ';
  WkePopupPage1.LoadUrl(Edit1.Text);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  WkePopupPage1.ClosePage;
end;

procedure TForm1.WkePopupPage1LoadEnd(Sender: TObject; sUrl: string;
  loadresult: wkeLoadingResult);
begin
 Memo1.Lines.Add(surl);
end;

end.

