object uFrmListPart: TuFrmListPart
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Listagem de Participantes'
  ClientHeight = 211
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 56
    Width = 67
    Height = 13
    Caption = 'C'#243'digo Inicial:'
  end
  object Label2: TLabel
    Left = 25
    Top = 109
    Width = 62
    Height = 13
    Caption = 'C'#243'digo Final:'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 325
    Height = 29
    ButtonHeight = 21
    ButtonWidth = 51
    Caption = 'tbListForn'
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    object tbtnImprimirrListPart: TToolButton
      Left = 0
      Top = 0
      Hint = 'Imprimir'
      Caption = 'Imprimir'
      Enabled = False
      ImageIndex = 0
      OnClick = tbtnImprimirrListPartClick
    end
    object tbtnVisualizarListPart: TToolButton
      Left = 51
      Top = 0
      Hint = 'Visualizar'
      Caption = 'Visualizar'
      ImageIndex = 1
      OnClick = tbtnVisualizarListPartClick
    end
    object tbtnSairListPart: TToolButton
      Left = 102
      Top = 0
      Hint = 'Sair'
      Caption = 'Sair'
      ImageIndex = 2
      OnClick = tbtnSairListPartClick
    end
  end
  object edtListPartCodInicial: TDBEdit
    Left = 175
    Top = 75
    Width = 130
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 1
  end
  object edtListPartCodFinal: TDBEdit
    Left = 176
    Top = 128
    Width = 129
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 2
  end
  object lcbListPartCodInicial: TDBLookupComboBox
    Left = 24
    Top = 75
    Width = 145
    Height = 21
    DataField = 'codigo'
    ListField = 'codigo'
    TabOrder = 3
  end
  object lcbListPartCodFinal: TDBLookupComboBox
    Left = 25
    Top = 128
    Width = 145
    Height = 21
    DataField = 'codigo'
    ListField = 'codigo'
    TabOrder = 4
  end
  object QListPart: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBanco.ConnBanco
    Left = 144
    Top = 160
  end
  object dlgImprimirListPart: TPrintDialog
    Left = 48
    Top = 160
  end
end
