unit uDMCfgEnvEmail;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr;

type
  TDMCfgEnvEmail = class(TDataModule)
    sdsCfgEnvEmail: TSQLDataSet;
    dspCfgEnvEmail: TDataSetProvider;
    cdsCfgEnvEmail: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCfgEnvEmail: TDMCfgEnvEmail;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDMBanco;

{$R *.dfm}

end.
