unit uDMPessoas;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider,
  Datasnap.DBClient, Data.DB, Data.SqlExpr;

type
  TDMPessoas = class(TDataModule)
    sdsPessoas: TSQLDataSet;
    cdsPessoas: TClientDataSet;
    dspPessoas: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPessoas: TDMPessoas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDMBanco, uDMRelPart;

{$R *.dfm}

end.
