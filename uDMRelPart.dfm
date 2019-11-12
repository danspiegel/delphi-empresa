object DMRelPart: TDMRelPart
  OldCreateOrder = False
  Height = 267
  Width = 396
  object frpParticipante: TfrxReport
    Version = '5.1.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42016.906371238400000000
    ReportOptions.LastChange = 42016.946345868040000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 32
    Top = 24
    Datasets = <
      item
        DataSet = dbdParticipante
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object titulo: TfrxReportTitle
        FillType = ftBrush
        Height = 105.826840000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 37.795300000000000000
          Top = 15.118120000000000000
          Width = 646.299630000000000000
          Height = 75.590600000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            '             Listagem de Fornecedores'
            '                           Sint'#233'tica')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 593.386210000000000000
          Top = 64.252010000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Folha:')
        end
        object SysMemo1: TfrxSysMemoView
          Left = 638.740570000000000000
          Top = 64.252010000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[PAGE#]')
        end
        object SysMemo2: TfrxSysMemoView
          Left = 45.354360000000000000
          Top = 64.252010000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[DATE]')
        end
        object SysMemo3: TfrxSysMemoView
          Left = 132.283550000000000000
          Top = 64.252010000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[TIME]')
        end
      end
      object campos: TfrxPageHeader
        FillType = ftBrush
        Height = 56.692913390000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 41.574830000000000000
          Top = 15.118120000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'C'#243'digo')
        end
        object Memo3: TfrxMemoView
          Left = 196.535560000000000000
          Top = 15.118120000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Raz'#227'o Social')
        end
        object Memo4: TfrxMemoView
          Left = 434.645950000000000000
          Top = 15.118120000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'CNPJ/CPF')
        end
        object Line1: TfrxLineView
          Left = 34.015770000000000000
          Top = 41.574829999999990000
          Width = 646.299630000000000000
          Color = clBlack
          Diagonal = True
        end
      end
      object dados: TfrxMasterData
        FillType = ftBrush
        Height = 37.795275590551200000
        Top = 264.567100000000000000
        Width = 718.110700000000000000
        DataSet = dbdParticipante
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1codigo: TfrxMemoView
          Left = 41.574830000000000000
          Top = 11.338590000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'codigo'
          DataSet = dbdParticipante
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."codigo"]')
        end
        object frxDBDataset1razao: TfrxMemoView
          Left = 196.535560000000000000
          Top = 7.559059999999988000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          DataField = 'razao'
          DataSet = dbdParticipante
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."razao"]')
        end
        object frxDBDataset1numerocnpjcpf: TfrxMemoView
          Left = 434.645950000000000000
          Top = 7.559059999999988000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          DataField = 'numerocnpjcpf'
          DataSet = dbdParticipante
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."numerocnpjcpf"]')
        end
      end
    end
  end
  object dbdParticipante: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = uFrmListPart.QListPart
    BCDToCurrency = False
    Left = 112
    Top = 24
  end
end
