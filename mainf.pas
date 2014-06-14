unit mainf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ComCtrls, Grids, Unix, laz2_XMLRead, laz2_DOM;

type

  { Tfmain }

  Tfmain = class(TForm)
    egroup: TEdit;
    Image1: TImage;
    incb: TButton;
    groupl: TLabel;
    upb: TButton;
    prevb: TButton;
    groupblabel: TLabel;
    Maintl: TLabel;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    procedure incbClick(Sender: TObject);
    procedure prevbClick(Sender: TObject);

    procedure egroupKeyPress(Sender: TObject; var Key: char);
    procedure egroupKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure upbClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fmain: Tfmain;
  xmlf:  TXMLDocument;
  tnod:  TDOMNode;

  Doc:       TXMLDocument;
  group,day: TDOMNode;
  hour:      TDOMNode;
  c:         smallint = 1;
  l:         smallint = 1;

implementation

{$R *.lfm}

{ Tfmain }

procedure Tfmain.FormCreate(Sender: TObject);
begin
     if FileExistsUTF8('/usr/share/loadshedding/routine.xml') then begin
     ReadXMLFile(Doc, '/usr/share/loadshedding/routine.xml');
     group:= doc.DocumentElement.FindNode('group');
     end;
end;

procedure Tfmain.FormActivate(Sender: TObject);
  begin
       if FileExistsUTF8('/usr/share/loadshedding/routine.xml') then begin
          groupl.Caption:= 'Group ' + group.Attributes.Item[0].NodeValue;

            day:= group.FirstChild;
            while assigned(day) do begin
                  StringGrid1.Cells[0,l]:=
                   day.Attributes.Item[0].NodeValue;

                  hour:= day.FirstChild;
                  while Assigned(hour) do begin;
                        StringGrid1.Cells[c,l]:= hour.FirstChild.TextContent;
                        inc(c);
                  hour:= hour.NextSibling;
                  end;

            day:= day.NextSibling;
            inc(l); c:= 1;
      end;
      l:= 1;
      end;
end;


procedure Tfmain.prevbClick(Sender: TObject);
begin
     if strtoint(group.Attributes.Item[0].NodeValue) > 1 then begin
     group:= group.PreviousSibling;
     FormActivate(nil);
     egroup.Caption:= group.Attributes.Item[0].NodeValue;
     end;
end;

procedure Tfmain.incbClick(Sender: TObject);
begin
     if strtoint(group.Attributes.Item[0].NodeValue) < 7 then begin
     group:= group.NextSibling;
     FormActivate(nil);
     egroup.Caption:= group.Attributes.Item[0].NodeValue;
     end;
end;

procedure Tfmain.egroupKeyPress(Sender: TObject; var Key: char);
begin
     egroup.Clear;
     if not (key in ['1','2','3', '4', '5', '6', '7']) then begin
      key:= #0; egroup.Clear; end;
end;

procedure Tfmain.egroupKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
    l:  smallint = 1;
    a:  string;
begin
     if egroup.Caption <> '' then
     if (strtoint(egroup.Caption) < 1) or (strtoint(egroup.Caption) > 7) then
     egroup.Clear;

     // searching group
     if egroup.Caption <> '' then begin
        a:= egroup.Caption;
        group:= doc.DocumentElement.FindNode('group');
        while group.Attributes.Item[0].NodeValue <> a do begin
              group:= group.NextSibling;
        end;
           FormActivate(nil);
     end;
end;

procedure Tfmain.upbClick(Sender: TObject);
begin
     //SysUtils.ExecuteProcess(UTF8ToSys('sh /usr/share/loadshedding/update.sh'), '', []);
     Shell('sh /usr/share/loadshedding/update.sh');
     ShowMessage('Updated successfully');
     FormCreate(nil); FormActivate(nil);
end;

end.

