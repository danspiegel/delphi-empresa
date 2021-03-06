unit uCadPart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Data.FMTBcd, Data.SqlExpr, System.Actions, Vcl.ActnList;

type
  TuFrmCadPart = class(TForm)
    tbFornecedores: TToolBar;
    tbtnGravarCadastroFornecedor: TToolButton;
    tbtnCancelarCadastroFornecedor: TToolButton;
    tbtnSairCadastroFornecedor: TToolButton;
    dbgParticipantes: TDBGrid;
    tbtnCriarCadastroFornecedor: TToolButton;
    tbtnListagemFornecedores: TToolButton;
    tbtnExcluirCadastroFornecedor: TToolButton;
    ImageList1: TImageList;
    tbtnLocalizar: TToolButton;
    gbDadosGeraisFornecedores: TGroupBox;
    Label14: TLabel;
    edtCodigoParticipante: TDBEdit;
    edtCnpjCpfParticipante: TDBEdit;
    edtNomeFantasiaParticipante: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    edtRazaoParticipante: TDBEdit;
    edtContatoParticipante: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label16: TLabel;
    cbPaisParticipante: TComboBox;
    gbEnderecoFornecedores: TGroupBox;
    Label1: TLabel;
    edtEnderecoParticipante: TDBEdit;
    Label2: TLabel;
    edtNumeroParticipante: TDBEdit;
    edtComplementoParticipante: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtBairroParticipante: TDBEdit;
    Label5: TLabel;
    dbedtnomemunicipio: TDBEdit;
    Label6: TLabel;
    cbEstadoParticipante: TComboBox;
    Label7: TLabel;
    edtCepParticipante: TDBEdit;
    Label21: TLabel;
    edtDDDParticipante: TDBEdit;
    Label22: TLabel;
    edtTelefoneParticipante: TDBEdit;
    dsPessoas: TDataSource;
    QCodPart: TSQLQuery;
    ActionPart: TActionList;
    StatusEdicaoPart: TAction;
    StatusNormalPart: TAction;
    dblkcbbcodmunicipio: TDBLookupComboBox;
    tStatusBotoes: TTimer;
    tbtnImpForn: TToolButton;
    cbCliente: TCheckBox;
    cbFornecedor: TCheckBox;
    cbTransportadora: TCheckBox;
    cbVendedor: TCheckBox;
    procedure tbtnGravarCadastroFornecedorClick(Sender: TObject);
    procedure tbtnCriarCadastroFornecedorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbtnListagemFornecedoresClick(Sender: TObject);
    procedure tbtnExcluirCadastroFornecedorClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbtnCancelarCadastroFornecedorClick(Sender: TObject);
    procedure tbtnLocalizarClick(Sender: TObject);
    procedure edtCnpjCpfParticipanteKeyPress(Sender: TObject; var Key: Char);
    procedure StatusEdicaoPartExecute(Sender: TObject);
    procedure StatusNormalPartExecute(Sender: TObject);
    procedure tbtnSairCadastroFornecedorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tStatusBotoesTimer(Sender: TObject);
    procedure dsPessoasDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmCadPart: TuFrmCadPart;
  codigo_part: string = 'dbgParticipantes.SelectedField.Text';

implementation

{$R *.dfm}

uses uDMBanco, uDMRelPart, uLocPart, uCarregamentoDados,
  uListPart, uTabMunicipios, uFuncoes, uDMPessoas, uDMMunicipios;


procedure TuFrmCadPart.StatusEdicaoPartExecute(Sender: TObject);
begin
  tbtnCriarCadastroFornecedor.Enabled:= false;
  tbtnGravarCadastroFornecedor.Enabled:= true;
  tbtnCancelarCadastroFornecedor.Enabled:= true;
  tbtnExcluirCadastroFornecedor.Enabled:= false;
  tbtnLocalizar.Enabled:= false;
  tbtnListagemFornecedores.Enabled:= false;
end;

procedure TuFrmCadPart.StatusNormalPartExecute(Sender: TObject);
begin
  tbtnCriarCadastroFornecedor.Enabled:= true;
  tbtnGravarCadastroFornecedor.Enabled:= false;
  tbtnCancelarCadastroFornecedor.Enabled:= false;
  tbtnExcluirCadastroFornecedor.Enabled:= true;
  tbtnLocalizar.Enabled:= true;
  tbtnListagemFornecedores.Enabled:= true;
end;

procedure TuFrmCadPart.dsPessoasDataChange(Sender: TObject; Field: TField);
begin
  StatusEdicaoPart.Execute;
  DMPessoas.cdsPessoas.Edit;
end;

procedure TuFrmCadPart.edtCnpjCpfParticipanteKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#08] )
    Then key:=#0;
end;

procedure TuFrmCadPart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
  uFrmCadPart:= nil;
end;

procedure TuFrmCadPart.FormCreate(Sender: TObject);
begin
  If (DMPessoas.cdsPessoas.IsEmpty)
    Then begin
      tbtnExcluirCadastroFornecedor.Enabled:= false;
      tbtnListagemFornecedores.Enabled:= false;
  end;

end;

procedure TuFrmCadPart.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If (Key = Vk_Escape)
    Then tbtnSairCadastroFornecedor.Click;

end;

procedure TuFrmCadPart.tbtnCancelarCadastroFornecedorClick(
  Sender: TObject);
begin
  DMPessoas.cdsPessoas.CancelUpdates;
  tbtnCancelarCadastroFornecedor.Enabled:= false;
  tbtnGravarCadastroFornecedor.Enabled:= false;
  tbtnCriarCadastroFornecedor.Enabled:= true;
end;

procedure TuFrmCadPart.tbtnCriarCadastroFornecedorClick(Sender: TObject);
begin
   StatusEdicaoPart.Execute;

   {with DMBanco do
    begin
     sdsFornecedor.Close;
     DMBanco.sdsFornecedor.CommandText := 'SELECT MAX(codigo)+1 AS COD FROM FORNECEDORES';
     sdsFornecedor.Open;


     cdsFornecedor.Insert;
     edtCodigoFornecedor.Text := IntToStr(sdsFornecedor.FieldByName('COD').AsInteger);
    end;}
    DMPessoas.cdsPessoas.Insert;
    edtCodigoParticipante.Enabled:= true;
end;

procedure TuFrmCadPart.tbtnExcluirCadastroFornecedorClick(Sender: TObject);
begin
  if (MessageBox(handle, pWideChar('Deseja excluir o fornecedor '+codigo_part+'?'), 'Aten��o', MB_ICONQUESTION + MB_YESNO) = mrYes)  then
  begin
    DMPessoas.cdsPessoas.Delete;
    DMPessoas.cdsPessoas.ApplyUpdates(0);
    dbgParticipantes.Refresh;
    if (DMPessoas.cdsPessoas.IsEmpty) then
    begin
      tbtnExcluirCadastroFornecedor.Enabled:= false;
      tbtnListagemFornecedores.Enabled:= false;
    end;
  end;
end;

procedure TuFrmCadPart.tbtnGravarCadastroFornecedorClick(Sender: TObject);
begin
  if (DMPessoas.cdsPessoas.State in [dsInsert, dsEdit]) then
  begin
    QCodPart.Active:= false;
    QCodPart.SQL.Clear;
    QCodPart.SQL.Add('SELECT codigo FROM fornecedores WHERE codigo = '+codigo_part+'');
    QCodPart.Active:= true;

    if (dbgParticipantes.SelectedField.Text = '') then
    begin
      MessageBox(handle, pChar('O C�digo deve ser preenchido.' ), 'Aten��o', MB_ICONEXCLAMATION +  MB_OK);
      dbgParticipantes.SetFocus;
    end
    else if not QCodPart.IsEmpty then
    begin
      MessageBox(handle, pChar('Esse c�digo j� est� sendo utilizado.' ), 'Aten��o', MB_ICONERROR +  MB_OK);
      dbgParticipantes.SetFocus;
    end
    else if (edtRazaoParticipante.Text = '') then
    begin
      MessageBox(handle, pChar('A Raz�o Social deve ser preenchida.' ), 'Aten��o', MB_ICONEXCLAMATION +  MB_OK);
      edtRazaoParticipante.SetFocus;
    end
    else if (edtNomeFantasiaParticipante.Text = '') then
    begin
      MessageBox(handle, pChar('O Nome Fantasia deve ser preenchido.' ), 'Aten��o', MB_ICONEXCLAMATION +  MB_OK);
      edtNomeFantasiaParticipante.SetFocus;
    end
    else if (edtCnpjCpfParticipante.Text = '') then
    begin
      MessageBox(handle, pChar('O CNPJ/CPF deve ser preenchido.' ), 'Aten��o', MB_ICONEXCLAMATION +  MB_OK);
      edtCnpjCpfParticipante.SetFocus;
    end
    else if (validaCNPJ(edtCnpjCpfParticipante.Text)) then
    begin
      DMPessoas.cdsPessoas.Post;
      DMPessoas.cdsPessoas.ApplyUpdates(0);
      dbgParticipantes.Refresh;
      StatusNormalPart.Execute;
    end;
  end;
end;

procedure TuFrmCadPart.tbtnListagemFornecedoresClick(Sender: TObject);
var
x: integer;
begin
  uFrmListPart:= TuFrmListPart.Create(Application);
  uFrmListPart.ShowModal;
end;

procedure TuFrmCadPart.tbtnLocalizarClick(Sender: TObject);
begin
  uFrmLocPart:= TuFrmLocPart.Create(Application);
  uFrmLocPart.ShowModal;
end;

procedure TuFrmCadPart.tbtnSairCadastroFornecedorClick(Sender: TObject);
begin
  If (DMPessoas.cdsPessoas.State in [dsInsert, dsEdit])
    Then begin
      If MessageBox(handle, pChar('As altera��es ainda n�o foram salvas. Deseja salv�-las ?' ), 'Aten��o', MB_ICONQUESTION +  MB_YESNO) = mrYes
        Then tbtnGravarCadastroFornecedor.Click;
    end
    Else begin
      DMPessoas.cdsPessoas.CancelUpdates;
      Close;
      StatusNormalPart.Execute;
    end;
end;

procedure TuFrmCadPart.tStatusBotoesTimer(Sender: TObject);
begin
  If DMPessoas.cdsPessoas.State in [dsInsert, dsEdit]
    Then StatusNormalPart.Execute
  Else StatusEdicaoPart.Execute;

end;

end.
