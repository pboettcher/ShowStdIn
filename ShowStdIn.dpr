program ShowStdIn;

uses
  Forms,
  ShowStdInMain in 'ShowStdInMain.pas' {ShowStdInForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'STDIN';
  Application.CreateForm(TShowStdInForm, ShowStdInForm);
  Application.Run;
end.

