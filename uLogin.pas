unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Data.FMTBcd, Data.SqlExpr;

type
  TuFrmTelaLogin = class(TForm)
    dsUsuario: TDataSource;
    QLoginSistema: TSQLQuery;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnConfirmarLogin: TButton;
    btnCancelarLogin: TButton;
    procedure btnConfirmarLoginClick(Sender: TObject);
    procedure btnCancelarLoginClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmTelaLogin: TuFrmTelaLogin;
  codigo_usuario: string = 'edtUsuario.Text';

implementation

{$R *.dfm}

uses uDMBanco, uPrincipal, uCarregamentoDados, uDMUsuarios;

procedure TuFrmTelaLogin.btnCancelarLoginClick(Sender: TObject);
begin
  Close;
end;

procedure TuFrmTelaLogin.btnConfirmarLoginClick(Sender: TObject);
begin
  If ((edtUsuario.Text = '') and (edtSenha.Text = ''))
  Then Begin
          MessageDlg('Os campos de usu�rio e senha devem ser preenchidos!', mtInformation, [mbOK],0);
          edtUsuario.SetFocus;
       End
  Else If (edtUsuario.Text = '')
  Then Begin
          MessageDlg('O campo usu�rio deve ser preenchido!', mtInformation, [mbOK],0);
          edtUsuario.SetFocus;
       End
  Else If (edtSenha.Text = '')
  Then Begin
          MessageDlg('O campo senha deve ser preenchido!', mtInformation, [mbOK],0);
          edtSenha.SetFocus;
       End
  Else Begin
        Try
          QLoginSistema.Close;
          QLoginSistema.SQL.Clear;
          QLoginSistema.SQL.Add('SELECT id, senha FROM usuarios WHERE codigo = :usuario and senha = :senha');
          QLoginSistema.ParamByName('usuario').Value:= edtUsuario.Text;
          QLoginSistema.ParamByName('senha').Value:= edtSenha.Text;
          QLoginSistema.Open;

        If not QLoginSistema.IsEmpty
          Then Begin
              uFrmPrincipal.StatusMenuSistHab.Execute;
              uFrmPrincipal.stbStatus.Panels[0].Text := 'Usu�rio: '+codigo_usuario;
              Close;
            End
        Else Begin
              MessageDlg('Usu�rio e/ou senha inv�lido!', mtWarning, [mbOK], 0);
              edtSenha.Text:= '';
              edtSenha.SetFocus;
            End;
        Except
          On e: exception
          Do  MessageDlg(E.Message, mtWarning, [mbOK], 0);
        End;
  End;
end;

procedure TuFrmTelaLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  If Not( key in['0'..'9',#08] )
    Then key:=#0;
end;

procedure TuFrmTelaLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  uFrmTelaLogin:= nil;
end;

end.
