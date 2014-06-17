unit updf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, Unix;

type

  { Tfupd }

  Tfupd = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fupd: Tfupd;

implementation

{$R *.lfm}

{ Tfupd }

procedure Tfupd.Button1Click(Sender: TObject);
begin
     close;
end;

end.

