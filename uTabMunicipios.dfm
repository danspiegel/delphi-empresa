object uFrmTabMunicipios: TuFrmTabMunicipios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Tabela de Munic'#237'pios'
  ClientHeight = 476
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 424
    Height = 29
    ButtonHeight = 21
    ButtonWidth = 49
    Caption = 'tbMunicipios'
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    object tbtnAtualizarTabMunicipios: TToolButton
      Left = 0
      Top = 0
      Caption = 'Atualizar'
      ImageIndex = 0
      OnClick = tbtnAtualizarTabMunicipiosClick
    end
    object tbtnSairTabMunicipios: TToolButton
      Left = 49
      Top = 0
      Caption = 'Sair'
      ImageIndex = 2
      OnClick = tbtnSairTabMunicipiosClick
    end
  end
  object rbgOrderTabMunicipios: TRadioGroup
    Left = 8
    Top = 77
    Width = 412
    Height = 62
    Caption = 'Ordenar Por'
    TabOrder = 1
  end
  object rbOrderCodigoTabMunicipios: TRadioButton
    Left = 41
    Top = 104
    Width = 57
    Height = 17
    Caption = 'C'#243'digo'
    Checked = True
    TabOrder = 2
    TabStop = True
    OnClick = rbOrderCodigoTabMunicipiosClick
  end
  object rbOrderNomeTabMunicipios: TRadioButton
    Left = 200
    Top = 104
    Width = 49
    Height = 17
    Caption = 'Nome'
    TabOrder = 3
    OnClick = rbOrderNomeTabMunicipiosClick
  end
  object dbgMunicipios: TDBGrid
    Left = 0
    Top = 145
    Width = 424
    Height = 330
    DataSource = dsMunicipios
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'codigoibge'
        Title.Caption = 'C'#243'digo IBGE'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomemunicipio'
        Title.Caption = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado'
        Title.Caption = 'UF'
        Width = 44
        Visible = True
      end>
  end
  object edtLocalizarTabMunicipios: TEdit
    Left = 8
    Top = 48
    Width = 169
    Height = 21
    TabOrder = 5
    TextHint = 'Nome'
  end
  object btnLocalizarTabMunicipios: TButton
    Left = 183
    Top = 46
    Width = 75
    Height = 25
    Caption = 'Localizar'
    TabOrder = 6
    OnClick = btnLocalizarTabMunicipiosClick
  end
  object btnAnteriorTabMunicipios: TButton
    Left = 264
    Top = 46
    Width = 75
    Height = 25
    Caption = 'Anterior'
    Enabled = False
    TabOrder = 7
    OnClick = btnAnteriorTabMunicipiosClick
  end
  object btnProximoTabMunicipios: TButton
    Left = 345
    Top = 46
    Width = 75
    Height = 25
    Caption = 'Pr'#243'ximo'
    Enabled = False
    TabOrder = 8
    OnClick = btnProximoTabMunicipiosClick
  end
  object rbOrderUFTabMunicipios: TRadioButton
    Left = 345
    Top = 104
    Width = 33
    Height = 17
    Caption = 'UF'
    TabOrder = 9
    OnClick = rbOrderUFTabMunicipiosClick
  end
  object dsMunicipios: TDataSource
    DataSet = DMMunicipios.cdsMunicipios
    Left = 312
  end
  object QLocMunic: TSQLQuery
    DataSource = dsMunicipios
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBanco.ConnBanco
    Left = 208
  end
end
