unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Langji.Wke.WebCore, Langji.Wke.VisualControls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    WkeTransparentPage1: TWkeTransparentPage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Langji.Wke.lib;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  fn: string;
begin
  fn := ExtractFilePath(ParamStr(0)) + 'html\index.html';

  WkeTransparentPage1.ShowWebPage;
  WkeTransparentPage1.LoadFile(fn);

end;



end.

