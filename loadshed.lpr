program loadshed;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, mainf
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Loadshedding';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(Tfmain, fmain);
  Application.Run;
end.

