unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  System.Actions, Vcl.ActnList, ShellAPI;

type
  TuFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Login1: TMenuItem;
    Logout1: TMenuItem;
    Usuarios1: TMenuItem;
    Sair1: TMenuItem;
    stbStatus: TStatusBar;
    Timer1: TTimer;
    Extras1: TMenuItem;
    Cascatear1: TMenuItem;
    FecharTodos1: TMenuItem;
    LadoaLado1: TMenuItem;
    Vertical1: TMenuItem;
    Horizontal1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    ActionMenuSistema: TActionList;
    StatusMenuSistDesab: TAction;
    StatusMenuSistHab: TAction;
    Cadastro1: TMenuItem;
    TabelasOficiais1: TMenuItem;
    TabelaMunicipios1: TMenuItem;
    Fornecedores1: TMenuItem;
    ManutFornec1: TMenuItem;
    UsuariosManutencao1: TMenuItem;
    AlterarSenha1: TMenuItem;
    Configura1: TMenuItem;
    EnviodeEmail1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FecharFormExecute(Sender: TObject);
    procedure Cascatear1Click(Sender: TObject);
    procedure Horizontal1Click(Sender: TObject);
    procedure Vertical1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure FecharTodos1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StatusMenuSistDesabExecute(Sender: TObject);
    procedure StatusMenuSistHabExecute(Sender: TObject);
    procedure TabelaMunicipios1Click(Sender: TObject);
    procedure ManutFornec1Click(Sender: TObject);
    procedure AlterarSenha1Click(Sender: TObject);
    procedure UsuariosManutencao1Click(Sender: TObject);
    procedure EnviodeEmail1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmPrincipal: TuFrmPrincipal;

implementation

{$R *.dfm}

uses uCadPart, uUsuarios, uLogin, uTabMunicipios, uCadastroSenha,
  uCarregamentoDados, uCfgEnvEmail, uFuncoes;

procedure TuFrmPrincipal.Cascatear1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TuFrmPrincipal.EnviodeEmail1Click(Sender: TObject);
begin
  uFrmCfgEnvEmail:= TuFrmCfgEnvEmail.Create(Application);
  uFrmCfgEnvEmail.Show;
end;

procedure TuFrmPrincipal.Fechar1Click(Sender: TObject);
begin
   ActiveMDIChild.Close;
end;

procedure TuFrmPrincipal.FecharFormExecute(Sender: TObject);
begin
  Close;
end;

procedure TuFrmPrincipal.FecharTodos1Click(Sender: TObject);
var
i: integer;
begin
  for i := MDIChildCount-1 downto 0 do
    MDIChildren[i].Close;
end;

procedure TuFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If (MDIChildCount > 0)
      Then FecharTodos1.Click;

  Action:= caFree;
  uFrmPrincipal:= nil;
end;

procedure TuFrmPrincipal.Horizontal1Click(Sender: TObject);
begin
  TileMode:= tbHorizontal;
    Tile
end;

procedure TuFrmPrincipal.Login1Click(Sender: TObject);
var
  Login: TuFrmTelaLogin;
begin
  With Login.Create(nil) do
    Try
      Login.ShowModal;
    Finally
      Free;
    End;
end;

procedure TuFrmPrincipal.Logout1Click(Sender: TObject);
var
  i: integer;
begin
  For i:= MDIChildCount -1 downto 0
    Do MDIChildren[i].Close;

  StatusMenuSistDesab.Execute;
  stbStatus.Panels[0].Text := '';
end;

procedure TuFrmPrincipal.ManutFornec1Click(Sender: TObject);
begin
  If (uFrmCadPart = nil)
    Then begin
      uFrmCadPart:= TuFrmCadPart.Create(Application);
      uFrmCadPart.Show;
  end;
end;

procedure TuFrmPrincipal.AlterarSenha1Click(Sender: TObject);
begin
  If (uFrmPrincipal.stbStatus.Panels[0].Text = 'Usu�rio: MESTRE')
    Then MessageDlg('A senha do usu�rio MESTRE n�o pode ser alterada!', mtWarning, [mbOK], 0)
  Else begin
    uFrmCadastroSenha:= TuFrmCadastroSenha.Create(Application);
    uFrmCadastroSenha.Show;
  end;
end;

procedure TuFrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TuFrmPrincipal.Sobre1Click(Sender: TObject);
//var
//caminho_exec: string;
begin
  //caminho_exec:= 'C:\Program Files\PhotoScape\PhotoScape.exe';
  //ShellExecute(Handle, nil, PChar(caminho_exec), nil, nil, SW_SHOWNORMAL);
  //ShellExecute(Handle, 'Open', 'PhotoScape.exe', nil, 'C:\Program Files\PhotoScape\', SW_SHOWNORMAL);
end;

procedure TuFrmPrincipal.StatusMenuSistDesabExecute(Sender: TObject);
begin
  Logout1.Enabled:= false;
  UsuariosManutencao1.Enabled:= false;
  AlterarSenha1.Enabled:= false;
  ManutFornec1.Enabled:= false;
  Horizontal1.Enabled:= false;
  Vertical1.Enabled:= false;
  Cascatear1.Enabled:= false;
  FecharTodos1.Enabled:= false;
  Sobre1.Enabled:= false;
  TabelaMunicipios1.Enabled:= false;
  EnviodeEmail1.Enabled:= false;
end;

procedure TuFrmPrincipal.StatusMenuSistHabExecute(Sender: TObject);
begin
  Logout1.Enabled:= true;
  UsuariosManutencao1.Enabled:= true;
  AlterarSenha1.Enabled:= true;
  ManutFornec1.Enabled:= true;
  Horizontal1.Enabled:= true;
  Vertical1.Enabled:= true;
  Cascatear1.Enabled:= true;
  FecharTodos1.Enabled:= true;
  TabelaMunicipios1.Enabled:= true;
  EnviodeEmail1.Enabled:= true;
end;

procedure TuFrmPrincipal.TabelaMunicipios1Click(Sender: TObject);
begin
  uFrmTabMunicipios:= TuFrmTabMunicipios.Create(Application);
  uFrmTabMunicipios.Show;
end;

procedure TuFrmPrincipal.Timer1Timer(Sender: TObject);
begin
  stbStatus.Panels[1].Text := TimeToStr(now);
  stbStatus.Panels[2].Text := DateToStr(now);
end;

procedure TuFrmPrincipal.UsuariosManutencao1Click(Sender: TObject);
begin
  If (uFrmUsuarios = nil)
    Then begin
      uFrmUsuarios:= TuFrmUsuarios.Create(Application);
      uFrmUsuarios.Show;
  end;
end;

procedure TuFrmPrincipal.Vertical1Click(Sender: TObject);
begin
  TileMode:= tbVertical;
    Tile
end;

end.
