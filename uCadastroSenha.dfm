object uFrmCadastroSenha: TuFrmCadastroSenha
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Altera'#231#227'o de Senha'
  ClientHeight = 212
  ClientWidth = 253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 48
    Top = 56
    Width = 81
    Height = 16
    Caption = 'Nova Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 48
    Top = 112
    Width = 112
    Height = 16
    Caption = 'Confirmar Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 253
    Height = 29
    ButtonHeight = 21
    ButtonWidth = 49
    Caption = 'tbCadastroSenha'
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    object tbtnGravarCadastroSenha: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Gravar'
      Caption = 'Gravar'
      ImageIndex = 0
      OnClick = tbtnGravarCadastroSenhaClick
    end
    object tbtnCancelarCadastroSenha: TToolButton
      Left = 49
      Top = 0
      Cursor = crHandPoint
      Hint = 'Cancelar'
      Caption = 'Cancelar'
      ImageIndex = 1
      OnClick = tbtnCancelarCadastroSenhaClick
    end
  end
  object edtNovaSenha: TEdit
    Left = 48
    Top = 78
    Width = 145
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = edtNovaSenhaKeyPress
  end
  object edtConfirmarSenha: TEdit
    Left = 48
    Top = 134
    Width = 145
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    OnKeyPress = edtConfirmarSenhaKeyPress
  end
  object QCadastraUsuario: TSQLQuery
    DataSource = dsCadastroSenha
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBanco.ConnBanco
    Left = 40
    Top = 160
  end
  object dsCadastroSenha: TDataSource
    Left = 144
    Top = 160
  end
end
