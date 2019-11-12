unit uDMMunicipios;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr;

type
  TDMMunicipios = class(TDataModule)
    sdsMunicipios: TSQLDataSet;
    dspMunicipios: TDataSetProvider;
    cdsMunicipios: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMunicipios: TDMMunicipios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDMBanco;

{$R *.dfm}

end.
