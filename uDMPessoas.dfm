object DMPessoas: TDMPessoas
  OldCreateOrder = False
  Height = 383
  Width = 518
  object sdsPessoas: TSQLDataSet
    SchemaName = 'postgres'
    CommandText = 'SELECT * FROM PESSOAS'#13#10' ORDER BY CODIGO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBanco.ConnBanco
    Left = 40
    Top = 32
  end
  object cdsPessoas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPessoas'
    Left = 224
    Top = 32
  end
  object dspPessoas: TDataSetProvider
    DataSet = sdsPessoas
    Left = 128
    Top = 32
  end
end
