unit uLocPart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Xml.xmldom, Data.DB, Xmlxform, Data.FMTBcd,
  Data.SqlExpr;

type
  TuFrmLocPart = class(TForm)
    edtCampoLocalizar: TEdit;
    ToolBar1: TToolBar;
    tbtnBuscarPart: TToolButton;
    tbtnSair: TToolButton;
    rgBuscarPart: TRadioGroup;
    rbCodPart: TRadioButton;
    rbRazaoPart: TRadioButton;
    rbCnpjCpfPart: TRadioButton;
    rbTelefonePart: TRadioButton;
    tbtnProximoLocPart: TToolButton;
    tbtnAnteriorLocPart: TToolButton;
    cbResultadoExatoPart: TCheckBox;
    stbLocPart: TStatusBar;
    dsLocPart: TDataSource;
    QLocPart: TSQLQuery;
    procedure tbtnSairClick(Sender: TObject);
    procedure tbtnBuscarPartClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbtnProximoLocPartClick(Sender: TObject);
    procedure tbtnAnteriorLocPartClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmLocPart: TuFrmLocPart;

implementation

{$R *.dfm}

uses uDMBanco, uCadPart, uDMPessoas;

procedure TuFrmLocPart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
  uFrmLocPart:= nil;
end;

procedure TuFrmLocPart.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Escape) then
  begin
    Close;
  end;
end;

procedure TuFrmLocPart.tbtnAnteriorLocPartClick(
  Sender: TObject);
begin
  if  QLocPart.Bof then
  begin
    //DMBanco.cdsFornecedor.FindPrior;
    QLocPart.Prior;
    stbLocPart.Panels[0].Text:= 'Participante: ' + uFrmCadPart.edtNomeFantasiaParticipante.Text;
    tbtnProximoLocPart.Enabled:= true;
    tbtnAnteriorLocPart.Enabled:= false;
  end;

  if QLocPart.FindFirst then
  begin
    tbtnAnteriorLocPart.Enabled:= false;
  end;
end;

procedure TuFrmLocPart.tbtnBuscarPartClick(Sender: TObject);
begin
  if (edtCampoLocalizar.Text = '') then
    MessageDlg('O texto para busca deve ser informado.', mtError, [mbOK], 0)
  else if cbResultadoExatoPart.Checked then
  begin
    if rbCodPart.Checked then
    begin
      with QLocPart do
      begin
        Close;
        SQL.Add('SELECT codigo FROM fornecedores WHERE codigo = "'+edtCampoLocalizar.Text+'"');
        Open;
      end;
      //DMBanco.cdsFornecedor.IndexFieldNames:= 'codigo';
      //if (DMBanco.cdsFornecedor.FindKey([edtCampoLocalizar.Text])) then
      if not QLocPart.IsEmpty then
      begin
        tbtnProximoLocPart.Enabled:= true;
        stbLocPart.Panels[0].Text:= 'Participante: ' + uFrmCadPart.edtNomeFantasiaParticipante.Text;
      end
      else
        stbLocPart.Panels[0].Text:= 'NENHUM REGISTRO ENCONTRADO';
    end
    else if rbRazaoPart.Checked then
    begin
      DMPessoas.cdsPessoas.IndexFieldNames:= 'razao';
      if (DMPessoas.cdsPessoas.FindKey([edtCampoLocalizar.Text])) then
      begin
        tbtnProximoLocPart.Enabled:= true;
        stbLocPart.Panels[0].Text:= 'Participante: ' + uFrmCadPart.edtNomeFantasiaParticipante.Text;
      end
      else
        stbLocPart.Panels[0].Text:= 'NENHUM REGISTRO ENCONTRADO';
    end
    else if rbCnpjCpfPart.Checked then
    begin
      DMPessoas.cdsPessoas.IndexFieldNames:= 'numerocnpjcpf';
      if (DMPessoas.cdsPessoas.FindKey([edtCampoLocalizar.Text])) then
      begin
        tbtnProximoLocPart.Enabled:= true;
        stbLocPart.Panels[0].Text:= 'Participante: ' + uFrmCadPart.edtNomeFantasiaParticipante.Text;
      end
      else
        stbLocPart.Panels[0].Text:= 'NENHUM REGISTRO ENCONTRADO';
    end
    else if rbTelefonePart.Checked then
    begin
      DMPessoas.cdsPessoas.IndexFieldNames:= 'telefone';
      if (DMPessoas.cdsPessoas.FindKey([edtCampoLocalizar.Text])) then
      begin
        tbtnProximoLocPart.Enabled:= true;
        stbLocPart.Panels[0].Text:= 'Participante: ' + uFrmCadPart.edtNomeFantasiaParticipante.Text;
      end
      else
        stbLocPart.Panels[0].Text:= 'NENHUM REGISTRO ENCONTRADO';
    end;
  end
  else if not cbResultadoExatoPart.Checked then
  begin
    if rbCodPart.Checked then
    begin
      if (DMPessoas.cdsPessoas.Locate('codigo', edtCampoLocalizar.Text,[loCaseInsensitive,loPartialKey])) then
      begin
        tbtnProximoLocPart.Enabled:= true;
        stbLocPart.Panels[0].Text:= 'Participante: ' + uFrmCadPart.edtNomeFantasiaParticipante.Text;
      end;
    end
    else if rbRazaoPart.Checked then
    begin
      if (DMPessoas.cdsPessoas.Locate('razao', edtCampoLocalizar.Text,[loCaseInsensitive,loPartialKey])) then
      begin
        tbtnProximoLocPart.Enabled:= true;
        stbLocPart.Panels[0].Text:= 'Participante: ' + uFrmCadPart.edtNomeFantasiaParticipante.Text;
      end;
    end
    else if rbCnpjCpfPart.Checked then
    begin
      if (DMPessoas.cdsPessoas.Locate('numerocnpjcpf', edtCampoLocalizar.Text,[loCaseInsensitive,loPartialKey])) then
      begin
        tbtnProximoLocPart.Enabled:= true;
        stbLocPart.Panels[0].Text:= 'Participante: ' + uFrmCadPart.edtNomeFantasiaParticipante.Text;
      end;
    end
    else if rbTelefonePart.Checked then
    begin
      if (DMPessoas.cdsPessoas.Locate('telefone', edtCampoLocalizar.Text,[loCaseInsensitive,loPartialKey])) then
      begin
        tbtnProximoLocPart.Enabled:= true;
        stbLocPart.Panels[0].Text:= 'Participante: ' + uFrmCadPart.edtNomeFantasiaParticipante.Text;
      end;
    end;
  end;
end;

procedure TuFrmLocPart.tbtnProximoLocPartClick(
  Sender: TObject);
begin
  if QLocPart.Eof then
  begin
    QLocPart.Next;
    stbLocPart.Panels[0].Text:= 'Participante: ' + uFrmCadPart.edtNomeFantasiaParticipante.Text;
    tbtnAnteriorLocPart.Enabled:= true;
    tbtnProximoLocPart.Enabled:= false;
  end;
  //if (DMBanco.cdsFornecedor.FindLast) then
  if QLocPart.FindLast then
  begin
    tbtnProximoLocPart.Enabled:= false;
  end;
end;

procedure TuFrmLocPart.tbtnSairClick(Sender: TObject);
begin
  FreeAndNil(uFrmLocPart);
end;

end.
