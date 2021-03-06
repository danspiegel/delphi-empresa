unit uListPart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls,
  Vcl.ToolWin, Data.FMTBcd, Data.DB, Data.SqlExpr, Vcl.Mask;

type
  TuFrmListPart = class(TForm)
    ToolBar1: TToolBar;
    tbtnImprimirrListPart: TToolButton;
    tbtnVisualizarListPart: TToolButton;
    tbtnSairListPart: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    QListPart: TSQLQuery;
    dlgImprimirListPart: TPrintDialog;
    edtListPartCodInicial: TDBEdit;
    edtListPartCodFinal: TDBEdit;
    lcbListPartCodFinal: TDBLookupComboBox;
    lcbListPartCodInicial: TDBLookupComboBox;
    procedure tbtnVisualizarListPartClick(Sender: TObject);
    procedure tbtnSairListPartClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbtnImprimirrListPartClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmListPart: TuFrmListPart;

implementation

{$R *.dfm}

uses uPrincipal, uCadPart, uCarregamentoDados, uDMBanco, uDMRelPart, uDMPessoas;

procedure TuFrmListPart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  uFrmListPart:= nil;
end;

procedure TuFrmListPart.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Escape) then
  begin
    Close;
  end;
end;

procedure TuFrmListPart.tbtnImprimirrListPartClick(Sender: TObject);
begin
  if (dlgImprimirListPart.Execute) then
  begin
    try
      With QListPart
        Do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT codigo, razao, telefone FROM fornecedores');
          SQL.Add('WHERE codigo BETWEEN :CodIniForn AND :CodFimForn');
          SQL.Add('ORDER BY codigo;');
          ParamByName('CodIniForn').AsInteger:= StrToint(lcbListPartCodInicial.Text);
          ParamByName('CodFimForn').AsInteger:= StrToInt(lcbListPartCodFinal.Text);
          Open;
        end;
      DMRelPart.frpParticipante.LoadFromFile('C:\Users\daniel\Desktop\DANIEL\Delphi\Cadastro Empresa\Relatorio\ListagemFornecedores.fr3');
      //uFrmCarregamentoDados:= TuFrmCarregamentoDados.Create(Self);
      //uFrmCarregamentoDados.ShowModal;
      DMRelPart.frpParticipante.Print;
    except
      on e: exception do
      MessageDlg(E.Message, mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TuFrmListPart.tbtnSairListPartClick(Sender: TObject);
begin
  Close;
end;

procedure TuFrmListPart.tbtnVisualizarListPartClick(Sender: TObject);
begin
  if (lcbListPartCodFinal.Text > lcbListPartCodInicial.Text) then
    MessageDlg('O c�digo inicial n�o pode ser menor que o c�digo final.', mtWarning, [mbOK], 0)
  else if (lcbListPartCodInicial.Text = '') then
    MessageBox(handle, pChar('O c�digo inicial deve ser informado!' ), 'Aten��o', MB_ICONERROR +  MB_OK)
  else if (lcbListPartCodFinal.Text = '') then
    MessageBox(handle, pChar('O c�digo final deve ser informado!' ), 'Aten��o', MB_ICONERROR +  MB_OK)
  else
  begin
    try
      With QListPart
        Do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT codigo, razao, telefone FROM fornecedores');
          SQL.Add('WHERE codigo BETWEEN :CodIniForn AND :CodFimForn');
          SQL.Add('ORDER BY codigo;');
          ParamByName('CodIniForn').AsInteger:= StrToint(lcbListPartCodInicial.Text);
          ParamByName('CodFimForn').AsInteger:= StrToInt(lcbListPartCodFinal.Text);
          Open;
        end;
        if not QListPart.IsEmpty then
        begin
          DMPessoas.sdsPessoas.CommandText:= 'SELECT COUNT(codigo) AS REGFORN FROM public.fornecedores WHERE codigo BETWEEN :CodIniForn AND :CodFimForn ORDER BY codigo';
          DMRelPart.frpParticipante.LoadFromFile('C:\Users\daniel\Desktop\DANIEL\Delphi\Cadastro Empresa\Relatorio\RelFornec.fr3');
          //uFrmCarregamentoDados:= TuFrmCarregamentoDados.Create(Self);
          //uFrmCarregamentoDados.ShowModal;
          DMRelPart.frpParticipante.ShowReport;
        end;
    except
      on e: exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

end.
