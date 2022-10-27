unit ShowStdInMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  TntForms, Dialogs, StdCtrls, TntStdCtrls;

type
  TShowStdInForm = class(TTntForm)
    LogMemo: TTntMemo;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  ShowStdInForm: TShowStdInForm;

implementation

{$R *.dfm}

function Utf8ToWideString(s: AnsiString): WideString;
const
  iSrcCodePage: DWord = 65001;
var
  iLenDest, iLenSrc: Integer;
begin
  iLenSrc:= Length(s);
  iLenDest:= MultiByteToWideChar(iSrcCodePage, 0, PChar(s), iLenSrc, nil, 0); //How much CHARACTERS are needed?
  SetLength(Result, iLenDest);
  if iLenDest > 0 then begin  // Otherwise we get the error ERROR_INVALID_PARAMETER
    if MultiByteToWideChar(iSrcCodePage, 0, PAnsiChar(s), iLenSrc, PWideChar(Result), iLenDest) = 0 then begin
      //GetLastError();
      Result:= '';
    end;
  end;
end;

procedure TShowStdInForm.FormCreate(Sender: TObject);
var
  Buffer: array[1..1000] of Byte;
  Utf8Buffer, Utf8Result: AnsiString;
  ws: WideString;
  StdIn: TStream;
  Count: Integer;
begin
  Utf8Result := '';
  StdIn := THandleStream.Create(GetStdHandle(STD_INPUT_HANDLE));
  Count := StdIn.Read(Buffer, 1000);
  while Count > 0 do begin
    SetString(Utf8Buffer, PAnsiChar(@Buffer[1]), Count);
    Utf8Result := Utf8Result + Utf8Buffer;
    Count := StdIn.Read(Buffer, 1000);
  end;
  StdIn.Free;
  LogMemo.Lines.Text := Utf8ToWideString(Utf8Result);
end;

end.

