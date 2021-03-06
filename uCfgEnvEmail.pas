unit uCfgEnvEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.DB;

type
  TuFrmCfgEnvEmail = class(TForm)
    ToolBar1: TToolBar;
    tbtnGravarCfgEnvEmail: TToolButton;
    tbtnSairCfgEnvEmail: TToolButton;
    gbTipoEnvEmail: TGroupBox;
    rbTipoSmtp: TRadioButton;
    rbTipoMapi: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtServSMTP: TDBEdit;
    edtPortaServSMTP: TDBEdit;
    edtUsuarioServSMTP: TDBEdit;
    edtSenhaServSMTP: TDBEdit;
    dsCfgEnvEmail: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbtnSairCfgEnvEmailClick(Sender: TObject);
    procedure tbtnGravarCfgEnvEmailClick(Sender: TObject);
    procedure edtPortaServSMTPKeyPress(Sender: TObject; var Key: Char);
    procedure dsCfgEnvEmailDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmCfgEnvEmail: TuFrmCfgEnvEmail;

implementation

{$R *.dfm}

uses uDMBanco, uDMCfgEnvEmail;

procedure TuFrmCfgEnvEmail.dsCfgEnvEmailDataChange(Sender: TObject;
  Field: TField);
begin
  DMCfgEnvEmail.cdsCfgEnvEmail.Edit;
end;

procedure TuFrmCfgEnvEmail.edtPortaServSMTPKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Not( key in['0'..'9',#08] )
    Then key:=#0;
end;

procedure TuFrmCfgEnvEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  uFrmCfgEnvEmail:= nil;
end;

procedure TuFrmCfgEnvEmail.tbtnGravarCfgEnvEmailClick(Sender: TObject);
begin
  If rbTipoSmtp.Checked
    Then begin
      If (edtServSMTP.Text = '')
        Then MessageBox(Handle, PChar('O campo Servidor � obrigat�rio.'), 'Aten��o', MB_ICONEXCLAMATION + MB_OK)
      Else If (edtPortaServSMTP.Text = '')
        Then MessageBox(Handle, PChar('O campo Porta � obrigat�rio.'), 'Aten��o', MB_ICONEXCLAMATION + MB_OK)
      Else If (edtUsuarioServSMTP.Text = '')
        Then MessageBox(Handle, PChar('O campo usu�rio � obrigat�rio.'), 'Aten��o', MB_ICONEXCLAMATION + MB_OK)
      Else If (edtSenhaServSMTP.Text = '')
        Then MessageBox(Handle, PChar('O campo senha � obrigat�rio.'), 'Aten��o', MB_ICONEXCLAMATION + MB_OK)
      Else begin
        DMCfgEnvEmail.cdsCfgEnvEmail.Post;
        DMCfgEnvEmail.cdsCfgEnvEmail.ApplyUpdates(0);
        Close;
      end;
  end;
end;

procedure TuFrmCfgEnvEmail.tbtnSairCfgEnvEmailClick(Sender: TObject);
begin
  If (DMCfgEnvEmail.cdsCfgEnvEmail.State in [dsInsert, dsEdit])
    Then begin
      If MessageBox(handle, pChar('As altera��es ainda n�o foram salvas. Deseja salv�-las ?' ), 'Aten��o', MB_ICONQUESTION +  MB_YESNO) = mrYes
        Then tbtnGravarCfgEnvEmail.Click
      Else begin
          DMCfgEnvEmail.cdsCfgEnvEmail.CancelUpdates;
          Close;
        end;
  end;
end;

end.

