object uFrmLocPart: TuFrmLocPart
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Localizar Fornecedor'
  ClientHeight = 210
  ClientWidth = 251
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object edtCampoLocalizar: TEdit
    Left = 16
    Top = 43
    Width = 209
    Height = 21
    TabOrder = 0
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 251
    Height = 29
    ButtonHeight = 21
    ButtonWidth = 48
    Caption = 'tbLocalizarFornec'
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 1
    object tbtnBuscarPart: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Localizar'
      Caption = 'Localizar'
      ImageIndex = 0
      OnClick = tbtnBuscarPartClick
    end
    object tbtnAnteriorLocPart: TToolButton
      Left = 48
      Top = 0
      Cursor = crHandPoint
      Hint = 'Anterior'
      Caption = 'Anterior'
      Enabled = False
      ImageIndex = 3
      OnClick = tbtnAnteriorLocPartClick
    end
    object tbtnProximoLocPart: TToolButton
      Left = 96
      Top = 0
      Cursor = crHandPoint
      Hint = 'Pr'#243'ximo'
      Caption = 'Pr'#243'ximo'
      Enabled = False
      ImageIndex = 2
      OnClick = tbtnProximoLocPartClick
    end
    object tbtnSair: TToolButton
      Left = 144
      Top = 0
      Cursor = crHandPoint
      Hint = 'Sair'
      Caption = 'Sair'
      ImageIndex = 1
      OnClick = tbtnSairClick
    end
  end
  object rgBuscarPart: TRadioGroup
    Left = 16
    Top = 70
    Width = 209
    Height = 91
    Caption = 'Buscar Por'
    TabOrder = 2
  end
  object rbCodPart: TRadioButton
    Left = 32
    Top = 96
    Width = 49
    Height = 17
    Caption = 'C'#243'digo'
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object rbRazaoPart: TRadioButton
    Left = 128
    Top = 96
    Width = 81
    Height = 17
    Caption = 'Raz'#227'o Social'
    TabOrder = 4
  end
  object rbCnpjCpfPart: TRadioButton
    Left = 32
    Top = 128
    Width = 64
    Height = 17
    Caption = 'CPF/CNPJ'
    TabOrder = 5
  end
  object rbTelefonePart: TRadioButton
    Left = 128
    Top = 128
    Width = 57
    Height = 17
    Caption = 'Telefone'
    TabOrder = 6
  end
  object cbResultadoExatoPart: TCheckBox
    Left = 16
    Top = 167
    Width = 209
    Height = 17
    Caption = 'Procurar apenas por resultados exatos'
    TabOrder = 7
  end
  object stbLocPart: TStatusBar
    Left = 0
    Top = 191
    Width = 251
    Height = 19
    Panels = <
      item
        Width = 320
      end>
  end
  object dsLocPart: TDataSource
    Left = 184
  end
  object QLocPart: TSQLQuery
    DataSource = dsLocPart
    Params = <>
    Left = 216
    Top = 96
  end
end
