program loads;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, mainform, updf, aboutk;

{$R *.res}

begin
  Application.Title:='Loadshedding';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(Tfmain, fmain);
  Application.CreateForm(Tfupd, fupd);
  Application.CreateForm(Tabk, abk);
  Application.Run;
end.

