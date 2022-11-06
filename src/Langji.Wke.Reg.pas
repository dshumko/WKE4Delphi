unit Langji.Wke.Reg;

interface

uses
  classes, Langji.Wke.CustomPage, Langji.Wke.App, Langji.Wke.Webbrowser;

procedure Register;

{$R wkelogo.res}

implementation

procedure Register;
begin
  RegisterComponents('Langji.Wke', [TWkeWebBrowser, TWkeApp, TWkeTransparentPage, TWkePopupPage]);
end;

end.
