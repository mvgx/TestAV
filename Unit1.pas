unit Unit1;
interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Threading,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)

    Popup1: TPopup;
    bOpenFile: TButton;
    bShowPopup: TButton;
    OpenDialog1: TOpenDialog;
    procedure bOpenFileClick(Sender: TObject);
    procedure bShowPopupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1:        TForm1;


implementation

{$R *.fmx}

procedure TForm1.bOpenFileClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(
  procedure
  var
    p:    array [0..1000] of pointer;
    k:    integer;
    N:    integer;
  begin
    repeat
      for k := 0 to 1000 do begin
        N := random(10000);
        GetMem(p[k], N);
        FillChar(p[k]^, N, random(255));

      end;
      Sleep(1);
      for k := 0 to 1000 do begin
        FreeMem(p[k]);
      end;
    until false;

  end).start;



  OpenDialog1.Execute;
end;

procedure TForm1.bShowPopupClick(Sender: TObject);
begin
  Popup1.IsOpen := true;
end;

end.

