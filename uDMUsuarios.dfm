object DMUsuarios: TDMUsuarios
  OldCreateOrder = False
  Height = 213
  Width = 380
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 192
    Top = 24
  end
  object dspUsuarios: TDataSetProvider
    DataSet = sdsUsuarios
    Left = 112
    Top = 24
  end
  object sdsUsuarios: TSQLDataSet
    SchemaName = 'postgres'
    Active = True
    CommandText = 'SELECT * FROM USUARIOS'#13#10'ORDER BY CODIGO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBanco.ConnBanco
    Left = 32
    Top = 24
  end
end
