
unit aboutk;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, Buttons, LCLIntf;

type

  { Tabk }

  Tabk = class(TForm)
      abbut: TButton;
      clse: TButton;
      data: TLabel;
      chlogo: TImage;
      lic: TButton;
      maint: TLabel;
      Memo1: TMemo;
    Notebook1: TNotebook;
    abp: TPage;
    licp: TPage;
    StaticText1: TStaticText;
    ver: TLabel;
    procedure abbutClick(Sender: TObject);
    procedure clseClick(Sender: TObject);
    procedure dataClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure httpClick(Sender: TObject);
    procedure licClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  abk: Tabk;

implementation

{ Tabk }

procedure Tabk.abbutClick(Sender: TObject);
begin
    notebook1.PageIndex:=0;
end;

procedure Tabk.licClick(Sender: TObject);
begin
     notebook1.PageIndex:=1;
end;

procedure Tabk.clseClick(Sender: TObject);
begin
    abk.Close;
end;

procedure Tabk.httpClick(Sender: TObject);
begin
     OpenURL('http://kelvin.freetzi.com');
end;


procedure Tabk.dataClick(Sender: TObject);
begin
     OpenURL('mailto:nventafini@gmx.com?subject=Kelvin');
end;

procedure Tabk.FormActivate(Sender: TObject);
begin
         notebook1.PageIndex:=0;
end;

procedure Tabk.FormCreate(Sender: TObject);
begin

end;


initialization
  {$I aboutk.lrs}

end.

