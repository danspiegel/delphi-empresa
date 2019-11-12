unit uUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Data.DB, Data.FMTBcd,
  Data.SqlExpr, System.Actions, Vcl.ActnList;

type
  TuFrmUsuarios = class(TForm)
    ToolBar1: TToolBar;
    tbtnCriarUsuario: TToolButton;
    tbtnGravarUsuario: TToolButton;
    tbtnCancelarUsuario: TToolButton;
    tbtnSairUsuario: TToolButton;
    edtNomeUsuario: TDBEdit;
    Label1: TLabel;
    dsCadastroUsuarios: TDataSource;
    dbgUsuario: TDBGrid;
    QVerifLogin: TSQLQuery;
    tbtnExcluirUsuario: TToolButton;
    edtSenhaUsuario: TDBEdit;
    edtConfirmarSenhaUsuario: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    ActionMenuUsers: TActionList;
    StatusEditUser: TAction;
    StatusNormalUser: TAction;
    procedure tbtnSairUsuarioClick(Sender: TObject);
    procedure tbtnCriarUsuarioClick(Sender: TObject);
    procedure tbtnGravarUsuarioClick(Sender: TObject);
    procedure tbtnCancelarUsuarioClick(Sender: TObject);
    procedure dbgUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure tbtnSenhaUsuarioClick(Sender: TObject);
    procedure tbtnExcluirUsuarioClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtSenhaUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtConfirmarSenhaUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure StatusEditUserExecute(Sender: TObject);
    procedure StatusNormalUserExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsCadastroUsuariosDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmUsuarios: TuFrmUsuarios;
  codigo_usuario: string = 'dbgUsuario.SelectedField.Text';

implementation

{$R *.dfm}

uses uDMBanco, uCadastroSenha, uDMUsuarios;

procedure TuFrmUsuarios.edtSenhaUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TuFrmUsuarios.dsCadastroUsuariosDataChange(Sender: TObject;
  Field: TField);
begin
  DMUsuarios.cdsUsuarios.Edit;
  StatusEditUser.Execute;
end;

procedure TuFrmUsuarios.edtConfirmarSenhaUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TuFrmUsuarios.dbgUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= Upcase(Key);
end;

procedure TuFrmUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  uFrmUsuarios:= nil;
end;

procedure TuFrmUsuarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Escape) then
    tbtnSairUsuario.Click;
end;

procedure TuFrmUsuarios.tbtnCancelarUsuarioClick(Sender: TObject);
begin
  DMUsuarios.cdsUsuarios.Cancel;
  StatusNormalUser.Execute;
end;

procedure TuFrmUsuarios.tbtnCriarUsuarioClick(Sender: TObject);
begin
  StatusEditUser.Execute;
  dbgUsuario.ReadOnly:= false;

  With edtSenhaUsuario
    Do Begin
      Enabled:= true;
      Color:= clWindow;
  end;

  With edtConfirmarSenhaUsuario
    Do begin
      Enabled:= true;
      Color:= clWindow;
  end;

  With DMUsuarios
    Do begin
      sdsUsuarios.Open;
      cdsUsuarios.Insert;
      dbgUsuario.SetFocus;
  end;
end;

procedure TuFrmUsuarios.tbtnExcluirUsuarioClick(Sender: TObject);
begin
  If (dbgUsuario.SelectedField.Text = 'MESTRE')
    Then MessageBox(handle, pChar('O usuário MESTRE não pode ser excluído.' ), 'Atenção', MB_ICONEXCLAMATION +  MB_OK)
  Else If (MessageBox(handle, pWideChar ('Deseja excluir o usuário '+codigo_usuario+'?'), 'Atenção', MB_ICONQUESTION + MB_YESNO) = mrYes)
    Then begin
      DMUsuarios.cdsUsuarios.Delete;
      DMUsuarios.cdsUsuarios.ApplyUpdates(0);
      if DMUsuarios.cdsUsuarios.IsEmpty
        Then tbtnExcluirUsuario.Enabled:= false;
  end;
end;

procedure TuFrmUsuarios.tbtnGravarUsuarioClick(Sender: TObject);
begin
  DMUsuarios.cdsUsuarios.Params.ParamByName('idusuario').Value:= codigo_usuario;

  If (DMUsuarios.cdsUsuarios.State in [dsInsert, dsEdit])
    Then begin
      If (dbgUsuario.SelectedField.Text = '')
        Then MessageBox(handle, pChar('O Código deve ser preenchido.' ), 'Atenção', MB_ICONEXCLAMATION +  MB_OK)
      Else If (dbgUsuario.SelectedField.Text <> '')
        Then begin
            With QVerifLogin
              Do begin
                Active:= false;
                SQL.Clear;
                SQL.Add('SELECT idusuario FROM usuario WHERE idusuario = :idusuario');
                Active:= true;
            end;
            If not QVerifLogin.IsEmpty
              Then MessageBox(handle, pChar('O Código já existe.' ), 'Atenção', MB_ICONEXCLAMATION +  MB_OK);
      end
      Else If (edtNomeUsuario.Text = '')
        Then begin
          MessageBox(handle, pChar('O nome deve ser preenchido.' ), 'Atenção', MB_ICONEXCLAMATION +  MB_OK);
          edtNomeUsuario.SetFocus;
      end
      Else If (edtSenhaUsuario.Text = '')
        Then begin
          MessageBox(handle, pChar('A senha deve ser preenchida.' ), 'Atenção', MB_ICONEXCLAMATION +  MB_OK);
          edtSenhaUsuario.SetFocus;
      end
      Else If (edtSenhaUsuario.Text = '')
        Then begin
          MessageBox(handle, pChar('A confirmação da senha deve ser preenchida.' ), 'Atenção', MB_ICONEXCLAMATION +  MB_OK);
          edtConfirmarSenhaUsuario.SetFocus;
      end
      Else If (edtConfirmarSenhaUsuario.Text = edtSenhaUsuario.Text)
        Then begin
          Try
              DMUsuarios.cdsUsuarios.Post;
              DMUsuarios.cdsUsuarios.ApplyUpdates(0);
              StatusNormalUser.Execute;
          Except
            On e: exception
              Do MessageBox(handle, pChar(E.Message), 'Erro', MB_ICONERROR +  MB_OK);
          end;
      end
      Else begin
        MessageBox(handle, pChar('As senhas não correspondem.' ), 'Atenção', MB_ICONEXCLAMATION +  MB_OK);
        edtConfirmarSenhaUsuario.SetFocus;
      end;
  end;
end;

procedure TuFrmUsuarios.tbtnSairUsuarioClick(Sender: TObject);
begin
  If DMUsuarios.cdsUsuarios.State in [dsInsert, dsEdit]
    Then begin
      If MessageBox(handle, pChar('As alterações ainda não foram salvas. Deseja salvá-las ?' ), 'Atenção', MB_ICONQUESTION +  MB_YESNO) = mrYes
        Then tbtnGravarUsuario.Click
      Else begin
          DMUsuarios.cdsUsuarios.CancelUpdates;
          Close;
          StatusNormalUser.Execute;
        end;
  end
  Else Close;
end;

procedure TuFrmUsuarios.tbtnSenhaUsuarioClick(Sender: TObject);
begin
  uFrmCadastroSenha.verificadorsenha:= 2;
  uFrmCadastroSenha:= TuFrmCadastroSenha.Create(Application);
  uFrmCadastroSenha.ShowModal;
end;

procedure TuFrmUsuarios.StatusEditUserExecute(Sender: TObject);
begin
  tbtnCriarUsuario.Enabled:= false;
  tbtnGravarUsuario.Enabled:= true;
  tbtnCancelarUsuario.Enabled:= true;
  tbtnExcluirUsuario.Enabled:= false;
  tbtnSairUsuario.Enabled:= true;
end;

procedure TuFrmUsuarios.StatusNormalUserExecute(Sender: TObject);
begin
  tbtnCriarUsuario.Enabled:= true;
  tbtnGravarUsuario.Enabled:= false;
  tbtnCancelarUsuario.Enabled:= true;
  tbtnExcluirUsuario.Enabled:= true;
  tbtnSairUsuario.Enabled:= true;
end;

end.
