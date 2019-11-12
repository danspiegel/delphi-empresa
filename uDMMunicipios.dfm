object DMMunicipios: TDMMunicipios
  OldCreateOrder = False
  Height = 227
  Width = 340
  object sdsMunicipios: TSQLDataSet
    SchemaName = 'postgres'
    CommandText = 'SELECT * FROM MUNICIPIOS'#13#10'ORDER BY CODIGOIBGE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBanco.ConnBanco
    Left = 32
    Top = 24
  end
  object dspMunicipios: TDataSetProvider
    DataSet = sdsMunicipios
    Left = 128
    Top = 24
  end
  object cdsMunicipios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMunicipios'
    Left = 224
    Top = 24
  end
end
