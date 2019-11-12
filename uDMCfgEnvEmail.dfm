object DMCfgEnvEmail: TDMCfgEnvEmail
  OldCreateOrder = False
  Height = 234
  Width = 336
  object sdsCfgEnvEmail: TSQLDataSet
    SchemaName = 'postgres'
    Active = True
    CommandText = 'SELECT * FROM CFG_ENVEMAIL'#13#10'ORDER BY ID'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBanco.ConnBanco
    Left = 32
    Top = 32
  end
  object dspCfgEnvEmail: TDataSetProvider
    DataSet = sdsCfgEnvEmail
    Left = 128
    Top = 32
  end
  object cdsCfgEnvEmail: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCfgEnvEmail'
    Left = 216
    Top = 32
  end
end
