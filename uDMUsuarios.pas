unit uDMUsuarios;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.SqlExpr, Datasnap.Provider,
  Data.DB, Datasnap.DBClient;

type
  TDMUsuarios = class(TDataModule)
    cdsUsuarios: TClientDataSet;
    dspUsuarios: TDataSetProvider;
    sdsUsuarios: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMUsuarios: TDMUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDMBanco;

{$R *.dfm}

end.
