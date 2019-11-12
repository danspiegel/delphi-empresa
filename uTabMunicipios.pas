unit uTabMunicipios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Data.FMTBcd, Data.SqlExpr;

type
  TuFrmTabMunicipios = class(TForm)
    ToolBar1: TToolBar;
    tbtnAtualizarTabMunicipios: TToolButton;
    tbtnSairTabMunicipios: TToolButton;
    rbgOrderTabMunicipios: TRadioGroup;
    rbOrderCodigoTabMunicipios: TRadioButton;
    rbOrderNomeTabMunicipios: TRadioButton;
    dbgMunicipios: TDBGrid;
    dsMunicipios: TDataSource;
    edtLocalizarTabMunicipios: TEdit;
    btnLocalizarTabMunicipios: TButton;
    btnAnteriorTabMunicipios: TButton;
    btnProximoTabMunicipios: TButton;
    rbOrderUFTabMunicipios: TRadioButton;
    QLocMunic: TSQLQuery;
    procedure tbtnSairTabMunicipiosClick(Sender: TObject);
    procedure tbtnAtualizarTabMunicipiosClick(Sender: TObject);
    procedure btnLocalizarTabMunicipiosClick(Sender: TObject);
    procedure btnProximoTabMunicipiosClick(Sender: TObject);
    procedure btnAnteriorTabMunicipiosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbOrderCodigoTabMunicipiosClick(Sender: TObject);
    procedure rbOrderNomeTabMunicipiosClick(Sender: TObject);
    procedure rbOrderUFTabMunicipiosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFrmTabMunicipios: TuFrmTabMunicipios;

implementation

{$R *.dfm}

uses uDMBanco, uCadPart, uDMMunicipios;

procedure TuFrmTabMunicipios.btnAnteriorTabMunicipiosClick(Sender: TObject);
begin
  QLocMunic.Prior;
  btnProximoTabMunicipios.Enabled:= true;

  If QLocMunic.Bof
    Then btnAnteriorTabMunicipios.Enabled:= false;
end;

procedure TuFrmTabMunicipios.btnLocalizarTabMunicipiosClick(Sender: TObject);
begin
  If (edtLocalizarTabMunicipios.Text = '')
    Then MessageBox(handle, pChar('O texto para busca deve ser informado.'), 'Aten��o', MB_ICONEXCLAMATION + MB_OK)
  else begin
    with QLocMunic
      Do begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT nomemunicipio');
        SQL.Add('FROM municipios');
        SQL.Add('WHERE nomemunicipio LIKE '+QuotedStr(edtLocalizarTabMunicipios.Text+'%')+ 'OR nomemunicipio LIKE '+QuotedStr('%'+edtLocalizarTabMunicipios.Text+'%'));
        SQL.Add('OR nomemunicipio LIKE '+QuotedStr('%'+edtLocalizarTabMunicipios.Text));
        SQL.Add('ORDER BY nomemunicipio');
        Open;
    end;

    If not QLocMunic.IsEmpty
      then begin
        DMMunicipios.cdsMunicipios.Locate('nomemunicipio', edtLocalizarTabMunicipios.Text, [loCaseInsensitive, loPartialKey]);
        btnProximoTabMunicipios.Enabled:= true
      end
    else
      MessageDlg('Nenhum registro encontrado.', mtWarning, [mbOK], 0);
  end;
end;

procedure TuFrmTabMunicipios.btnProximoTabMunicipiosClick(Sender: TObject);
begin
  QLocMunic.Next;
  btnAnteriorTabMunicipios.Enabled:= true;

  If QLocMunic.Eof
    Then btnProximoTabMunicipios.Enabled:= false;
end;

procedure TuFrmTabMunicipios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
  uFrmTabMunicipios:= nil;
end;

procedure TuFrmTabMunicipios.rbOrderCodigoTabMunicipiosClick(Sender: TObject);
begin
  DMMunicipios.cdsMunicipios.IndexFieldNames:= 'codigoibge';
  dbgMunicipios.Columns[0].FieldName:= dbgMunicipios.Columns[0].FieldName;
end;

procedure TuFrmTabMunicipios.rbOrderNomeTabMunicipiosClick(Sender: TObject);
begin
  DMMunicipios.cdsMunicipios.IndexFieldNames:= 'nomemunicipio';
  dbgMunicipios.Columns[0].FieldName:= dbgMunicipios.Columns[1].FieldName;
  dbgMunicipios.Columns[1].FieldName:= dbgMunicipios.Columns[0].FieldName;
end;

procedure TuFrmTabMunicipios.rbOrderUFTabMunicipiosClick(Sender: TObject);
begin
  DMMunicipios.cdsMunicipios.IndexFieldNames:= 'estado';
  dbgMunicipios.Columns[0].FieldName:= dbgMunicipios.Columns[2].FieldName;
  dbgMunicipios.Columns[1].FieldName:= dbgMunicipios.Columns[0].FieldName;
  dbgMunicipios.Columns[2].FieldName:= dbgMunicipios.Columns[1].FieldName;
end;

procedure TuFrmTabMunicipios.tbtnAtualizarTabMunicipiosClick(Sender: TObject);
begin
  DMMunicipios.cdsMunicipios.Refresh;
  MessageDlg('A tabela j� est� atualizada.', mtInformation, [mbOK], 0);
end;

procedure TuFrmTabMunicipios.tbtnSairTabMunicipiosClick(Sender: TObject);
begin
  Close;
end;

end.
