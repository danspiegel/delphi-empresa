unit uCarregamentoDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TuFrmCarregamentoDados = class(TForm)
    pbCarregaDados: TProgressBar;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmCarregamentoDados: TuFrmCarregamentoDados;

implementation

{$R *.dfm}

uses uCadPart;

procedure TuFrmCarregamentoDados.FormCreate(Sender: TObject);
begin
  pbCarregaDados.Position:= pbCarregaDados.Position+1;
  Sleep(90);
end;

end.
