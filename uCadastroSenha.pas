unit uCadastroSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Data.FMTBcd, Data.DB, Data.SqlExpr, Vcl.Mask, Vcl.DBCtrls;

type
  TuFrmCadastroSenha = class(TForm)
    ToolBar1: TToolBar;
    tbtnGravarCadastroSenha: TToolButton;
    tbtnCancelarCadastroSenha: TToolButton;
    Label2: TLabel;
    Label3: TLabel;
    QCadastraUsuario: TSQLQuery;
    dsCadastroSenha: TDataSource;
    edtNovaSenha: TEdit;
    edtConfirmarSenha: TEdit;
    procedure tbtnCancelarCadastroSenhaClick(Sender: TObject);
    procedure tbtnGravarCadastroSenhaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtSenhaAtualKeyPress(Sender: TObject; var Key: Char);
    procedure edtNovaSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edtConfirmarSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idusuario, nomeusuario: string;
    verificadorsenha: integer;
  end;

var
  uFrmCadastroSenha: TuFrmCadastroSenha;

implementation

{$R *.dfm}

uses uUsuarios, uDMBanco, uPrincipal, uDMUsuarios;

procedure TuFrmCadastroSenha.edtConfirmarSenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TuFrmCadastroSenha.edtNovaSenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TuFrmCadastroSenha.edtSenhaAtualKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TuFrmCadastroSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
  uFrmCadastroSenha:= nil;
end;

procedure TuFrmCadastroSenha.FormCreate(Sender: TObject);
begin
  DMUsuarios.cdsUsuarios.Edit;
end;

procedure TuFrmCadastroSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Escape) then
  begin
    FreeAndNil(uFrmCadastroSenha);
  end;
end;

procedure TuFrmCadastroSenha.tbtnCancelarCadastroSenhaClick(Sender: TObject);
begin
  DMUsuarios.cdsUsuarios.CancelUpdates;
  Close;
end;

procedure TuFrmCadastroSenha.tbtnGravarCadastroSenhaClick(Sender: TObject);
begin
  If (edtNovaSenha.Text = '')
    Then MessageBox(handle, pChar('Nova senha deve ser preenchida.' ), 'Atenção', MB_ICONEXCLAMATION +  MB_OK)
  Else If (edtConfirmarSenha.Text = '')
    Then MessageBox(handle, pChar('Confirmar senha deve ser preenchido.' ), 'Atenção', MB_ICONEXCLAMATION +  MB_OK)
  Else If (edtNovaSenha.Text = edtConfirmarSenha.Text)
    Then begin
      Try
        With QCadastraUsuario
          Do begin
            SQL.Clear;
            SQL.Add('UPDATE usuario SET senha='+edtConfirmarSenha.Text+' WHERE idusuari='+uFrmPrincipal.stbStatus.Panels[0].Text+'');
            ExecSQL;
        end;
        DMUsuarios.cdsUsuarios.ApplyUpdates(0);
        MessageBox(handle, pChar('Senha alterada com sucesso!' ), 'Atenção', MB_ICONINFORMATION +  MB_OK);
        Close;
      Except
        On e: exception do
        MessageDlg(E.Message, mtError, [mbOK], 0);
      end;
    end
    else
    begin
      MessageBox(handle, pChar('As senhas não correspondem' ), 'Atenção', MB_ICONEXCLAMATION +  MB_OK);
      edtConfirmarSenha.SetFocus;
    end;

end;

end.
